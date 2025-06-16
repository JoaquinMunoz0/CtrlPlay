import '../models/game.dart';
import '../models/review.dart';

List<Game> likedGames = [
  Game(
    title: 'The Last Of Us Parte II',
    imageUrl: 'https://howlongtobeat.com/games/41753_The_Last_of_Us_Part_II.jpg?width=250',
    description: 'Cinco años después de su peligroso viaje a través de los Estados Unidos pospandémicos, Ellie y Joel se han establecido en Jackson, Wyoming.',
    reviews: [
      Review(username: "JhonCooper", comment: "Es una obra maestra, uno de los mejores juegos que he jugado en mi vida, una jugabilidad excelente con unos gráficos impresionantes."),
      Review(username: "Sherpo12", comment: "The Last Of Us 2, es un juegazo, así de simple."),
      Review(username: "JOAK03072", comment: "LA MUERTE DE JOEL 😭😭😭😭"),
    ],
  ),
];