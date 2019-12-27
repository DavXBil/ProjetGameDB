-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  ven. 08 nov. 2019 à 07:38
-- Version du serveur :  5.7.24
-- Version de PHP :  7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `video_games_archives`
--

-- --------------------------------------------------------

--
-- Structure de la table `developper`
--

DROP TABLE IF EXISTS `developper`;
CREATE TABLE IF NOT EXISTS `developper` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `developper`
--

INSERT INTO `developper` (`id`, `name`) VALUES
(1, 'Bioware'),
(2, 'Red Hook'),
(3, 'Double Helix'),
(4, 'Rockstar Games'),
(5, 'NetheRealm'),
(6, 'Insomniac Games'),
(7, 'The Creative Assembly'),
(8, 'Nintendo'),
(9, 'Capcom'),
(10, 'Bethesda Softworks'),
(11, 'Incog Inc'),
(12, 'Atlus'),
(13, 'Obsidian Entertainment'),
(14, 'Larian Studios'),
(15, 'Ubisoft'),
(16, 'Rare'),
(17, 'SNK'),
(18, 'Rocksteady Studios'),
(19, 'HAL Laboratory'),
(20, 'Sora Ltd'),
(22, 'Midway Manufacturing Company'),
(24, 'Midway'),
(26, 'Naughty Dog'),
(27, 'Platinum Games'),
(28, 'Terminal Reality'),
(29, 'Firaxis Games');

-- --------------------------------------------------------

--
-- Structure de la table `editor`
--

DROP TABLE IF EXISTS `editor`;
CREATE TABLE IF NOT EXISTS `editor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `editor`
--

INSERT INTO `editor` (`id`, `name`) VALUES
(1, 'Electronic Arts'),
(2, 'Red Hook'),
(3, 'Microsoft Studios'),
(4, 'Rockstar Games'),
(5, 'Warner Bros. Interactive Entertainment'),
(6, 'Sony Interactive Entertainment'),
(7, 'Sega'),
(8, 'Nintendo'),
(9, 'Capcom'),
(10, 'Bethesda Softworks'),
(12, 'Atlus'),
(13, 'Konami'),
(14, 'Bandai Namco Games'),
(15, 'Ubisoft'),
(16, 'Tradewest'),
(17, 'SNK'),
(18, 'Eidos Interactive'),
(19, 'Acclaim Entertainment'),
(20, 'Williams Entertainment'),
(21, 'Square Enix'),
(22, 'Activision'),
(23, 'Atari Inc'),
(24, '2K Games');

-- --------------------------------------------------------

--
-- Structure de la table `game`
--

DROP TABLE IF EXISTS `game`;
CREATE TABLE IF NOT EXISTS `game` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8_bin NOT NULL,
  `description` mediumtext COLLATE utf8_bin NOT NULL,
  `dev_id` int(11) NOT NULL,
  `editor_id` int(11) NOT NULL,
  `released_at` year(4) NOT NULL,
  `created_at` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `image` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dev_id` (`dev_id`),
  KEY `editor_id` (`editor_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `game`
--

INSERT INTO `game` (`id`, `name`, `description`, `dev_id`, `editor_id`, `released_at`, `created_at`, `user_id`, `image`) VALUES
(1, 'mass effect', 'Mass Effect est un jeu vidéo de science-fiction de type action-RPG. Le jeu se déroule en 2183, dans un univers où l\'humanité est désormais capable de se déplacer dans la galaxie grâce à l\'effet cosmodésique, connu des autres espèces sous le nom de « Mass Effect », à la suite de découvertes technologiques d\'origine extra-terrestre sur la planète Mars.Mass Effect est le premier épisode d\'une trilogie et le dernier jeu de Bioware avant la fusion avec Electronic Arts.', 1, 1, 2007, '2019-04-02 00:00:00', 1, 'masseffectcover.jpeg'),
(2, 'darkest dungeon', 'Darkest Dungeon est un jeu vidéo de type rogue-like, RPG et dungeon crawler.  Il se caractérise par un univers dark fantasy très noir et une grande difficulté. Darkest Dungeon permet au joueur de contrôler une équipe d\'aventuriers qui explore des donjons. Le jeu intègre un système original de niveau de stress pour chaque héros, lorsque le niveau de stress est trop haut, le héros gagne une affliction permanente qui peut être négative ou parfois positive. La mort d\'un héros est définitive et il n\'est pas possible de charger une sauvegarde, ce qui augmente la difficulté du jeu.', 2, 2, 2016, '2019-04-02 00:00:00', 1, 'darkestdungeon.jpg'),
(3, 'red dead redemption', 'Red Dead Redemption est un jeu vidéo d\'action-aventure en monde ouvert. La majeure partie de l\'intrigue se déroule en 1911 à la fin de l\'époque de la conquête de l\'ouest, dans une ambiance de western crépusculaire. Le jeu met en scène John Marston, un hors-la-loi repenti, contraint de traquer les membres de son ancien gang.', 4, 4, 2010, '2019-04-08 00:00:00', 2, 'redeadredemption.jpg'),
(4, 'mortal kombat 11', 'Mortal Kombat 11 est le onzième volet de la série Mortal Kombat et de la suite de Mortal Kombat X.\r\n\r\nLe jeu possède un nouveau système de personnalisation des personnages, permettant aux joueurs de créer ses propres enchaînements de mouvements et de coups.', 5, 5, 2019, '2019-05-27 00:00:00', 1, 'mk11.jpg'),
(5, 'spider-man (2018)', 'Spider-Man (2018) est un jeu vidéo en développement, sur PlayStation 4, de genre action-aventure, développé en collaboration avec Marvel.\r\n\r\nLe joueur incarne principalement Peter Parker, âgé de 23 ans et scientifique, qui agit comme justicier dans le costume de Spider-Man, dans la ville de New York. L\'histoire du jeu se concentre sur la répression des criminels dans la ville tandis que Peter Parker lutte déjà depuis huit années contre le crime.\r\n\r\nL\'univers du jeu est entièrement créé par Insomniac Games en collaboration avec Marvel Games et ne reprend pas celui des comics et des univers cinématographiques de l\'homme araignée. Certains des personnages du jeu n\'ont, de ce fait, pas le même rôle que dans les comics. Néanmoins, certains lieux associés à l\'univers des comics de Marvel sont présents tels que l\'ambassade du Wakanda et la Tour des Avengers.', 6, 6, 2018, '2019-05-07 00:00:00', 1, 'spiderman18.jpg'),
(6, 'alien isolation', 'Alien: Isolation est un jeu vidéo en vue à la première personne, mettant en avant des éléments d’infiltration et de survival horror. Le joueur se doit d’éviter ou de repousser des créatures aliens, des androïdes ou même des hors-la-lois tout au long du jeu. \r\n\r\nLe jeu se déroule quinze ans après les évènements du film Alien, réalisé par Ridley Scott et sorti en 1979, et suit Amanda Ripley, fille de la protagoniste de la série, Ellen Ripley, dans le but de retrouver des traces de sa mère disparue.', 7, 7, 2014, '2019-05-17 00:00:00', 1, 'alienisolation.jpg'),
(7, 'the legend of zelda : ocarina of time', 'The Legend of Zelda: Ocarina of Time est un jeu vidéo d\'action-aventure.\r\n\r\nOcarina of Time raconte l\'histoire de Link, un jeune garçon vivant dans un village perdu dans la forêt, qui parcourt le royaume d\'Hyrule pour empêcher Ganondorf d\'obtenir la Triforce, une relique sacrée partagée en trois : le courage (Link), la sagesse (Zelda) et la force (Ganondorf). La Triforce, une fois rassemblée, donne à son détenteur des pouvoirs surhumains. Le principal antagoniste du jeu, Ganondorf, la désire pour pouvoir régner sur le monde. Par conséquent, Link devra voyager dans le temps grâce à son ocarina et retrouver les sept sages qui lui permettront d\'enfermer Ganondorf dans un sceau dimensionnel.', 8, 8, 1998, '2019-05-29 08:33:31', 1, 'ocarinaoftime.jpg'),
(8, 'total war: three kingdoms', 'Total War: Three Kingdoms est un jeu vidéo de stratégie au tour par tour et de tactique en temps réel développé par Creative Assembly et publié par Sega prévu pour le 23 mai 2019. Le jeu est le dixième opus de la série classique des Total War (hors trilogie Warhammer) dont il transpose le système de jeu en Chine durant les Chroniques des Trois Royaumes. Comme ses prédécesseurs, le jeu mélange des phases de stratégie au tour par tour, lors desquelles le joueur gère son empire province par province, et des phases d\'affrontements tactiques se déroulant en temps réel dans un environnement en trois dimensions.', 7, 7, 2019, '2019-05-29 08:37:21', 1, 'totalwarthreekingdomsjpg.jpg'),
(9, 'super mario 64', 'Super Mario 64 est un jeu de plates-formes développé par Nintendo Entertainment Analysis and Development sous la direction de Shigeru Miyamoto et publié par Nintendo pour la Nintendo 64. Il sort au Japon et aux États-Unis en 1996 puis en Europe et en Australie en 1997. Épisode de la série des Super Mario, il est un des jeux disponibles au lancement de la console.\r\n\r\nIl est le premier jeu de la série entièrement en 3D temps réel et propose à ce titre une liberté totale de mouvement, de larges niveaux ouverts, et une 3D polygonale en contraste avec les sprites en 2D des Mario précédents. Il conserve également de nombreux éléments du gameplay et de l\'univers des précédents volets.', 8, 8, 1996, '2019-05-31 06:52:14', 1, 'sm64.jpg'),
(10, 'street fighter II', 'Street Fighter II: The World Warrior est un jeu vidéo de combat développé et édité par Capcom, sorti en 1991 sur système d\'arcade CP System, et sujet à diverses adaptations, dont la plus célèbre, sur Super Nintendo. Le jeu fait s\'affronter plusieurs personnages dans des combats en un-contre-un. Le premier joueur mettant KO son adversaire par deux fois, sort victorieux du combat.\r\n\r\nStreet Fighter II propose huit personnages jouables de base et huit styles de combats différents, un système de jeu rapide et novateur, et des graphismes et une bande sonore riches et variés. Street Fighter II s\'est imposé comme la référence des jeux de combat en plus d\'en être l\'un des pionniers.\r\n\r\nL\'adaptation du jeu sur Super Nintendo fit vendre à elle seule des millions d\'exemplaires de ladite console. Le jeu s\'est vendu en tout à plus de douze millions d\'exemplaires, en faisant l\'un des plus prolifiques de l\'Histoire.', 9, 9, 1992, '2019-05-31 06:58:55', 1, 'streetfighter2.jpg'),
(11, 'the elder scrolls IV : oblivion', 'The Elder Scrolls IV: Oblivion est un jeu vidéo de rôle, développé par Bethesda Game Studios et édité par 2K Games. C\'est le quatrième opus de la série de jeux The Elder Scrolls. Oblivion (du nom du monde parallèle habité par les Daedras, qui s\'ouvrira au joueur au cours de la quête principale) se déroule dans la province de Cyrodiil, le cœur politique de l\'empire de Tamriel qui est principalement habité par les impériaux.\r\n\r\nDans cet épisode, le héros doit aider l\'héritier du trône, Martin Septim, à monter sur le trône de son père assassiné et éviter ainsi à l\'empire de tomber aux mains malveillantes de Mehrunes Dagon, prince daedrique du chaos.', 10, 10, 2006, '2019-06-05 06:25:48', 1, 'oblivion.jpg'),
(12, 'the elder scrolls V: skyrim', 'The Elder Scrolls V: Skyrim (souvent abrégé en Skyrim) est un jeu vidéo de rôle et d\'action développé par Bethesda Game Studios et édité par Bethesda Softworks. C\'est le cinquième opus de la série de jeux The Elder Scrolls, après Arena, Daggerfall, Morrowind et Oblivion.', 10, 10, 2011, '2019-06-05 06:33:23', 1, 'skyrim.jpg'),
(13, 'war of the monsters', 'War of the Monsters est un jeu vidéo de combat en 3D pour la PlayStation 2 développé par Incognito Entertainment et édité par Sony Computer Entertainment. Le jeu est sorti le 14 janvier 2003 en Amérique du Nord, le 17 avril 2003 en Europe et le 25 mars 2004 au Japon.\r\n\r\nLe jeu se déroule à la suite d’une invasion extra-terrestre de la Terre, où leur combustibles dangereux ont donné naissance à des monstres géants, qui se combattent les uns les autres dans des environnements urbains. Le jeu fait penser à de la science-fiction des années 1950, rendant hommages aux films du genre.', 11, 6, 2003, '2019-10-01 08:51:00', 1, 'warofmonsters.jpg'),
(14, 'dragon age : origins', 'Dragon Age: Origins est un jeu vidéo de rôle développé par BioWare et édité par Electronic Arts, le premier de la série Dragon Age.\r\n\r\nSe déroulant dans un univers de heroic fantasy, il est présenté comme le descendant spirituel de Baldur’s Gate. À noter que contrairement à ce dernier, le jeu n’utilisera pas les règles du jeu de rôle Donjons et Dragons.', 1, 1, 2009, '2019-06-05 07:58:43', 1, 'dragonageorigins.jpg'),
(15, 'dragon age 2', 'Dragon Age 2 est la suite du jeu vidéo Dragon Age: Origins. Le jeu est sorti le 8 mars 2011 aux États-Unis et le 11 mars 2011 en France.\r\n\r\nDans Dragon Age 2, le personnage principal porte le nom de Hawke. Pendant que les Gardes des ombres se battaient contre les Engeances dans Dragon Age: Origins, Hawke vivait à Lothering, un petit village ayant fait l\'objet d\'un assaut de la part des engeances. Au lieu de se battre, Hawke quitte Ferelden et trouve refuge de l\'autre côté de la mer au nord de Ferelden, plus précisément dans la ville de Kirkwall. Ce réfugié sans le sou est appelé à devenir le héros le plus important du monde de Dragon Age. L\'histoire se déroule sur une période de 8 ans.', 1, 1, 2011, '2019-06-05 08:07:46', 1, 'dragonage2.jpg'),
(16, 'total war: warhammer', 'Total War: Warhammer est un jeu de stratégie au tour par tour et de tactique en temps réel développé par Creative Assembly et publié par Sega le 24 mai 2016. Les versions macOS et Linux ont été développées et publiées par Feral Interactive. Son système de jeu s\'inspire de celui de la série Total War, dont l\'univers se base cette fois-ci sur le jeu de plateau Warhammer, créé par Games Workshop. Quatre factions sont disponibles à la sortie du jeu : les Peaux-Vertes, l\'Empire des hommes, les Nains et les Comtes Vampires. S\'ajoutent également les Guerriers du Chaos pour les joueurs qui ont pré-commandé le jeu, ou qui l\'ont acheté durant la première semaine de lancement.', 7, 7, 2016, '2019-06-13 07:37:57', 1, 'twwarhammer.jpg'),
(17, 'total war: warhammer II', 'Total War: Warhammer 2 est un jeu de stratégie au tour par tour et de tactique en temps réel développé par Creative Assembly et édité par Sega, sorti le 28 septembre 2017. Le jeu fait partie de la série Total War et est la suite de Total War: Warhammer sorti en 2016.\r\n\r\nIl introduit quatre races : les Hommes-Lézards, les Haut-Elfes, les Elfes Noirs et les Skavens. Le studio de développement a annoncé que les cartes de Total War: Warhammer et Total War: Warhammer 2 pourront être fusionnées gratuitement pour créer une campagne gigantesque quelques semaines après la sortie du jeu.', 7, 7, 2017, '2019-06-13 07:39:57', 1, 'twwarhammerii.jpg'),
(18, 'total war: shogun II', 'Total War: Shogun 2 est un jeu de stratégie au tour par tour et de tactique en temps réel développé par Creative Assembly et publié par Sega en mars 2011. Le jeu est le septième opus de la série des Total War se caractérisant par son mélange entre des phases de stratégie au tour par tour, lors desquels le joueur gère son empire province par province, et des phases d\'affrontements tactiques se déroulant en temps réel dans un environnement en trois dimensions. Le jeu se déroule dans le Japon féodal du xvie siècle, peu après la guerre d\'onin, le joueur incarnant un daimyo – un seigneur de guerre japonais – tentant de conquérir le pays et d’en devenir le shogun. Pour cela, le joueur peut faire appel à la puissance de son armée mais aussi à la religion, à l’espionnage, à la diplomatie et à l’économie.', 7, 7, 2011, '2019-06-13 07:45:44', 1, 'twshogunii.jpg'),
(19, 'total war: rome II', 'Total War: Rome II est un jeu vidéo de stratégie développé par The Creative Assembly et édité par Sega, pour Windows. Il constitue le huitième épisode de la série Total War, et est la suite de Rome: Total War. Comme pour son aîné Rome: Total War, le jeu se déroule durant l\'Antiquité romaine, de la création de la République romaine jusqu\'à la fondation de l\'Empire. Le souhait des développeurs est d\'exposer plusieurs visions de l\'Antiquité, de la part des Celtes, des Grecs, des Phéniciens. Le jeu dispose d\'une carte de campagne plus étendue que dans Rome: Total War : en dehors des zones d\'extensions de l\'Empire romain et de leurs environs, de nouveaux territoires à l\'est sont disponibles. Ainsi, la carte s\'étend de la Bretagne à la Bactrie, en passant par le bassin méditérannéen, la Germanie, l\'Arabie et la Perse. Un nouveau système graphique permet de suivre les soldats individuellement sur le champ de bataille.', 7, 7, 2013, '2019-06-13 07:49:44', 1, 'twromeii.jpg'),
(20, 'fallout new vegas', 'Fallout: New Vegas est un  jeu de rôle développé par Obsidian Entertainment et édité par Bethesda works. Il fait partie de la série Fallout, qui se déroule dans un monde post-apocalyptique. L\'action se déroule en 2281, quatre ans après les évènements de Fallout 3.\r\n\r\nCependant, le scénario de Fallout: New Vegas n\'est en aucune façon relié à celui de Fallout 3, et se situe plutôt dans la continuité de Fallout 2. La République de Nouvelle Californie y joue un rôle important. On retrouve aussi dans le jeu des éléments liés à Van Buren, l\'épisode de Fallout annulé, comme le Barrage Hoover, la légion de Caesar, Arcade Gannon ou encore Joshua Graham.', 13, 10, 2010, '2019-06-13 08:29:34', 1, 'falloutnewvegas.jpg'),
(21, 'divinity : original sin II', 'Divinity: Original Sin II est un jeu vidéo de rôle développé et édité par Larian Studios, qui a été partiellement financé par financement participatif par le biais du site Kickstarter. Il est sorti le 14 septembre 2017, bien qu\'il ait été disponible en accès anticipé à partir du 15 septembre 2016. Il appartient à la série des jeux Divinity. \r\nIl s\'agit d\'un jeu de rôle isométrique avec un fort aspect tactique, dont les combats se déroulent au tour par tour. Le jeu propose de personnaliser l\'apparence et les compétences de quatre personnages principaux (contre deux seulement et jusqu\'à deux suivants dans le premier opus). Ces personnages peuvent être contrôlés ensemble par le même joueur ou individuellement dans le mode multijoueur.', 14, 14, 2017, '2019-09-06 05:54:30', 1, 'divinityoriginalsin2.jpg'),
(22, 'tom clancy\'s splinter cell: pandora tomorrow', 'Tom Clancy\'s Splinter Cell: Pandora Tomorrow est un jeu vidéo d\'infiltration, développé par Ubisoft Shanghai et Ubisoft Annecy.\r\nLe gameplay reprend en grande partie celui de Splinter Cell, et ajoute de nouveaux mouvements, plus fluides, de nouveaux décors, et une remise à neuf de l\'inventaire ainsi que de l\'interface. Une nouveauté ; la possibilité d\'ouvrir les portes avec un coup d\'épaules ou de pouvoir utiliser certains gadgets à l\'approche de certains objets (par exemple utiliser la fibre optique à l\'approche des portes).\r\nLe mode « Versus » de Pandora Tomorrow est un jeu complet, indépendant du mode solo, développé par l\'équipe Ubisoft d\'Annecy.\r\n\r\nLe jeu propose un gameplay novateur et abouti : une équipe de 2 espions (Spy) affronte une équipe de 2 mercenaires (Merc) pour des parties d\'un tout nouveau genre. Les Mercs sont armés, et doivent défendre leur « base » des attaques des Spy qui eux n\'ont pas d\'armes létales, mais qui ont des possibilités de déplacement bien plus vastes. De plus des « gadgets » sont aussi de la partie : au début du round, les Merc et les Spy ont la possibilité de choisir certains équipements, pour s\'adapter à la carte, ou au style de jeu de l\'équipe d\'en face. Ce qui apporte un renouveau à chaque partie. Enfin, les cartes multijoueurs font montre d\'un level design d\'un rare niveau de finition', 15, 15, 2004, '2019-09-06 06:17:45', 1, 'splintercellpandoratomorrow.jpg'),
(23, 'killer instinct (2013)', 'Killer Instinct est un jeu vidéo de combat développé par Double Helix Games, Rare et Microsoft Studios sous la supervision de Ken Lobb. Annoncé durant la conférence de presse de Microsoft lors de l\'E3 2013, le jeu est disponible au téléchargement sur Xbox One lors du lancement de la console, le 22 novembre 2013 en Europe et en Amérique du Nord et le 4 septembre 2014 au Japon. Il s\'agit du troisième volet de la série Killer Instinct.\r\nDe nouveaux protagonistes rejoignent le jeu, en plus de tous les personnages des premiers épisodes de Killer Instinct, comme Sadira, assassin travaillant pour ARIA qui est la PDG d\'Ultratech, Omen qui est le héraut de Gargos, Hisako, fantôme gardienne des portails entre la Terre et les cieux, ou encore Kilgore, le prototype de Fulgore. Au fur et à mesure, d\'autres personnages apparaissent, tel que le golem Aganos, le sorcier responsable de la résurrection de Eyedol : Kan-Ra et dernièrement, le petit frère de Thunder, Eagle.', 3, 3, 2013, '2019-09-06 06:42:51', 1, 'ki2013.jpg'),
(24, 'killer instinct', 'Killer Instinct est un jeu vidéo de combat, développé par le studio anglais Rare associé avec Midway et Nintendo en 1994. Ce jeu fait partie de la série Killer Instinct. Le jeu est sorti en France sur Super Nintendo le 4 octobre 1995.\r\nLa société Ultratech est une des mégacorporations les plus puissantes de la planète. Spécialisée dans la communication, la recherche, la fabrication et la vente d\'armes, son influence est quasi-incontournable. Parmi les événements médiatiques annuels les plus suivis trône le Tournoi Killer Instinct, produit par Ultratech et au cours duquel les dernières innovations technologiques, projets scientifiques et autres découvertes sont testées, lors de combats à mort. 11 protagonistes sont inscrits à cette nouvelle édition, un seul décrochera la victoire.\r\nLa plus grosse innovation de Killer Instinct porte sans aucun doute sur son système de jeu. La richesse des coups était impressionnante pour l\'époque (par opposition au hit Street Fighter 2). En effet, un certain nombre de « conventions » propre au jeu de combat avaient pu être mises en place par Capcom (rounds, combinaisons de touches...). Pour Killer Instinct, les développeurs ont supprimé les rounds afin de rendre les combats plus fluides, le joueur disposant simplement d\'une double barre de vie. À l\'heure actuelle, Killer Instinct est le seul jeu vidéo de combat qui ne repose pas sur des victoires par rounds. Les affrontements sont dynamisés par un système de combos lui aussi extrêmement novateur pour ce type de jeu. Si plusieurs combinaisons de touches sont toujours nécessaires afin de manier les personnages, l\'enchaînement de plusieurs combinaisons permettent l\'apparition de nouveaux mouvements.', 16, 3, 1994, '2019-09-06 07:04:04', 1, 'ki1994.jpg'),
(25, 'battletoads', 'Battletoads est un jeu vidéo de type beat them all créé par Tim et Chris Stamper et développé par Rare. Il a tout d\'abord été publié sur la NES en 1991 puis a été porté sur de nombreuses autres plates-formes. Le jeu met en scène deux crapauds, Rash et Zitz, partis combattre la Reine Noire et ses lieutenants sur la planète Ragnarok afin de sauver leurs amis kidnappés, Pimple et la princesse Angelica.\r\n\r\nAlors que le marché du jeu vidéo accueillait les consoles 16 bits, Battletoads est sans doute l\'un des jeux vidéo les plus avancés graphiquement sortis sur NES. Le jeu est devenu célèbre pour son extrême difficulté, due en particulier aux niveaux de courses et d\'obstacles, et les moyens humoristiques de combattre les ennemis.', 16, 16, 1991, '2019-09-06 08:30:55', 1, 'battletoads1991.jpg'),
(26, 'samurai shodown IV: amakusa\'s revenge', 'Samurai Shodown IV: Amakusa\'s Revenge (サムライスピリッツ天草降臨, Samurai Supirittsu: Amakusa Kōrin?) est un jeu vidéo de combat développé et édité par SNK en 1996.\r\nSamurai Shodown IV est composé de 17 combattants, marquant le retour de Charlotte, de Tam-Tam et de Jubei et accueille également Kazuki Kazama et Sogetsu Kazama comme nouveaux personnages. Sogetsu se bat avec la maîtrise de l\'élément de l\'eau et Kazuki, avec l\'élément du feu4. Les modes Slash et Bust présents dans Samurai Shodown III: Blades of Blood sont conversés dans ce quatrième épisode.', 17, 17, 1996, '2019-09-07 07:48:14', 1, 'samuraishodowniv.jpg'),
(27, 'the legend of zelda: link\'s awakening', 'The Legend of Zelda: Link\'s Awakening (ou simplement Link\'s Awakening) est un jeu d\'action-aventure développé et édité par Nintendo le 6 juin 1993 au Japon sur Game Boy, puis en août 1993 aux États-Unis et en décembre 1993 en Europe. Il s\'agit du quatrième épisode de la série The Legend of Zelda.\r\n\r\nLink rentre en bateau vers Hyrule, mais une tempête coule son embarcation. Il s\'échoue sur l\'île Cocolint, où il doit trouver le Poisson-rêve, le seul être qui puisse l\'aider à partir de cette île. Il s\'avère que l\'île et ses habitants ne sont qu\'une illusion produite par le Poisson-rêve, endormi et enfermé dans un œuf géant posé sur le mont Tamaranch. Link doit le réveiller pour mettre fin à ces cauchemars. Durant le jeu, Link se déplace dans une carte du monde affichée en vue de dessus, mais explore également plusieurs donjons labyrinthiques pour la plupart souterrains afin de trouver les objets lui permettant d\'avancer dans sa quête, qui consiste à trouver les huit instruments de musique des sirènes, qui vont lui permettre de réveiller le Poisson-rêve. La princesse Zelda, Ganon, et la Triforce ne figurent pas dans cet épisode.\r\n\r\nLink\'s Awakening est d\'abord développé officieusement par Kazuaki Morita après ses heures de travail, dans le but de tester les capacités de la Game Boy. Il est rejoint dans ce « club de loisirs » par Takashi Tezuka, qui fait officialiser le projet. Au départ, le jeu est pensé comme un portage direct du précédent épisode, A Link to the Past, il est donc très similaire à celui-ci du point de vue des graphismes comme du gameplay. L\'équipe ayant travaillé sur ce précédent opus est quasiment reconstituée. Le jeu en diffère sur certains aspects par des particularités très marquées, en particulier un humour loufoque, renforcé par les caméos de très nombreux personnages de l\'univers de Nintendo, notamment des ennemis de la série Super Mario Bros., et une ambiance parfois dramatique. Il intègre des séquences de jeu se déroulant en vue latérale directement inspirées de ce dernier.', 8, 8, 1993, '2019-09-07 07:58:57', 1, 'linksawakening.jpg'),
(28, 'batman: arkham asylum', 'Batman: Arkham Asylum est un jeu vidéo d\'action-aventure développé par Rocksteady Studios et édité par Eidos Interactive, sorti en 2009 sur PlayStation 3, Xbox 360, PC et en 2016 sur Playstation 4 et Xbox One via la compilation Batman: Return to Arkham2. Il met en scène le personnage de Batman.\r\n\r\nPeu après sa sortie, le jeu entre dans le Livre Guinness des records avec la distinction de « jeu de super-héros le mieux noté de tous les temps par la presse spécialisée ».\r\n\r\nLe jeu est le premier de la licence Batman Arkham, comprenant Batman: Arkham City sorti en 2011, Batman: Arkham Origins en 2013, et Batman: Arkham Knight, qui est sorti le 23 juin 2015.', 18, 18, 2009, '2019-09-08 06:32:47', 1, 'batman_arkham_asylum_cover.jpg'),
(29, 'super smash bros', 'Super Smash Bros. (ニンテンドー•オール•スター! 大乱闘 スマッシュ•ブラザーズ, Nintendō Ōru Sutā! Dairantō Sumashu Burazāzu, litt. Nintendo All-Star! Melee Smash Brothers) est un jeu vidéo de combat, développé par HAL Laboratory et édité par Nintendo pour la Nintendo 64. Il est sorti au Japon le 21 janvier 1999, en Amérique du Nord le 26 avril 1999 et en Europe le 19 novembre 1999. Super Smash Bros. est le premier jeu de la série éponyme et est suivi par Super Smash Bros. Melee sur GameCube en 2001, Super Smash Bros. Brawl sur Wii en 2008, Super Smash Bros. for Nintendo 3DS / for Wii U en 2014 et Super Smash Bros. Ultimate sur Nintendo Switch en 2018. Super Smash Bros. est ressorti sur Console virtuelle au Japon le 20 janvier 2009, en Europe le 12 juin 2009, et en Amérique du Nord le 21 décembre 2009.\r\n\r\nLe titre est un crossover réunissant plusieurs franchises de Nintendo, comme Mario, The Legend of Zelda et Kirby. Super Smash Bros. a reçu principalement des critiques positives de la part de la presse spécialisée. Il a rencontré un fort succès commercial, se vendant à plus de 5,5 millions d\'exemplaires, dont 2,93 millions aux États-Unis et 1,97 million au Japon.\r\n\r\nuper Smash Bros. consiste en l\'affrontement de nombreux personnages de Nintendo comme Mario, Link ou Pikachu sur divers terrains, le but étant de sortir l\'un (ou les) adversaire(s) du ring. La série Super Smash Bros. présente une spécificité importante par rapport à la plupart des jeux de combat : à chaque fois qu\'un personnage reçoit des dégâts, ce n\'est pas une « jauge de vie » qui diminue, mais un pourcentage de dégâts qui augmente. Ce pourcentage peut dépasser 100 %, et peut même aller jusqu\'à 999 %. Plus le pourcentage de dégâts est haut, plus il est facile d\'éjecter le personnage hors du stade. Lorsqu\'un personnage est éjecté, il peut tenter de revenir sur le terrain grâce à ses trois sauts : certains personnages peuvent sauter plus haut que d\'autres. Certains peuvent même voler (temporairement), comme Kirby. De plus, il est plus facile d\'éjecter un personnage léger qu\'un personnage lourd.', 19, 8, 1999, '2019-09-10 06:59:14', 1, 'ssb64.jpg'),
(30, 'super smash bros. melee', 'Super Smash Bros. Melee, souvent abrégé en SSBM ou tout simplement Melee, connu au Japon sous le nom de Dairantō Smash Brothers DX (大乱闘スマッシュブラザーズDX, Dairantō Sumasshu Burazāzu Derakkusu), est un jeu de combat sorti sur GameCube en 2001 et 2002. Il est la suite de Super Smash Bros., sorti sur Nintendo 64 en 1999, et il a été suivi de Super Smash Bros. Brawl, sorti sur Wii en 2008. Le jeu a été développé par HAL Laboratory avec Masahiro Sakurai à la tête de la production.\r\n\r\nLe titre réunit des personnages tirés de jeux vidéo Nintendo comme Super Mario, The Legend of Zelda et Pokémon. Les terrains et le système de jeu font référence ou sont directement extraits des jeux à succès développés par Nintendo. Le système de jeu offre une approche peu orthodoxe du genre du « jeu de combat » étant donné que le compteur de pourcentages indique le nombre de dommages reçus plutôt que les points de vie visibles traditionnellement dans les jeux de combat. Il s\'appuie sur les bases du premier opus en ajoutant des nouvelles fonctionnalités et des nouveaux personnages jouables. En raison de la popularité du mode multijoueur, SSBM est présent dans de nombreux tournois de jeux vidéo.\r\n\r\nLe jeu a été bien accueilli par la presse spécialisée et a reçu différentes récompenses. Avec plus de sept millions d\'exemplaires écoulés, il est le jeu le plus vendu sur GameCube.\r\n\r\nComme son prédécesseur, Super Smash Bros. Melee est différent des jeux de combat traditionnels dans lesquels le fait de donner beaucoup de dommages à l\'adversaire ne garantit pas la victoire. Ici, les joueurs doivent éliminer leurs adversaires en les faisant sortir des limites du terrain. La plupart des attaques infligent des dommages et peuvent, s\'il en a reçu suffisamment, envoyer l\'ennemi hors du terrain. Les dommages de chaque personnage sont mesurés par un compteur qui calcule la valeur de ceux-ci en pourcentage. Plus le pourcentage est grand, plus l\'ennemi est envoyé loin et il est plus facile de le sortir. Contrairement aux autres jeux du même genre, dans lesquels les mouvements sont exécutés par des combinaisons entre les différents boutons, la plupart des mouvements de Super Smash Bros. Melee peuvent être réalisés grâce à un seul bouton et le stick multidirectionnel.\r\n\r\nDurant les combats, des objets tirés des jeux Nintendo tombent sur le terrain. Ces objets ont pour but d\'infliger des dégâts ou de restaurer le joueur. De plus, la plupart des terrains ont un lien avec une franchise de Nintendo ou un jeu spécifique de l\'entreprise et sont interactifs. Bien que ces terrains soient en trois dimensions, les joueurs peuvent seulement circuler dans un plan en deux dimensions. Tous les stages ne sont pas disponibles initialement, certains doivent être « débloqués » en réalisant des actions particulières.', 19, 8, 2002, '2019-09-10 07:06:51', 1, 'ssbmelee.jpg'),
(31, 'super smash bros. brawl', 'Super Smash Bros. Brawl (大乱闘スマッシュブラザーズＸ, Dairantō Sumasshu Burazāzu Ekkusu, parfois abrégé en SSBB), est un jeu vidéo de combat développé par Sora pour l\'éditeur japonais Nintendo. Le jeu sort sur Wii en janvier 2008 au Japon, en mars en Amérique du Nord, puis en juin en Australie et en Europe.\r\n\r\nSuper Smash Bros. Brawl rassemble des personnages issus de diverses franchises vidéoludiques. Il inclut pour la première fois des personnages venant d’éditeurs tiers, pour un nombre total plus important que son prédécesseur Super Smash Bros. Melee. Le but du jeu est d\'éjecter un adversaire hors de l\'écran. Brawl propose un mode aventure, l\'Émissaire subspatial, dont le scénario met en scène les personnages présents dans le jeu. Il offre un mode multijoueur pouvant aller jusqu\'à quatre joueurs, et est le premier opus de la série à permettre des combats en ligne avec la Nintendo Wi-Fi Connection.\r\n\r\nIl constitue le troisième épisode de la série Super Smash Bros.. Le jeu est un important succès critique, mais également un gros succès commercial, avec 13,30 millions d’unités vendues à travers le monde en mars 2019.\r\n\r\nComme ses prédécesseurs, Brawl utilise un système de combat singulier par rapport à la majorité des jeux de combat. Les joueurs ont un large choix de personnages, et chacun tente de lancer ses adversaires hors de la limite du terrain, dans différentes arènes de combat. Au lieu des traditionnelles barres de santé qui commencent à 100 %, les personnages de Brawl commencent le jeu avec une barre de dommages à 0 %, dont la valeur augmente lorsqu’ils reçoivent des coups. Plus le pourcentage sera haut, plus le personnage touché s’envolera loin. Quand un personnage est éjecté hors du terrain, il perd une vie (ou un point, selon le mode de jeu).\r\n\r\nBrawl inclut une fonction qui permet aux joueurs de créer un profil avec des boutons personnalisés pour chaque méthode de contrôle, ainsi que leur nom d’utilisateur choisi.\r\n\r\n\r\nLe logo de la série Super Smash Bros. est aussi la forme de la balle smash, qui permet au joueur d\'utiliser le Final Smash.\r\nLe jeu est jouable avec la Wiimote avec ou sans Nunchuk, avec la manette classique de la Wii ou avec une manette GameCube. Les personnages possèdent une grande variété d\'attaques. Les joueurs exécutent chaque mouvement en pressant un bouton en même temps qu\'en bougeant le stick analogique ou en pressant la croix directionnelle, en fonction du mode de jeu. En plus des attaques basiques, les personnages ont accès à des coups spéciaux, connus sous le nom de Smash. Chaque personnage a quatre mouvements uniques, qui provoquent souvent des effets supplémentaires aux simples dommages sur un adversaire. Brawl introduit la possibilité de faire des super-attaques, connues sous le nom de Final Smash. Beaucoup plus puissants que les attaques régulières, ces mouvements peuvent avoir différents effets, allant d\'une inévitable explosion de coups à une transformation temporaire. Les Final Smash peuvent être effectués lorsque la Balle Smash (un objet portant le logo de Smash Bros.) est détruite. Le personnage brille alors en provoquant une aura autour de lui. S\'il subit un certain nombre de dégâts, la Balle Smash lui sera retirée et devra de nouveau être détruite par un personnage pour être libérée.', 8, 8, 2008, '2019-09-10 07:12:41', 1, 'ssbbrawl.jpg'),
(32, 'super smash bros. ultimate', 'Super Smash Bros. Ultimate (大乱闘スマッシュブラザーズ SPECIAL, Dairantō Sumasshu Burazāzu Supesharu) est un jeu vidéo de combat et de plates-formes développé par Sora Ltd. et Bandai Namco et édité par Nintendo. Il s\'agit du cinquième épisode de la série Super Smash Bros.. Annoncé lors du Nintendo Direct du 8 mars 2018, il est sorti mondialement le 7 décembre 2018 exclusivement sur Nintendo Switch.\r\n\r\nTout comme ses prédécesseurs, Super Smash Bros. Ultimate est un jeu de combat réunissant la plupart des personnages de l\'univers Nintendo et de licences tierces, dont le but est d\'éjecter l\'adversaire hors de l\'écran. Pour gagner, les personnages ne possèdent pas une barre de vie comme dans la plupart des jeux de combat mais, comme dans tous les opus de la série Super Smash Bros., le joueur détient un pourcentage de dégâts qui augmente au fur et à mesure des coups reçus. Ainsi, plus les dégâts d\'un personnage sont élevés et plus il est facile de l\'éjecter et de lui faire perdre une vie. Pour ce faire, chaque personnage possède une grande panoplie d\'attaques en utilisant uniquement des coups comme les coups spéciaux qui diffèrent d\'un personnage à un autre ou alors une attaque smash, qui est un coup normal à la puissance amplifiée et pouvant être chargée.\r\n\r\nBien que les combats se déroulent essentiellement au corps à corps, divers objets font leur apparition aléatoirement sur le stage dans le but d\'aider le joueur. Il peut s\'agir d\'objets de tous types de licences, comme l\'étoile Warp de la série Kirby, avec laquelle le joueur qui l\'utilise s\'envole dans les airs et atterrit sur le terrain provoquant une grosse explosion destructrice, ou encore la fleur de feu de Super Mario Bros. qui permet au joueur d\'envoyer des flammes. Même si les dégâts du joueur ne sont pas très élevés, une simple utilisation de certains de ces objets peut cependant s\'avérer très dangereux et mettre K.O. un adversaire sur le coup.\r\n\r\nS\'ajoutent à cela cinquante-neuf Trophées aide, le joueur qui en attrape un fait apparaître un allié qui a pour mission d\'aider le joueur à vaincre ses adversaires. Même si leur présence à l\'écran est toujours d\'une durée déterminée, à l\'instar des objets, plusieurs de ces alliés peuvent éjecter un adversaire en un seul coup. Cependant, certains des trophées, comme le chien de Nintendogs, n\'épaulent pas le personnage et empêchent le bon déroulement du combat. D\'autres attaqueront simplement un combattant tandis que certains combattront l\'ensemble des joueurs présent sur le terrain. De nouveaux trophées aide font également leur apparition, comme Leo d\'Art Academy ou Bomberman de la série du même nom. De même, cinquante-cinq Pokémon peuvent être invoquée au cours du combat, avec parmi eux certains récurrents comme Ronflex, Entei et Dedenne et des nouveaux comme Mimiqui, Chelours et Raichu d\'Alola5.', 20, 8, 2018, '2019-09-10 07:16:15', 1, 'ssbu.jpg'),
(39, 'mortal kombat (1992)', 'Mortal Kombat (communément abrégé en MK) est un jeu vidéo de Midway Manufacturing Company sorti sur borne d\'arcade en 1992, célèbre pour sa violence, sa brutalité et son côté gore.\r\n\r\nL\'histoire se centre sur un tournoi du nom de Mortal Kombat organisé par le maléfique sorcier Shang Tsung.\r\n\r\nLe jeu a connu un très fort succès ce qui a donné suite à un second volet, Mortal Kombat II en 1993.\r\n\r\nIl y a 500 ans, le tournoi annuel Shaolin, le plus prestigieux tournoi de combat du monde, a été interrompu par l\'apparition d\'un vieux sorcier et d\'une étrange créature à quatre bras, qui a participé au tournoi et a vaincu le Grand Kung Lao. Ce guerrier Shokan était le combattant mi-humain, mi-dragon nommé Goro, et il est devenu le champion ultime des combats au cours des cinq cents prochaines années. Tout cela faisait partie du plan de Shang Tsung visant à faire basculer la balance dans le chaos et à aider l\'Outre-Monde à conquérir le royaume de la Terre.\r\n\r\nUn moine shaolin digne de ce nom, Liu Kang, se rendrait au tournoi dans l’intention de rétablir l’équilibre aux côtés de l’artiste martial hollywoodien Johnny Cage, également entré dans le tournoi et se liant d\'amitié à Kang lorsqu’une bagarre éclata entre lui et Kano.\r\n\r\nLe guerrier Sub-Zero du clan Lin Kuei a été invité à se joindre au tournoi par Shang Tsung lui-même. Selon ses crédits de Mortal Kombat, il s’est rendu au tournoi pour assassiner Shang Tsung, à la demande d’un riche ennemi du sorcier. Ceci, cependant, n\'a jamais été mentionné à nouveau. Le ninja mort-vivant Scorpion du clan Shirai Ryu est entré dans le tournoi avec l\'intention de tuer Sub-Zero, estimant que Sub-Zero était responsable de son assassinat.\r\n\r\nShang Tsung a également demandé à Raiden, le dieu du tonnerre, et Raiden lui-même s\'est vanté que \"tous ceux qui s\'opposeraient à Raiden seraient écrasés\". Il a pris la forme d\'un mortel afin de participer au tournoi.\r\n\r\nKano, le voyou le plus diabolique du dragon noir, était poursuivi par une unité des forces spéciales américaines, dirigée par le lieutenant Sonya Blade, lorsqu\'il a réussi à monter sur le bateau menant au tournoi; Son objectif dans le tournoi était de piller le palais de Shang Tsung (où les murs auraient été faits d\'or). Une fois que Sonya et ses hommes sont arrivés, Shang Tsung prend l\'armée de Sonya en embuscade par son armée personnelle. L’unité des forces spéciales a été prise dans l’attaque surprise et Sonya n’a donc pas eu d’autre choix que de participer au tournoi afin de sauver son équipe.\r\n\r\nAinsi le tournoi a eu lieu.\r\n\r\nAlors que l\'Outre-Monde avait déjà remporté 9 tournois consécutifs, nos héros devraient éviter la 10ème défaite du Royaume de la Terre, sinon toute l\'humanité s\'effondrerait dans les ténèbres de l\'Outre-Monde.', 22, 19, 1992, '2019-09-27 08:30:30', 1, 'mk92.jpg'),
(40, 'mortal kombat II', 'Mortal Kombat II, communément abrégé MKII, est un jeu vidéo de combat développé par la société américaine Midway Manufacturing Company et initialement sorti en novembre 1993 sur borne d\'arcade. Il s\'agit du second titre de la série Mortal Kombat.\r\n\r\nAprès sa défaite, Shang Tsung supplie son maître, Shao Kahn, d\'épargner sa vie. Il lui dit que l\'invitation pour le tournoi Mortal Kombat ne peut être refusée, et que si le tournoi a lieu dans l\'Outre Monde, les guerriers du Royaume de la Terre doivent être présents. Kahn est d\'accord sur ce principe et redonne santé et jeunesse à Tsung. Il prolonge l\'invitation de Raiden, qui de son côté invite ses combattants à se joindre à lui, et tous se rendent dans l\'Outre Monde. Le tournoi est dangereux car Shao Kahn a l\'avantage d\'être dans son élément, et une victoire du Royaume du Mal déséquilibrerait la situation et permettrait aux forces maléfiques de submerger la Terre.\r\n\r\nL\'histoire suit celle du premier opus, et globalement, cet épisode est plus riche que le précédent.', 22, 19, 1993, '2019-09-27 09:39:11', 1, 'mk2.jpg'),
(42, 'crash bandicoot', 'Crash Bandicoot est un jeu vidéo de plates-formes développé par Naughty Dog et édité par Sony Computer Entertainment en 1996 sur PlayStation. Il constitue le premier épisode de la série Crash Bandicoot.\r\n\r\nCrash Bandicoot relate la création de l\'anthropomorphe Crash Bandicoot, le héros éponyme du jeu, par le Docteur Neo Cortex et le Docteur Nitrus Brio, les deux antagonistes principaux du jeu. L\'histoire du jeu suit ensuite les aventures de Crash qui a pour mission d\'arrêter ses deux créateurs dans leur quête de domination du monde, nettoyer toute la pollution qu\'ils ont causée, et sauver sa petite amie, Tawna, une femelle bandicoot également créée par les Docteurs Cortex et Nitrus Brio.\r\n\r\nCrash Bandicoot a reçu des critiques généralement positives. La critique salue les graphismes du jeu et un style visuel unique, mais note l\'absence d\'innovation apportée dans le domaine des jeux de plates-formes. Le jeu devient par la suite le huitième jeu le plus vendu sur PlayStation avec 6,82 millions d\'exemplaires écoulés et le premier opus d\'une série au succès tout aussi fort. Le jeu de Naughty Dog devient également le premier titre occidental à franchir le cap des 500 000 exemplaires vendus au Japon, avant d\'être dépassé par ses deux suites, Crash Bandicoot 2: Cortex Strikes Back et Crash Bandicoot 3: Warped.', 26, 6, 1996, '2019-09-30 12:00:32', 1, 'crashbandicoot1.jpg'),
(45, 'vanquish', 'Vanquish (ヴァンキッシュ, Vankisshu, prononcé Vaankuish en anglais) est un jeu de tir à la troisième personne développé par Platinum Games et édité par Sega. Le jeu est distribué en octobre 2010 sur PlayStation 3 et Xbox 360.\r\n\r\nL\'histoire prend place dans un univers futuriste où des terroristes communistes russes transforment une station orbitale en arme de destruction massive et menacent d\'attaquer les États-Unis.\r\n\r\nVanquish a lieu dans un avenir proche où la population de la planète Terre a atteint les 10 milliards d\'habitants. Les nations du monde entier se battent pour la mise à disposition des ressources rares, le monde fait face à des pénuries alimentaires et à des conflits en tous genres. Les États-Unis d\'Amérique ont tenté d\'atténuer leurs problèmes démographiques et énergétiques en lançant en orbite une ville spatiale en forme d\'énorme cylindre. Appelée Providence, la ville fournit une autre source de carburant à partir du Soleil.\r\n\r\nToutefois, le gouvernement de la Fédération de Russie a été renversé par un coup d\'État par des communistes se faisant appeler l’Ordre de l\'Étoile russe. Cette nouvelle puissance a rapidement pris le contrôle de la station spatiale, en s\'en servant comme arme capable de détruire des villes entières. Démontrant leur détermination en pulvérisant San Francisco à l\'aide de micro-ondes, ils souhaitent que les principaux responsables politiques des États-Unis se rendent. Ils menacent de renouveler l\'attaque sur New York s\'ils n\'obtiennent pas satisfaction. Ne voulant pas se soumettre, la présidente des États-Unis déclare la guerre aux terroristes.\r\n\r\nSam Gideon, scientifique de la D.A.R.P.A. possédant une armure à réaction sur-développée (A.R.S.), est envoyé en renfort chez les Marines et plus particulièrement dans un commando appelé Bravo pour sauver le professeur Candide et reprendre le contrôle de Providence bien qu\'il y est officiellement pour tester l\'A.R.S.', 27, 7, 2010, '2019-10-01 16:12:08', 1, 'vanquish.jpg'),
(46, 'madworld', 'MadWorld est un jeu vidéo d\'action, développé par Platinum Games et édité par Sega, sorti sur Wii en mars 2009.\r\n\r\nLe jeu se déroule à la troisième personne. Le joueur dirige Jack Cayman, un homme armé d\'une tronçonneuse rétractable sur l\'avant-bras droit, qui participe à DeathWatch, une émission de téléréalité ultra violente. Le Nunchuck sert à déplacer Jack, tandis que la Wiimote permet d\'attaquer les ennemis. La plupart des attaques sont réalisées en utilisant conjointement le bouton « B » et l\'accéléromètre de la Wiimote. Le but du jeu est de se débarrasser de ses ennemis de la façon la plus spectaculaire qui soit en utilisant les éléments de l\'environnement. Ainsi, il est par exemple possible d\'empaler la tête d\'un ennemi avec un panneau de signalisation.\r\n\r\nLe jeu est basé sur une violence extrême et démesurée. Le concepteur du jeu, Shigenori Nishikawa, affirme que malgré le côté sombre du jeu, la violence du jeu est caricaturale. Par exemple, le jeu propose un mini-jeu appelé « Man Darts » (les « fléchettes humaines ») où il faut envoyer vos ennemis sur une cible à l\'aide d\'une batte de baseball pour marquer des points. Toutefois, à cause de cette débauche de violence, PlatinumGames n\'est pas sûr de voir son jeu édité au Japon, expliquant que « sur certains marchés, il y a de nombreuses limitations quant à la violence que l\'on peut montrer dans un jeu, c\'est pourquoi nous pensons principalement aux marchés américains et européens en développant ce jeu ».\r\n\r\nMadWorld propose des graphismes très stylisés qui utilisent une palette de couleur très limitée avec de gros contrastes de noir et de blanc (en partie inspiré de Sin City) sur lesquels viennent se poser des gerbes rouges de sang et des onomatopées jaunes.', 27, 7, 2009, '2019-10-02 07:33:58', 3, 'madworld.jpg'),
(47, 'bayonetta', 'Bayonetta (ベヨネッタ, Beyonetta) est un jeu vidéo d\'action de type beat them all développé par PlatinumGames et édité par Sega. Le jeu est sorti en 2009 au Japon et en 2010 dans le reste du monde sur PlayStation 3 et Xbox 360. Dévoilé en mai 2008, le projet est dirigé par Hideki Kamiya, le père de la série Devil May Cry.\r\n\r\nDans un monde où la magie règne s\'affrontent les sorcières de l\'Umbra, maîtresses des forces des ténèbres, et les sages de Lumen, défenseurs de la lumière. Bayonetta, une femme séduisante, au caractère bien trempé et dotée de pouvoirs magiques, est la dernière à maîtriser les arcanes de l\'Umbra. Vingt ans plus tôt, elle se réveille dans un cercueil immergé au fond d\'un lac. Celui-ci est découvert par le père de Luka, un journaliste à la poursuite de Bayonetta car il est persuadé que c\'est elle qui est responsable de la mort de son père, décédé dans des circonstances mystérieuses. Incapable de se souvenir de son passé, Bayonetta continue de mener un combat contre les anges pour rester en vie avec l\'assistance d\'Enzo, son informateur favori, et de Rodin, un démon armurier et tenancier d\'un bar appelé les Portes de l\'Enfer.\r\n\r\nBayonetta est en possession d\'un joyau, l\'« Œil Gauche », et Enzo apprend que le deuxième serait dans la ville de Vigrid. Elle rencontre Jeanne, une femme mystérieuse possédant des pouvoirs similaires capable de lui tenir tête et qui semble bien connaitre Bayonetta, mais aussi de nombreux anges envoyés pour arrêter la sorcière…\r\n\r\nDans ce beat them all, le joueur incarne Bayonetta et doit triompher d\'une succession de batailles en utilisant des combos. Cette sorcière combat les serviteurs du paradis, au corps à corps, avec des pouvoirs magiques et différentes armes (pistolets, épée, fouet…). Quatre pistolets sont ainsi fixés à chaque extrémité de ses membres. Sa combinaison semble en cuir, mais est en réalité composé de ses cheveux qu\'elle peut contrôler à sa guise pour leur donner différentes formes (main géante, lame…). Ses attaques magiques sont de trois ordres : les \"attaques sadiques\" invoquent des machines autrefois utilisés pour la chasse aux sorcières (vierge de fer, guillotine…), les \"incantations\" utilisent ses cheveux pour invoquer des entités démoniaques et les \"démons infernaux\", attaques les plus puissantes.', 27, 7, 2009, '2019-10-02 07:47:05', 3, 'bayonetta.jpg'),
(48, 'bayonetta 2', 'Bayonetta 2 (ベヨネッタ 2, Beyonetta Tsū?) est un jeu vidéo d\'action de type beat them all développé par Platinum Games et édité par Nintendo. Le jeu est sorti exclusivement sur Wii U en septembre 2014 au Japon et en octobre 2014 dans le reste du monde. Un portage du premier opus Bayonetta est inclus avec le jeu via le pack 1+2 sur Wii U. Sur Nintendo Switch, l\'achat donne accès à un code de téléchargement du premier opus à utiliser sur le Nintendo eShop.\r\n\r\nPeu de temps après les événements du premier opus, Bayonetta et Jeanne préparent les fêtes de Noël en faisant les boutiques de la ville. Un imprévu les force à affronter une horde d\'anges ayant détourné des avions pour une parade. Un combat contre un ange coriace tourne au désastre quand Bayonetta perd le contrôle du démon qu\'elle invoque et provoque la mort de Jeanne, qui est envoyée en Enfer. Bayonetta entreprend immédiatement une opération de sauvetage de l\'âme de Jeanne emprisonnée en Enfer et se rend à Fimbulventr pour y accéder.\r\n\r\nBayonetta 2 reprend les mécanismes de jeu du premier épisode Bayonetta.\r\n\r\nLe mode un joueur possède trois modes de difficulté pour s\'adapter à un large public. Il existe un 4e mode de difficulté pour des joueurs exigeants.\r\n\r\nLe jeu dispose d\'un mode coopératif à deux joueurs en ligne.', 27, 8, 2014, '2019-10-02 07:51:35', 3, 'bayoneta2.jpg'),
(49, 'nier: automata', 'Nier: Automata (ニーア オートマタ, Nīa Ōtomata, stylisé NieR:Automata) est un jeu vidéo de type action-RPG développé par PlatinumGames et édité par Square Enix, sorti le 23 février 2017 au Japon, le 7 mars en Amérique du Nord et le 10 mars en Europe et en Australie sur PlayStation 41, et le 17 mars 2017 sur Microsoft Windows2. Une version intitulée Nier: Automata - Become As Gods Edition, comprenant tous les DLC, est prévue pour le 26 juin 2018 sur Xbox One uniquement en téléchargement.\r\n\r\nLe jeu se déroule dans le même univers que celui de Nier, un spin-off de la série Drakengard. Se déroulant au cœur d\'une guerre par procuration entre les machines créées par les envahisseurs d\'un autre monde et les restes de l\'humanité, l\'histoire suit les batailles de l\'androïde de combat 2B, son compagnon 9S, et le prototype obsolète A2.\r\n\r\nLe développement commence en 2014, avec le créateur de la série Yoko Taro, le producteur Yosuke Saito, et le compositeur Keiichi Okabe qui reprennent leurs rôles respectifs. Atsushi Inaba œuvre en tant que coproducteur pour PlatinumGames, tandis que l\'artiste Akihiko Yoshida conçoit les personnages principaux. L\'objectif étant de créer un nouveau jeu Nier fidèle à l\'esprit de l\'original, tout en créant un meilleur gameplay d\'action.', 27, 21, 2016, '2019-10-02 09:10:27', 1, 'nierautomata.jpg');
INSERT INTO `game` (`id`, `name`, `description`, `dev_id`, `editor_id`, `released_at`, `created_at`, `user_id`, `image`) VALUES
(50, 'la légende de korra', 'La Légende de Korra (The Legend of Korra) est un jeu vidéo de type beat them all développé par PlatinumGames et édité par Activision, sorti en 2014 sur Windows, PlayStation 4, PlayStation 3, Xbox One et Xbox 360. Il est adapté de la série télévisée d\'animation La Légende de Korra.', 27, 22, 2014, '2019-10-02 09:13:20', 1, 'lok.jpg'),
(51, 'ghostbusters: the video game', 'SOS Fantômes, le jeu vidéo (Ghostbusters: The Video Game) est un jeu vidéo édité par Atari Inc., en association avec Sony Pictures et qui est sorti en juin 2009 sur les deux dernières consoles de salon PlayStation en Europe (les autres versions arriveront plus tard sur le continent).\r\n\r\nLes versions PlayStation 3, Xbox 360 et PC sont développées par le studio Terminal Reality, tandis que les versions PlayStation 2, PlayStation Portable, Wii et Nintendo DS sont à la charge de Red Fly Studios.\r\n\r\nLe joueur incarne un 5e Ghostbuster sans nom et sans textes (néanmoins, on peut entendre sa voix par moment), fraîchement recruté. Le script a été écrit par Dan Aykroyd et Harold Ramis, les scénaristes et acteurs des films originaux. D\'ailleurs dans la version originale (anglaise), les personnages ont été doublés par les acteurs des films eux-mêmes. L\'histoire se déroule après le deuxième film, Dan Aykroyd considère même ce jeu comme le troisième épisode.', 28, 23, 2009, '2019-10-02 12:32:29', 1, 'ghostbustersvg.jpg'),
(60, 'xcom: enemy unknown', 'XCOM: Enemy Unknown est un jeu vidéo de tactique au tour par tour sorti sur PC, PlayStation 3 et Xbox 360 en 2012. Il a été développé par Firaxis Games et édité par 2K Games. Le jeu a ensuite été porté sur Mac OS, puis iOS, Android et SteamOS (Linux). Il est ensuite sorti sur PlayStation Vita le 22 mars 2016.\r\n\r\nX-COM: Enemy Unknown est un remake et reboot du jeu UFO: Enemy Unknown développé par Mythos Games et MicroProse en 1994. Le génie de ce jeu est de mêler temps-réel pour la gestion haut niveau, et tour par tour pour les combats. Côté temps-réel, vous gérez des installations, de la recherche, de la fabrication, de l\\\'entraînement, pour développer votre base.\r\n\r\nIl y a deux phases de jeu : la première se déroule dans la base X-COM dont le joueur est le commandant. Celui-ci doit développer la base après avoir choisi son emplacement (qui en fonction du lieu permettra l\\\'obtention de certains bonus) et gérer les recherches, interrogatoires, recrutements et créations d\\\'objets ou de compétences basés sur la technologie alien.\r\n\r\nDans la seconde phase, le commandant décide du lieu de l\\\'intervention des X-COM grâce au GeoScape (un planisphère représentant la terre) et envoie ses agents sur place. Sur les lieux, un combat tactique au tour par tour est engagé avec pour seule fin l\\\'extermination du camp adverse. En fonction de la méthode d\\\'élimination des unités ennemies, le commandant se verra recevoir une certaine quantité de débris, cadavres et/ou prisonniers. Par exemple, tuer un alien à la grenade ou au lance-roquettes rendra les cadavres irrécupérables.\r\n\r\nÀ la fin de chaque combat, en fonction de leurs actions, les soldats recevront des promotions qui feront la différence dans les combats futurs : fusillade, double emplacement... autant de bonus pour la suite.', 29, 24, 2012, '2019-11-07 07:30:15', 1, 'xcomeu.jpg'),
(61, 'xcom 2', 'XCOM 2 est un jeu vidéo de tactique au tour par tour développé par Firaxis Games et édité par 2K Games, sorti le 5 février 2016 sur PC (Windows, Linux) et Mac OS. Il s\\\'agit de la suite directe de XCOM: Enemy Unknown, il fait partie de la série X-COM.\r\n\r\nL\\\'histoire de XCOM 2 prend place à la suite de celle de XCOM: Enemy Unknown dans le cas où la partie est perdue. Les extra-terrestres ont pris le contrôle de la terre. L\\\'organisation internationale XCOM qui avait pour but de les repousser n\\\'existe plus. Cependant, un groupe de résistants continue à lutter contre les aliens. Leur QG est désormais une base mobile, le Talion, un vaisseau dérobé aux extra-terrestres.\r\n\r\nXCOM 2 commence 20 ans après l\\\'histoire racontée dans XCOM : EU.\r\n\r\nLes extraterrestres ont envahi la Terre et ont créé Advent. Institution militaire, politique et de recherche, Advent a pour mission de garder sous contrôle la population humaine. Cette entité mène une campagne de propagande visant à vénérer les extraterrestres. Peu à peu, ils font disparaître les croyances terrestres pour la remplacer par le culte des Anciens.\r\n\r\nAdvent souhaite concentrer une grande partie de la population dans des grandes villes. Ils font passer les résistants pour des terroristes, contrôle le secteur de l\\\'armement, de la recherche scientifique, des médias et a fait disparaître toutes les classes politiques.\r\n\r\nEn opposition, la résistance, constituée d\\\'hommes et de femmes qui vivent à l\\\'écart de la société, s\\\'efforcent de perturber autant que possible les opérations d\\\'Advent avec un succès très inégal.', 29, 24, 2016, '2019-11-07 07:45:54', 1, 'xcom2.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `genre`
--

DROP TABLE IF EXISTS `genre`;
CREATE TABLE IF NOT EXISTS `genre` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `genre`
--

INSERT INTO `genre` (`id`, `name`) VALUES
(1, 'Action'),
(2, 'RPG'),
(4, 'Stratégie temps réel'),
(5, 'Plates-Formes'),
(6, 'Aventure'),
(7, 'Roguelike/Roguelite'),
(8, 'Combat'),
(9, 'Dungeon Crawler'),
(10, 'Infiltration'),
(11, 'Survival-Horror'),
(12, 'FPS'),
(13, 'Stratégie au tour par tour'),
(14, 'Beat\'em Up'),
(15, 'Shoot\'em Up'),
(16, 'Point & Click'),
(17, 'TPS'),
(18, 'Gestion'),
(19, 'Party Game'),
(20, 'MMORPG'),
(21, 'Rythme'),
(22, 'Simulation'),
(23, 'Simulation De Vie'),
(24, 'Puzzle Game'),
(25, 'Sport'),
(26, 'Course'),
(27, 'Tactique'),
(28, 'Réflexion'),
(29, 'Jeu De Cartes');

-- --------------------------------------------------------

--
-- Structure de la table `genrelink`
--

DROP TABLE IF EXISTS `genrelink`;
CREATE TABLE IF NOT EXISTS `genrelink` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `genre_id` int(11) NOT NULL,
  `game_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `game_id` (`game_id`),
  KEY `genre_id` (`genre_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `genrelink`
--

INSERT INTO `genrelink` (`id`, `genre_id`, `game_id`) VALUES
(1, 1, 1),
(2, 2, 1),
(5, 1, 3),
(6, 6, 3),
(8, 1, 5),
(9, 6, 5),
(25, 6, 7),
(26, 4, 8),
(27, 13, 8),
(28, 5, 9),
(29, 8, 10),
(30, 2, 11),
(31, 2, 12),
(36, 2, 15),
(37, 13, 16),
(38, 4, 16),
(39, 13, 17),
(40, 4, 17),
(41, 13, 18),
(42, 4, 18),
(45, 2, 20),
(48, 2, 2),
(49, 9, 2),
(50, 7, 2),
(55, 13, 19),
(56, 4, 19),
(57, 2, 21),
(58, 10, 22),
(59, 8, 23),
(60, 8, 24),
(61, 14, 25),
(62, 8, 26),
(63, 1, 27),
(64, 6, 27),
(65, 1, 28),
(66, 14, 28),
(67, 10, 28),
(69, 8, 29),
(70, 8, 30),
(71, 8, 31),
(72, 8, 32),
(83, 8, 39),
(84, 8, 40),
(89, 5, 42),
(95, 8, 4),
(99, 17, 45),
(100, 1, 46),
(101, 14, 46),
(102, 14, 47),
(103, 14, 48),
(104, 1, 49),
(105, 2, 49),
(106, 14, 49),
(108, 14, 50),
(109, 1, 51),
(110, 17, 51),
(112, 8, 13),
(116, 12, 6),
(117, 10, 6),
(118, 11, 6),
(135, 13, 60),
(136, 13, 61);

-- --------------------------------------------------------

--
-- Structure de la table `platform`
--

DROP TABLE IF EXISTS `platform`;
CREATE TABLE IF NOT EXISTS `platform` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_bin NOT NULL,
  `launched_at` year(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `platform`
--

INSERT INTO `platform` (`id`, `name`, `launched_at`) VALUES
(1, 'PC', 1962),
(2, 'PS4', 2013),
(3, 'Xbox One', 2013),
(4, 'Nintendo Switch', 2017),
(5, 'PS2', 2000),
(6, 'Xbox 360', 2005),
(7, 'PS3', 2006),
(8, 'MAC', 1984),
(9, 'PS Vita', 2011),
(10, 'Playstation', 1994),
(11, 'Wii', 2006),
(12, 'Wii U', 2012),
(13, 'Super NES', 1990),
(14, 'Gameboy', 1989),
(15, 'NES - Famicom', 1983),
(16, 'Saturn', 1994),
(17, 'Mega Drive - Genesis', 1988),
(18, 'Dreamcast', 1998),
(19, 'Gamecube', 2001),
(20, 'Master System', 1985),
(21, 'Nintendo 64', 1997),
(22, 'PSP', 2004),
(23, 'Xbox', 2001),
(24, 'Gameboy Advance', 2001),
(25, 'Amiga CD32', 1993),
(26, 'Game Gear', 1990),
(27, 'DS', 2004),
(30, 'Neo Geo', 1990),
(31, 'Amiga', 1985),
(32, 'Game Boy Color', 1998),
(33, 'Neo Geo CD', 1994),
(34, '3DS', 2011);

-- --------------------------------------------------------

--
-- Structure de la table `platformlink`
--

DROP TABLE IF EXISTS `platformlink`;
CREATE TABLE IF NOT EXISTS `platformlink` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `platform_id` int(11) NOT NULL,
  `game_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `platform_id` (`platform_id`),
  KEY `game_id` (`game_id`)
) ENGINE=InnoDB AUTO_INCREMENT=255 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `platformlink`
--

INSERT INTO `platformlink` (`id`, `platform_id`, `game_id`) VALUES
(1, 1, 1),
(2, 6, 1),
(3, 7, 1),
(10, 7, 3),
(11, 6, 3),
(16, 2, 5),
(46, 21, 7),
(47, 1, 8),
(48, 21, 9),
(49, 13, 10),
(50, 1, 11),
(51, 7, 11),
(52, 6, 11),
(53, 22, 11),
(54, 1, 12),
(55, 3, 12),
(56, 4, 12),
(57, 7, 12),
(58, 6, 12),
(59, 2, 12),
(67, 1, 14),
(68, 7, 14),
(69, 6, 14),
(70, 8, 14),
(71, 1, 15),
(72, 6, 15),
(73, 7, 15),
(74, 8, 15),
(75, 1, 16),
(76, 8, 16),
(77, 1, 17),
(78, 8, 17),
(79, 1, 18),
(82, 1, 20),
(83, 7, 20),
(84, 6, 20),
(90, 1, 2),
(91, 2, 2),
(92, 3, 2),
(93, 4, 2),
(94, 9, 2),
(104, 1, 19),
(105, 8, 19),
(106, 1, 21),
(107, 8, 21),
(108, 2, 21),
(109, 3, 21),
(110, 4, 21),
(111, 23, 22),
(112, 1, 22),
(113, 19, 22),
(114, 24, 22),
(115, 5, 22),
(116, 3, 23),
(117, 1, 23),
(118, 13, 24),
(119, 17, 25),
(120, 25, 25),
(121, 15, 25),
(122, 26, 25),
(123, 14, 25),
(124, 3, 25),
(125, 30, 26),
(126, 4, 26),
(127, 10, 26),
(128, 11, 26),
(129, 16, 26),
(130, 2, 26),
(131, 14, 27),
(132, 32, 27),
(133, 4, 27),
(134, 34, 27),
(135, 7, 28),
(136, 6, 28),
(137, 1, 28),
(138, 8, 28),
(139, 2, 28),
(140, 3, 28),
(144, 21, 29),
(145, 19, 30),
(146, 11, 31),
(147, 4, 32),
(162, 1, 39),
(163, 17, 39),
(164, 13, 39),
(165, 14, 39),
(166, 20, 39),
(167, 20, 40),
(168, 17, 40),
(169, 13, 40),
(170, 10, 40),
(171, 16, 40),
(172, 14, 40),
(177, 10, 42),
(184, 2, 4),
(185, 1, 4),
(186, 4, 4),
(196, 1, 45),
(197, 7, 45),
(198, 6, 45),
(199, 11, 46),
(200, 7, 47),
(201, 6, 47),
(202, 12, 47),
(203, 1, 47),
(204, 4, 47),
(205, 12, 48),
(206, 4, 48),
(207, 2, 49),
(208, 1, 49),
(209, 3, 49),
(215, 1, 50),
(216, 2, 50),
(217, 7, 50),
(218, 3, 50),
(219, 6, 50),
(220, 1, 51),
(221, 6, 51),
(222, 11, 51),
(223, 27, 51),
(224, 22, 51),
(226, 5, 13),
(233, 1, 6),
(234, 2, 6),
(235, 3, 6),
(236, 7, 6),
(237, 6, 6),
(238, 8, 6),
(248, 1, 60),
(249, 7, 60),
(250, 6, 60),
(251, 9, 60),
(252, 1, 61),
(253, 2, 61),
(254, 3, 61);

-- --------------------------------------------------------

--
-- Structure de la table `review`
--

DROP TABLE IF EXISTS `review`;
CREATE TABLE IF NOT EXISTS `review` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `note` tinyint(2) NOT NULL,
  `comment` mediumtext COLLATE utf8_bin NOT NULL,
  `post_date` datetime NOT NULL,
  `game_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `game_id` (`game_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `review`
--

INSERT INTO `review` (`id`, `note`, `comment`, `post_date`, `game_id`, `user_id`) VALUES
(1, 18, 'Lorem ipsum dolor sit amet consectetur adpisicing elit. Consequuntur perferendis iusto facere eligendi voluptas ab, expedita labore odio omnis excepturi illo pariatur eum corporis laudantium maxime libero tempore ex ipsa.\r\nLorem ipsum dolor sit amet consectetur adpisicing elit. Consequuntur perferendis iusto facere eligendi voluptas ab, expedita labore odio omnis excepturi illo pariatur eum corporis laudantium maxime libero tempore ex ipsa.\r\nLorem ipsum dolor sit amet consectetur adpisicing elit. Consequuntur perferendis iusto facere eligendi voluptas ab, expedita labore odio omnis excepturi illo pariatur eum corporis laudantium maxime libero tempore ex ipsa.\r\nLorem ipsum dolor sit amet consectetur adpisicing elit. Consequuntur perferendis iusto facere eligendi voluptas ab, expedita labore odio omnis excepturi illo pariatur eum corporis laudantium maxime libero tempore ex ipsa.\r\nLorem ipsum dolor sit amet consectetur adpisicing elit. Consequuntur perferendis iusto facere eligendi voluptas ab, expedita labore odio omnis excepturi illo pariatur eum corporis laudantium maxime libero tempore ex ipsa.\r\nLorem ipsum dolor sit amet consectetur adpisicing elit. Consequuntur perferendis iusto facere eligendi voluptas ab, expedita labore odio omnis excepturi illo pariatur eum corporis laudantium maxime libero tempore ex ipsa.\r\n', '2019-08-20 08:03:58', 20, 2),
(4, 15, 'Test546', '2019-08-22 06:06:21', 19, 2),
(6, 18, 'Test 300045', '2019-08-22 06:53:24', 18, 2),
(7, 18, 'Test 4500001', '2019-08-22 06:54:36', 17, 2),
(10, 18, 'C\'est très le fun', '2019-08-29 08:16:53', 4, 2),
(12, 13, 'Lorem ipsum dolor sit amet consectetur adpisicing elit. Consequuntur perferendis iusto facere eligendi voluptas ab, expedita labore odio omnis excepturi illo pariatur eum corporis laudantium maxime libero tempore ex ipsa. Lorem ipsum dolor sit amet consectetur adpisicing elit. Consequuntur perferendis iusto facere eligendi voluptas ab, expedita labore odio omnis excepturi illo pariatur eum corporis laudantium maxime libero tempore ex ipsa. Lorem ipsum dolor sit amet consectetur adpisicing elit. Consequuntur perferendis iusto facere eligendi voluptas ab, expedita labore odio omnis excepturi illo pariatur eum corporis laudantium maxime libero tempore ex ipsa. Lorem ipsum dolor sit amet consectetur adpisicing elit. Consequuntur perferendis iusto facere eligendi voluptas ab, expedita labore odio omnis excepturi illo pariatur eum corporis laudantium maxime libero tempore ex ipsa. Lorem ipsum dolor sit amet consectetur adpisicing elit. Consequuntur perferendis iusto facere eligendi voluptas ab, expedita labore odio omnis excepturi illo pariatur eum corporis laudantium maxime libero tempore ex ipsa. Lorem ipsum dolor sit amet consectetur adpisicing elit. Consequuntur perferendis iusto facere eligendi voluptas ab, expedita labore odio omnis excepturi illo pariatur eum corporis laudantium maxime libero tempore ex ipsa.', '2019-09-18 06:55:04', 19, 1),
(13, 19, 'Ce fut le jeu de l\'année pour moi, le design (perso et level) excellent, doublage top, histoire au poil, gameplay magnifique. Le seul reproche serait qu\'on est trop souvent en vision détective ce qui nous gâche la contemplation des magnifique décors.', '2019-09-20 06:47:52', 28, 2),
(14, 18, 'Ce fut le jeu de l\'année pour moi, le design (perso et level) excellent, doublage top, histoire au poil, gameplay magnifique. Le seul reproche serait qu\'on est trop souvent en vision détective ce qui nous gâche la contemplation des magnifique décors.', '2019-09-30 07:02:41', 28, 1);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_admin` tinyint(1) NOT NULL,
  `username` varchar(60) COLLATE utf8_bin NOT NULL,
  `mail` varchar(90) COLLATE utf8_bin NOT NULL,
  `password` char(60) COLLATE utf8_bin NOT NULL,
  `image` varchar(30) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `is_admin`, `username`, `mail`, `password`, `image`) VALUES
(1, 1, 'Brain', 'mail@mail.com', '$2y$10$/BCXAIt9LzZXBw35NQRoUu5Fiz.apIkotBmFrdAk7t.NOt/WZjfRe', 'brain.jpg'),
(2, 0, 'Jean-Pikachu', 'pik@chu.com', '$2y$10$kiOCBVES0Ez4b7GTWScyV.kvc9DKidtaZdjeI3.bs99PpF.wUeNsy', 'pika.jpg'),
(3, 0, 'Blob', 'test.test@test.fr', '$2y$10$UTkKsOJ0RGzXbSU8G6ExBO/aQvOmkGtQP5i6Az9qlCb4zTdBwEPG2', 'foto.png'),
(9, 0, 'test', 'test.test@test.fr', '$2y$10$QQJfIST3pDWEunXbcHqTO.L9uQhYzWoC6Xbm92Ea3JTAAps/PxpbO', 'defaultimg.jpg');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `game`
--
ALTER TABLE `game`
  ADD CONSTRAINT `game_ibfk_1` FOREIGN KEY (`dev_id`) REFERENCES `developper` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `game_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `game_ibfk_3` FOREIGN KEY (`editor_id`) REFERENCES `editor` (`id`);

--
-- Contraintes pour la table `genrelink`
--
ALTER TABLE `genrelink`
  ADD CONSTRAINT `genrelink_ibfk_2` FOREIGN KEY (`game_id`) REFERENCES `game` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `genrelink_ibfk_3` FOREIGN KEY (`genre_id`) REFERENCES `genre` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `platformlink`
--
ALTER TABLE `platformlink`
  ADD CONSTRAINT `platformlink_ibfk_1` FOREIGN KEY (`game_id`) REFERENCES `game` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `platformlink_ibfk_2` FOREIGN KEY (`platform_id`) REFERENCES `platform` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `review_ibfk_1` FOREIGN KEY (`game_id`) REFERENCES `game` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `review_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
