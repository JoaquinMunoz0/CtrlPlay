import '../models/game.dart';
import '../models/review.dart';

final List<Game> allGames = [
  Game(
    title: 'The Legend of Zelda: Breath of the Wild',
    imageUrl: 'https://howlongtobeat.com/games/38019_The_Legend_of_Zelda_Breath_of_the_Wild.jpg?width=250',
    description: 'Explora un vasto mundo abierto con libertad total.',
    reviews: [
      Review(username: "RPGQueen", comment: "Una obra maestra que redefine los juegos de mundo abierto."),
      Review(username: "RetroKing", comment: "La exploración es simplemente increíble y llena de sorpresas."),
      Review(username: "ZeldaFan99", comment: "El sistema de física y clima agrega mucha profundidad al juego."),
    ],
  ),
  Game(
    title: 'Elden Ring',
    imageUrl: 'https://howlongtobeat.com/games/68151_Elden_Ring.jpg?width=250',
    description: 'Una épica aventura de fantasía creada por FromSoftware.',
    reviews: [
      Review(username: "ArcadeAddict", comment: "El combate y la narrativa están a otro nivel."),
      Review(username: "ZeldaFan99", comment: "Gran libertad para explorar y crear tu estilo de juego."),
      Review(username: "Legend27", comment: "Un desafío para los fanáticos de los juegos difíciles."),
    ],
  ),
  Game(
    title: 'Red Dead Redemption 2',
    imageUrl: 'https://howlongtobeat.com/games/27100_Red_Dead_Redemption_2.jpg?width=250',
    description: 'Una historia inmersiva del viejo oeste.',
    reviews: [
      Review(username: "OutlawGamer", comment: "El combate y la narrativa están a otro nivel."),
      Review(username: "Cowpoke42", comment: "El mundo abierto es el más realista que he visto."),
      Review(username: "DustyTrails", comment: "Las misiones secundarias son muy entretenidas y variadas."),
    ],
  ),
  Game(
    title: 'The Witcher 3: Wild Hunt',
    imageUrl: 'https://howlongtobeat.com/games/10270_The_Witcher_3_Wild_Hunt.jpg?width=250',
    description: 'Un juego de rol con una narrativa profunda.',
    reviews: [
      Review(username: "MagicSword", comment: "La historia es fascinante y llena de giros inesperados."),
      Review(username: "LoreSeeker", comment: "Los personajes secundarios tienen gran profundidad."),
      Review(username: "WhiteWolf", comment: "El mundo es enorme y lleno de cosas por descubrir."),
    ],
  ),
  Game(
    title: 'Hollow Knight',
    imageUrl: 'https://howlongtobeat.com/games/Hollow_Knight_collection_branding.jpg?width=250',
    description: 'Metroidvania desafiante y atmosférico.',
    reviews: [
      Review(username: "BugKnight", comment: "Excelente diseño de niveles y banda sonora."),
      Review(username: "EchoWanderer", comment: "El combate es fluido y desafiante."),
      Review(username: "DeepnestDiver", comment: "La atmósfera es única y envolvente."),
    ],
  ),
  Game(
    title: 'Celeste',
    imageUrl: 'https://howlongtobeat.com/games/42818_Celeste.jpg?width=250',
    description: 'Una historia de superación personal con plataformas precisas.',
    reviews: [
      Review(username: "CelesteGamer", comment: "La dificultad es perfecta, y la banda sonora me encanta."),
      Review(username: "PixelRunner", comment: "Los niveles son desafiantes pero justos, me mantuvieron enganchado."),
      Review(username: "IndieFan42", comment: "Historia emotiva y un gameplay muy pulido, uno de mis favoritos."),
    ],
  ),
  Game(
    title: 'Stardew Valley',
    imageUrl: 'https://howlongtobeat.com/games/34716_Stardew_Valley.jpg?width=250',
    description: 'Construye tu granja y haz amistades.',
    reviews: [
      Review(username: "FarmLifeLover", comment: "Me encanta lo relajante que es y la cantidad de cosas por hacer."),
      Review(username: "PixelFarmer", comment: "La comunidad dentro del juego y las amistades son lo mejor."),
      Review(username: "CozyGamer", comment: "Perfecto para desconectar y jugar a tu ritmo, muy adictivo."),
    ],
  ),
  Game(
    title: 'Minecraft',
    imageUrl: 'https://howlongtobeat.com/games/6064_Minecraft.jpg?width=250',
    description: 'Crea, explora y sobrevive en mundos infinitos.',
    reviews: [
      Review(username: "BlockBuilder", comment: "Creatividad sin límites y un juego para todas las edades."),
      Review(username: "CraftMaster", comment: "Me encanta la cantidad de mods y servidores que existen."),
      Review(username: "PixelExplorer", comment: "Explorar y construir nunca pasa de moda, un clásico eterno."),
    ],
  ),
  Game(
    title: 'Terraria',
    imageUrl: 'https://howlongtobeat.com/games/9705_Terraria.jpg?width=250',
    description: 'Aventura y construcción en 2D.',
    reviews: [
      Review(username: "PixelWarrior", comment: "Gran variedad de armas y enemigos para todos los gustos."),
      Review(username: "CraftyGamer", comment: "La exploración y el crafting son muy profundos y adictivos."),
      Review(username: "CoopKing", comment: "La diversión en modo cooperativo es lo mejor del juego."),
    ],
  ),
  Game(
    title: 'God of War (2018)',
    imageUrl: 'https://howlongtobeat.com/games/38050_God_of_War.jpg?width=250',
    description: 'Kratos se enfrenta a la mitología nórdica con su hijo.',
    reviews: [
      Review(username: "NorseSaga", comment: "Historia emocional y madura que te atrapa desde el inicio."),
      Review(username: "KratosFan", comment: "Combate espectacular y fluido, muy satisfactorio."),
      Review(username: "EpicGamer", comment: "Gráficos impresionantes que llevan la mitología a otro nivel."),
    ],
  ),
  Game(
    title: 'God of War: Ragnarok',
    imageUrl: 'https://howlongtobeat.com/games/83146_God_of_War_Ragnark.jpg?width=250',
    description: 'Continúa la saga de Kratos y Atreus.',
    reviews: [
      Review(username: "ValhallaHero", comment: "Expande la historia con mucho contenido emocionante."),
      Review(username: "AtreusFan", comment: "Mejoras notables en el combate y la exploración."),
      Review(username: "MythicGamer", comment: "Momentos épicos y una narrativa increíblemente bien lograda."),
    ],
  ),
  Game(
    title: 'Animal Crossing: New Horizons',
    imageUrl: 'https://howlongtobeat.com/games/68240_Animal_Crossing_New_Horizons.png?width=250',
    description: 'Crea tu isla ideal y socializa con tus vecinos.',
    reviews: [
      Review(username: "IslandDreamer", comment: "Muy relajante y creativo, ideal para desconectar."),
      Review(username: "KawaiiCollector", comment: "Perfecto para jugar en familia y hacer amigos."),
      Review(username: "NatureLover", comment: "Eventos y actualizaciones constantes que mantienen el juego fresco."),
    ],
  ),
  Game(
    title: 'Super Mario Odyssey',
    imageUrl: 'https://howlongtobeat.com/games/42833_Super_Mario_Odyssey.png?width=250',
    description: 'Una aventura global junto a Cappy.',
    reviews: [
      Review(username: "MarioFan123", comment: "Diversión sin fin con una gran variedad de mundos."),
      Review(username: "CappyLover", comment: "Diseño creativo y niveles muy bien logrados."),
      Review(username: "GamerGal", comment: "Ideal para todas las edades, me encantó la aventura."),
    ],
  ),
  Game(
    title: 'Super Smash Bros. Ultimate',
    imageUrl: 'https://howlongtobeat.com/games/57513_Super_Smash_Bros_Ultimate.jpg?width=250',
    description: 'Todos los luchadores en un solo juego.',
    reviews: [
      Review(username: "SmashMaster", comment: "Gran variedad de personajes y modos que mantienen el juego fresco."),
      Review(username: "FightFanatic", comment: "Competitivo y muy divertido, perfecto para jugar con amigos."),
      Review(username: "UltimatePlayer", comment: "Una experiencia increíble con muchas horas de juego aseguradas."),
    ],
  ),
  Game(
    title: 'Mario Kart 8 Deluxe',
    imageUrl: 'https://howlongtobeat.com/games/43480_Mario_Kart_8_Deluxe.png?width=250',
    description: 'Carreras con personajes de Nintendo.',
    reviews: [
      Review(username: "Speedster99", comment: "Diversión garantizada para todos los niveles de habilidad."),
      Review(username: "KartKing", comment: "Muchos circuitos y personajes, nunca me aburro de jugar."),
      Review(username: "RacerGirl", comment: "Ideal para jugar en grupo, siempre es una fiesta en la pista."),
    ],
  ),
  Game(
    title: 'Dark Souls III',
    imageUrl: 'https://howlongtobeat.com/games/Dark_souls_3_cover_art.jpg?width=250',
    description: 'Desafíos intensos en un mundo oscuro.',
    reviews: [
      Review(username: "KnightRider", comment: "Difícil pero gratificante, cada victoria sabe a gloria."),
      Review(username: "LoreMaster", comment: "Excelente diseño de niveles y enemigos, el lore es profundo y fascinante."),
      Review(username: "ShadowSlayer", comment: "Desafíos constantes que mantienen la tensión y emoción en todo momento."),
    ],
  ),
  Game(
    title: 'Bloodborne',
    imageUrl: 'https://howlongtobeat.com/games/Bloodborne_Cover_Wallpaper.jpg?width=250',
    description: 'Terror gótico y acción rápida.',
    reviews: [
      Review(username: "GothicHunter", comment: "La atmósfera oscura y terrorífica te atrapa desde el primer momento."),
      Review(username: "FastBlade", comment: "Combate rápido y dinámico, siempre te mantiene alerta."),
      Review(username: "ChaliceExplorer", comment: "Muy desafiante y emocionante, perfecto para los amantes del horror gótico."),
    ],
  ),
  Game(
    title: 'Sekiro: Shadows Die Twice',
    imageUrl: 'https://howlongtobeat.com/games/57415_Sekiro_Shadows_Die_Twice.jpg?width=250',
    description: 'Combate de espadas en el Japón feudal.',
    reviews: [
      Review(username: "ShinobiMaster", comment: "El combate técnico es increíblemente desafiante y satisfactorio."),
      Review(username: "FeudalFan", comment: "La ambientación japonesa está perfectamente lograda, me encantó la historia."),
      Review(username: "StealthNinja", comment: "La rejugabilidad y los desafíos únicos hacen que siempre quiera volver a jugar."),
    ],
  ),
  Game(
    title: 'DOOM Eternal',
    imageUrl: 'https://howlongtobeat.com/games/57506_Doom_Eternal.jpg?width=250',
    description: 'Combate frenético contra hordas demoníacas.',
    reviews: [
      Review(username: "DoomSlayer99", comment: "Acción frenética y adrenalina pura en cada nivel."),
      Review(username: "HeavyMetalFan", comment: "La banda sonora es épica, acompaña perfectamente el ritmo del juego."),
      Review(username: "ShooterPro", comment: "Gran variedad de armas y enemigos que mantienen la experiencia fresca."),
    ],
  ),
  Game(
    title: 'Cyberpunk 2077',
    imageUrl: 'https://howlongtobeat.com/games/Cyberpunk-2077-2.jpg?width=250',
    description: 'Explora Night City como un mercenario cibernético.',
    reviews: [
      Review(username: "NightCityRider", comment: "Historia profunda con personajes muy bien desarrollados."),
      Review(username: "TechnoVibes", comment: "El mundo abierto es impresionante y está lleno de detalles."),
      Review(username: "FixerFan", comment: "Las actualizaciones han mejorado mucho la experiencia de juego."),
    ],
  ),
  Game(
    title: 'Persona 5 Royal',
    imageUrl: 'https://howlongtobeat.com/games/66630_Persona_5_Royal.jpg?width=250',
    description: 'Estudiantes con poderes sobrenaturales contra la corrupción.',
    reviews: [
      Review(username: "PhantomThief", comment: "Narrativa envolvente y personajes inolvidables."),
      Review(username: "ArcanaMaster", comment: "El sistema de combate y social es súper entretenido."),
      Review(username: "TokyoExplorer", comment: "El estilo artístico y la música son una obra de arte."),
    ],
  ),
  Game(
    title: 'Final Fantasy VII Remake',
    imageUrl: 'https://howlongtobeat.com/games/57686_Final_Fantasy_VII_Remake.jpg?width=250',
    description: 'Revive el clásico con acción moderna.',
    reviews: [
      Review(username: "CloudStrife", comment: "Gráficos impresionantes y combate fluido."),
      Review(username: "MateriaMage", comment: "La historia expandida es muy emocionante."),
      Review(username: "MidgarFan", comment: "La música es inolvidable y llena de nostalgia."),
    ],
  ),
  Game(
    title: 'Ghost of Tsushima',
    imageUrl: 'https://howlongtobeat.com/games/51225_Ghost_of_Tsushima.jpg?width=250',
    description: 'Sé un samurái en la invasión mongola.',
    reviews: [
      Review(username: "SamuraiSoul", comment: "Mundo abierto bello y lleno de detalles."),
      Review(username: "WindWalker", comment: "Combate fluido y muy satisfactorio."),
      Review(username: "TsushimaFan", comment: "La historia es emotiva y está muy bien narrada."),
    ],
  ),
  Game(
    title: 'Monster Hunter: World',
    imageUrl: 'https://howlongtobeat.com/games/52493_Monster_Hunter_World.jpg?width=250',
    description: 'Caza monstruos gigantes en equipo.',
    reviews: [
      Review(username: "BeastSlayer", comment: "Gran variedad de monstruos y armas para descubrir."),
      Review(username: "TeamHunt", comment: "El modo cooperativo es súper entretenido y desafiante."),
      Review(username: "HunterPro", comment: "Diseño de niveles excelente y lleno de detalles."),
    ],
  ),
  Game(
    title: 'Apex Legends',
    imageUrl: 'https://howlongtobeat.com/games/64753_Apex_Legends.jpg?width=250',
    description: 'Battle Royale con héroes únicos.',
    reviews: [
      Review(username: "RapidFire", comment: "Jugabilidad rápida y llena de adrenalina."),
      Review(username: "LegendarySniper", comment: "Personajes con habilidades únicas y bien balanceadas."),
      Review(username: "SquadGoals", comment: "La comunidad y los eventos hacen que nunca te aburras."),
    ],
  ),
  Game(
    title: 'Valorant',
    imageUrl: 'https://howlongtobeat.com/games/76906_Valorant.jpg?width=250',
    description: 'Tácticas de disparo en equipo con habilidades.',
    reviews: [
      Review(username: "Tactico123", comment: "Juego competitivo con gran profundidad táctica."),
      Review(username: "SharpShooter", comment: "Personajes bien diseñados y balanceados."),
      Review(username: "EsportsFan", comment: "Buena escena de esports."),
    ],
  ),
  Game(
    title: 'League of Legends',
    imageUrl: 'https://howlongtobeat.com/games/5203_League_of_Legends.jpg?width=250',
    description: 'El MOBA más popular del mundo.',
    reviews: [
      Review(username: "SummonerOne", comment: "Juego con gran comunidad y contenido constante."),
      Review(username: "ChampionMaster", comment: "Gran variedad de campeones y roles."),
      Review(username: "RankedPro", comment: "Competitivo y divertido."),
    ],
  ),
  Game(
    title: 'Overwatch 2',
    imageUrl: 'https://howlongtobeat.com/games/94137_Overwatch_2.jpg?width=250',
    description: 'FPS por equipos con héroes variados.',
    reviews: [
      Review(username: "TeamPlayer", comment: "Jugabilidad en equipo muy entretenida."),
      Review(username: "HeroFan", comment: "Héroes con habilidades únicas."),
      Review(username: "PatchWatcher", comment: "Actualizaciones frecuentes y eventos."),
    ],
  ),
  Game(
    title: 'Fortnite',
    imageUrl: 'https://howlongtobeat.com/games/3657_Fortnite.jpg?width=250',
    description: 'Construcción y batalla en un mundo colorido.',
    reviews: [
      Review(username: "BuilderPro", comment: "Innovador en construcción y disparos."),
      Review(username: "EventLover", comment: "Eventos y colaboraciones constantes."),
      Review(username: "SquadLeader", comment: "Ideal para jugar con amigos."),
    ],
  ),
  Game(
    title: 'Genshin Impact',
    imageUrl: 'https://howlongtobeat.com/games/68133_Genshin_Impact.jpg?width=250',
    description: 'Mundo abierto con elementos de RPG y gacha.',
    reviews: [
      Review(username: "TravelerX", comment: "Gráficos hermosos y mundo amplio."),
      Review(username: "GachaMaster", comment: "Personajes variados y gameplay entretenido."),
      Review(username: "ContentAddict", comment: "Actualizaciones regulares con nuevo contenido."),
    ],
  ),
  Game(
    title: 'Among Us',
    imageUrl: 'https://howlongtobeat.com/games/74207_Among_Us.jpg?width=250',
    description: 'Detecta al impostor en tu tripulación.',
    reviews: [
      Review(username: "Crewmate", comment: "Perfecto para jugar con amigos."),
      Review(username: "SuspectZero", comment: "Sencillo pero muy entretenido."),
      Review(username: "QuickGame", comment: "Ideal para partidas rápidas y sociales."),
    ],
  ),
];
