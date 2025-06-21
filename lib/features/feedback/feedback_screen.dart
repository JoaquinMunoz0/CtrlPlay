import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  List<dynamic> _usabilityQuestions = [];
  List<dynamic> _contentQuestions = [];
  List<dynamic> _sharingQuestions = [];
  bool _isLoading = true;
  bool _isSending = false;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _commentsController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadQuestions();
  }

  Future<void> _loadQuestions() async {
    try {
      final String response = await rootBundle.loadString('lib/assets/preguntas.json');
      final data = json.decode(response);
      
      if (mounted) {
        setState(() {
          _usabilityQuestions = data['usabilidad'] ?? [];
          _contentQuestions = data['contenido'] ?? [];
          _sharingQuestions = data['compartir'] ?? [];
          _isLoading = false;
        });
      }
    } catch (e) {
      debugPrint('Error loading JSON: $e');
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error cargando preguntas: $e')),
        );
      }
    }
  }

  void _updateQuestionValue(List<dynamic> category, int index, double value) {
    if (mounted) {
      setState(() {
        category[index]['valor'] = value.toInt();
      });
    }
  }

  Future<void> _submitFeedback() async {
    if (_nameController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor ingresa tu nombre')),
      );
      return;
    }

    setState(() => _isSending = true);

    try {
      // Construir el cuerpo del correo
      final String body = '''
Nombre: ${_nameController.text}

--- USABILIDAD ---
${_usabilityQuestions.map((q) => '${q['titulo']}\nValoración: ${q['valor']}/5').join('\n\n')}

--- CONTENIDO ---
${_contentQuestions.map((q) => '${q['titulo']}\nValoración: ${q['valor']}/5').join('\n\n')}

--- RECOMENDACIÓN ---
${_sharingQuestions.map((q) => '${q['titulo']}\nValoración: ${q['valor']}/5').join('\n\n')}

Comentarios adicionales:
${_commentsController.text}
''';

      final Uri mailUri = Uri(
        scheme: 'mailto',
        path: 'munosjoaquin0@gmail.com',
        query: _encodeQueryParameters({
          'subject': 'Feedback App Race - ${_nameController.text}',
          'body': body,
        }),
      );

      if (await canLaunchUrl(mailUri)) {
        await launchUrl(mailUri);
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Por favor configura un cliente de correo en tu dispositivo')),
          );
        }
      }
    } catch (e) {
      debugPrint('Error en feedback: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: ${e.toString()}')),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isSending = false);
      }
    }
  }

  String? _encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  Widget _buildQuestionCategory(String title, List<dynamic> questions) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Text(
            title,
            style: GoogleFonts.orbitron(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
        ...questions.asMap().entries.map((entry) {
          final index = entry.key;
          final question = entry.value;
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    question['titulo'],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${question['min']}\n${question['max']}',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Slider(
                    value: question['valor'].toDouble(),
                    min: 0,
                    max: 5,
                    divisions: 5,
                    label: '${question['valor']}',
                    onChanged: (value) => _updateQuestionValue(questions, index, value),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('0', style: TextStyle(color: Colors.grey[600])),
                      Text('5', style: TextStyle(color: Colors.grey[600])),
                    ],
                  ),
                ],
              ),
            ),
          );
        }),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Valoración de la App',
          style: GoogleFonts.orbitron(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ayúdanos a mejorar',
                    style: GoogleFonts.orbitron(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text('Tu opinión es muy importante para nosotros. Por favor valora los siguientes aspectos:'),
                  const SizedBox(height: 24),
                  
                  TextField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      labelText: 'Tu nombre',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.person),
                    ),
                  ),
                  const SizedBox(height: 24),
                  
                  _buildQuestionCategory('USABILIDAD', _usabilityQuestions),
                  _buildQuestionCategory('CONTENIDO', _contentQuestions),
                  _buildQuestionCategory('RECOMENDACIÓN', _sharingQuestions),
                  
                  const SizedBox(height: 16),
                  Text(
                    'Comentarios adicionales',
                    style: GoogleFonts.orbitron(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _commentsController,
                    maxLines: 4,
                    decoration: const InputDecoration(
                      hintText: 'Escribe aquí tus comentarios, sugerencias o problemas encontrados...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  
                  const SizedBox(height: 32),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _isSending ? null : _submitFeedback,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        backgroundColor: theme.colorScheme.primary,
                        foregroundColor: theme.colorScheme.onPrimary,
                      ),
                      child: _isSending
                          ? const CircularProgressIndicator()
                          : const Text(
                              'ENVIAR VALORACIÓN',
                              style: TextStyle(fontSize: 16),
                            ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _commentsController.dispose();
    super.dispose();
  }
}