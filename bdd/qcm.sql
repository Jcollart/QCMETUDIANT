-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  jeu. 26 sep. 2019 à 13:03
-- Version du serveur :  5.7.26
-- Version de PHP :  7.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `qcm`
--

-- --------------------------------------------------------

--
-- Structure de la table `appartenir`
--

DROP TABLE IF EXISTS `appartenir`;
CREATE TABLE IF NOT EXISTS `appartenir` (
  `id` int(11) NOT NULL,
  `id_question` int(11) NOT NULL,
  PRIMARY KEY (`id`,`id_question`),
  KEY `belong_to_question0_FK` (`id_question`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `appartenir`
--

INSERT INTO `appartenir` (`id`, `id_question`) VALUES
(105, 44),
(106, 44),
(107, 44),
(108, 45),
(109, 45),
(110, 45),
(111, 46),
(112, 46),
(113, 46),
(114, 47),
(115, 47),
(116, 47),
(117, 48),
(118, 48),
(119, 48),
(120, 49),
(121, 49),
(122, 49),
(123, 50),
(124, 50),
(125, 50),
(126, 51),
(127, 51),
(128, 51),
(129, 52),
(130, 52),
(131, 52),
(132, 53),
(133, 53),
(134, 53),
(135, 54),
(136, 54),
(137, 54),
(138, 55),
(139, 55),
(140, 55),
(141, 56),
(142, 56),
(143, 57),
(144, 57),
(145, 57),
(146, 58),
(147, 58),
(148, 58);

-- --------------------------------------------------------

--
-- Structure de la table `avoir`
--

DROP TABLE IF EXISTS `avoir`;
CREATE TABLE IF NOT EXISTS `avoir` (
  `id` int(11) NOT NULL,
  `id_qcm` int(11) NOT NULL,
  PRIMARY KEY (`id`,`id_qcm`),
  KEY `have_qcm0_FK` (`id_qcm`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `avoir`
--

INSERT INTO `avoir` (`id`, `id_qcm`) VALUES
(44, 93),
(45, 93),
(46, 93),
(47, 93),
(48, 93),
(49, 93),
(50, 93),
(51, 93),
(52, 93),
(53, 93),
(54, 93),
(55, 93),
(56, 93),
(57, 93),
(58, 93);

-- --------------------------------------------------------

--
-- Structure de la table `etudiant`
--

DROP TABLE IF EXISTS `etudiant`;
CREATE TABLE IF NOT EXISTS `etudiant` (
  `id_etudiant` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `participant` varchar(255) NOT NULL,
  `cle` varchar(255) NOT NULL,
  `actif` varchar(255) NOT NULL,
  `etablissement` varchar(255) NOT NULL,
  `nom_team` varchar(255) NOT NULL,
  PRIMARY KEY (`id_etudiant`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `etudiant`
--

INSERT INTO `etudiant` (`id_etudiant`, `nom`, `prenom`, `password`, `email`, `mobile`, `participant`, `cle`, `actif`, `etablissement`, `nom_team`) VALUES
(41, 'Gaveau', 'Charlotte ', 'lesgurlz', 'charlotte.gaveau@laposte.net ', '0645490079', '1', '1d88d9b5c418ecba9c909c0c380219bb', '1', 'INSPE', 'Les professorettes'),
(42, 'Bocahut', 'Philippine ', 'lesgurlz', 'philippine.bocahut@etudiant.univ-reims.fr', '0629011418', '2', 'c848160f4b9256d6db6260874d582582', '0', 'INSPE', 'Les professorettes'),
(43, 'Capitaine ', 'Gwladys', 'lesgurlz', 'gwladys.capitaine@etudiant.univ-reims.fr', '0682314943', '3', '5c45974356c224a723d84f858ae4066d', '0', 'INSPE', 'Les professorettes'),
(44, 'Ponsard', 'ChloÃ© ', 'lesgurlz', 'chloe.ponsard@gmail.com', '0781690908', '4', 'bf16a1158b0f31c70b80c1e5a8165711', '1', 'INSPE', 'Les professorettes'),
(45, 'ManiÃ¨re ', 'LÃ©na', 'lesgurlz', 'lena.maniere@etudiant.univ-reims.fr', '0666102224', '5', '1ab0e10a2263f05b85bd4f31eacb3fce', '0', 'INSPE', 'Les professorettes'),
(46, 'Taine', 'Axel', 'Perruche', 'axeltaine@live.fr', '0651471678', '1', 'd1bd00beed5fc73220aae4a9773e5a79', '1', 'SIMPLON', 'La Buvette'),
(47, 'Triclin', 'Jonathan', 'Perruche', 'jonathan.triclin@gmail.com', '0660486521', '2', 'f689f495b4b3992d2dacdf2dd0503e08', '1', 'SIMPLON', 'La Buvette'),
(48, 'Couaillier', 'Teddy', 'Perruche', 'Teddy.couaillier@gmail.com', '0600000000', '3', '91763732ae10182a509e39eb8ba67d58', '1', 'SIMPLON', 'La Buvette'),
(49, 'Charfi', 'Mohamed', 'Perruche', 'm.charfi232@laposte.net', '0627881245', '4', '65f480fe4520f8e4af5617fcf8d571fb', '0', 'SIMPLON', 'La Buvette'),
(50, 'Gusberti', 'Gianni', 'Perruche', 'gianni_gus@hotmail.fr', '060000000', '5', '7114c590147293c8fb183d97d70a6b59', '0', 'SIMPLON', 'La Buvette'),
(51, 'BRAHIMI', 'Sofiane', 'pastabox', 'sofianebrahimi51000@gmail.com', '0652714487', '1', '40cec747752071913c6bb5cb0ec30a00', '1', 'IUTRCC', 'Les azimutÃ©s'),
(52, 'DERLON', 'Adrien', 'pastabox', 'adrien.derlon02@gmail.com', '0624856719', '2', '80989e3c4ef219abeaff56f1ab27c946', '1', 'IUTRCC', 'Les azimutÃ©s'),
(53, 'FOURNEL', 'Loic', 'pastabox', 'loic.fournel@laposte.net', '0621330094', '3', '9c2e1bbd5258664ea0da76a42cdfa8d0', '1', 'IUTRCC', 'Les azimutÃ©s'),
(54, 'FADEYI', 'Ludovic', 'pastabox', 'ludovic.fadeyi@gmail.com', '0635390280', '4', 'e10ec34bbf4d2590c4719e922f056943', '1', 'IUTRCC', 'Les azimutÃ©s'),
(55, 'ROBERT', 'Tristan', 'pastabox', 'tristanrobert273@gmail.com', '0604508942', '5', 'd179e6dbe5996f4cfa4104e884dcf104', '1', 'IUTRCC', 'Les azimutÃ©s'),
(56, 'FANTI', 'Murielle', 'Team108', 'fanti.murielle@ifsi08.fr', '0609763287', '1', 'e06150eaa539481e2070b37abc2adf3b', '0', 'IFSI', 'Team nÂ°1'),
(57, 'GUERIN', 'CharlÃ¨ne', 'Team108', 'wilmet.charlene@orange.fr', '0688270907', '2', 'ca651b575b5c2d73f0e0bba1e61b5f7d', '1', 'IFSI', 'Team nÂ°1'),
(58, 'LANGLET', 'Annabel', 'Team108', 'langlet.annabel@ifsi08.fr', '0619144458', '3', '8a78bb79d3df0079437df8ba1e798cfe', '0', 'IFSI', 'Team nÂ°1'),
(59, 'LANGLET', 'Manon', 'Team108', 'langlet.manon@ifsi08.fr', '0778813376', '4', '27655de1f4626d82462975dab447d0bc', '1', 'IFSI', 'Team nÂ°1'),
(60, 'MAGNY', 'Amandine', 'Team108', 'amandinemagny51@gmail.com', '0680101194', '5', 'fb80fde3809d108e9918b4ed0202784b', '1', 'IFSI', 'Team nÂ°1'),
(61, 'Boyenval', 'Jean-Baptiste ', '', 'jibe_08@hotmail.fr', '0786636794', '1', '57ad7f1b758cdcf8881b88cf75d7ebb7', '1', 'IFSI', 'Les sâ€™ringuÃ©s'),
(62, 'DARDENNE', 'Anthony', '', 'anthony.dardenne.ad@gmail.com', '0613239887', '2', '310ba351ae8c87919a4acb804925202d', '1', 'IFSI', 'Les sâ€™ringuÃ©s'),
(63, 'Cotte', 'BenoÃ®t ', '', 'benoit.cotte@sfr.fr', '0621227018', '3', 'fc12eaf370f8f72edc002037482676a8', '1', 'IFSI', 'Les sâ€™ringuÃ©s'),
(64, 'Lottin', 'Justine ', '', 'justinelottin@outlook.fr', '0630859015', '4', '38836dbc6ce34c5c7d23a35a6e18092f', '1', 'IFSI', 'Les sâ€™ringuÃ©s'),
(65, 'Mathot', 'Caroline ', '', 'caroline.mathot@wanadoo.fr', '0675977285', '5', '633699d38e4a22b54d3e55132d0ae5a8', '1', 'IFSI', 'Les sâ€™ringuÃ©s'),
(66, 'huin', 'valerie', 'leon', 'aernoutvalerie@yahoo.fr', '0667236630', '1', '793e0130623ab494886756ae90f8e062', '1', 'LMDS', 'essai'),
(67, 'harir', 'fatima', 'leon', 'titi08000@live.fr', '0667236630', '2', '95ce24cfb8e6295bd178c712fe207367', '0', 'LMDS', 'essai'),
(68, 'pialat', 'eddy', 'leon', 'e.pialat@yahoo.fr', '0667236630', '3', '5eea276d7783a4782a31c01b2b49ffe5', '0', 'LMDS', 'essai'),
(69, 'elie', 'sebastien', 'leon', 'sebastien.elie@mairie-charlevillemezieres.fr', '0667236630', '4', '68133bec51a3086a54f0e0b623185642', '0', 'LMDS', 'essai'),
(70, 'aernout', 'valerie', 'leon', 'valerie.huin@mairie-charlevillemezieres.fr', '0667236630', '5', 'e6d61e89addf23e637932e05ad2e0da2', '0', 'LMDS', 'essai'),
(71, 'Pillier ', 'MÃ©linda', 'Lescoupines', 'melinda.plr@outlook.com', '0630386281', '1', 'af2ac201e4e3a9bc11ff03ca5e87f978', '1', 'IFSI', 'Les DrÃ´les de Dames'),
(72, 'Pillier ', 'MÃ©linda', 'Lescoupines', 'melinda.plr@outlook.com', '0630386281', '1', 'af2ac201e4e3a9bc11ff03ca5e87f978', '1', 'IFSI', 'Les DrÃ´les de Dames'),
(73, 'Rousseaux', 'StÃ©phanie', 'Lescoupines', 'stephanie.rousseaux@outlook.fr', '0621497377', '2', '2052ce6f9b2109b920bbdc611dd18e3d', '1', 'IFSI', 'Les DrÃ´les de Dames'),
(74, 'Rousseaux', 'StÃ©phanie', 'Lescoupines', 'stephanie.rousseaux@outlook.fr', '0621497377', '2', 'c86360032f5fcf1d619adbf2deab0660', '1', 'IFSI', 'Les DrÃ´les de Dames'),
(75, 'SacrÃ©', 'Colleen', 'Lescoupines', 'colleen.sacre08@laposte.net', '0635595075', '3', '9632d0e183515a8fe6c73bb38fbf2fba', '0', 'IFSI', 'Les DrÃ´les de Dames'),
(76, 'SacrÃ©', 'Colleen', 'Lescoupines', 'colleen.sacre08@laposte.net', '0635595075', '3', 'b5703e49d972e5774a81149c738b3d00', '0', 'IFSI', 'Les DrÃ´les de Dames'),
(77, 'Renaux', 'LÃ©a', 'Lescoupines', 'lea.renaux@outlook.com', '0642886001', '4', 'c9b0c8c64b941a13b434030109746365', '1', 'IFSI', 'Les DrÃ´les de Dames'),
(78, 'Renaux', 'LÃ©a', 'Lescoupines', 'lea.renaux@outlook.com', '0642886001', '4', '07fe529aa2caa52dda1a60e6142b7135', '1', 'IFSI', 'Les DrÃ´les de Dames'),
(79, 'Moreau', 'Marie', 'Lescoupines', 'moreau.marie08000@gmail.com', '0659324159', '5', 'ad0f398de8439818ec5273b4768170b9', '1', 'IFSI', 'Les DrÃ´les de Dames'),
(80, 'Moreau', 'Marie', 'Lescoupines', 'moreau.marie08000@gmail.com', '0659324159', '5', '52202905505c9438df6b6508bbc3a646', '1', 'IFSI', 'Les DrÃ´les de Dames');

-- --------------------------------------------------------

--
-- Structure de la table `qcm`
--

DROP TABLE IF EXISTS `qcm`;
CREATE TABLE IF NOT EXISTS `qcm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `qcm`
--

INSERT INTO `qcm` (`id`, `titre`) VALUES
(93, 'RALLYE ETUDIANT 2019');

-- --------------------------------------------------------

--
-- Structure de la table `question`
--

DROP TABLE IF EXISTS `question`;
CREATE TABLE IF NOT EXISTS `question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label_question` varchar(255) NOT NULL,
  `question` text NOT NULL,
  `code` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `question`
--

INSERT INTO `question` (`id`, `label_question`, `question`, `code`) VALUES
(44, 'TOUR DU ROY', 'Cette tour de fortification fut construite au 16e siÃ¨cle, et aujourd\'hui vous avez la chance de pouvoir pÃ©nÃ©trer Ã  l\'intÃ©rieur... Ã€ quoi servent les niches mÃ©nagÃ©es dans la muraille de la tour ?', '1235'),
(45, 'HÃ´tel de Ville de MÃ©ziÃ¨res', 'La place est actuellement en travaux, bientÃ´t elle sera piÃ©tonne et une descente sera amÃ©nagÃ©e vers la Meuse. Regardez l\'immeuble en face de l\'hÃ´tel de Ville : quel animal ardennais bien connu figure sur le fronton ?', '1789'),
(46, 'Basilique Notre-Dame d\'EspÃ©rance', 'Entrez dans la Basilique, rÃ©putÃ©e pour ses vitraux rÃ©alisÃ©s par RenÃ© DÃ¼rrbach dans les annÃ©es 1960-70. Directement face Ã  vous se trouve le sas en verre oÃ¹ on en vend des cartes postales. Il est surmontÃ© d\'un vitrail. Quel motif y trouve-t-on ?', '1635'),
(47, 'La MacÃ©rienne / FLAP', 'Combien de groupes Ã©taient programmÃ©s cette annÃ©e ?', '1945'),
(48, '28, Cours Briand', 'Ã€ l\'angle de la rue de Tivoli, trouvez la fresque rÃ©alisÃ©e cet Ã©tÃ© par Pierre Mathieu d\'aprÃ¨s un poÃ¨me en prose de Rimbaud, Â« Enfance Â». Quelle est la particularitÃ© du visage et des mains de la petite fille qui est figurÃ©e ?', '1919'),
(49, 'ThÃ©Ã¢tre municipal', 'trouvez le panneau avec la photo ancienne du thÃ©Ã¢tre. Que manque-t-il aujourd\'hui sur la faÃ§ade ?', '1984'),
(50, 'NÂ°33, avenue d\'Arches (Restaurant Au tout va bien)', 'L\'avenue d\'Arches est bordÃ©e de beaux immeubles de style Art DÃ©co, construits dans les annÃ©es 1920. Quel curieux dÃ©tail Ã©gyptien orne le haut de cette faÃ§ade ?', '2001'),
(51, 'Grand marionnettiste', 'Ici se trouve l\'Institut international de la marionnette. L\'horloge-automate du Â« grand marionnettiste Â» joue un spectacle de marionnettes, Â« les Quatre Fils Aymon Â»... Comment s\'appellent ces quatre frÃ¨res ?', '1819'),
(52, 'MusÃ©e de l\'Ardenne', 'Le musÃ©e est ouvert gratuitement pour les habitants de la ville, et pour les moins de 26 ans. Prenez un ticket gratuit et montez au premier Ã©tage pour visiter la salle consacrÃ©e aux marionnettes. Un petit thÃ©Ã¢tre prÃ©sente des marionnettes en laine et tissu, crÃ©Ã©es par Geo CondÃ©. Quel est le spectacle reprÃ©sentÃ© ?', '0001'),
(53, 'MusÃ©e Arthur Rimbaud', 'Le musÃ©e est ouvert gratuitement pour les habitants de la ville, et pour les moins de 26 ans. Demandez Ã  passer dans le Â« Wasserfall Â». Qu\'y trouvez-vous ?', '5555'),
(54, 'Quai Arthur Rimbaud', 'Entre le musÃ©e et la maison des Ailleurs, l\'artiste quÃ©bÃ©cois Michel Goulet a rÃ©alisÃ© une Å“uvre contemporaine. Sur quoi a-t-il inscrit des poÃ¨mes ?', '1990'),
(55, 'Statue de Charles de Gonzague', 'Quel est le blason de Charleville ?', '1025'),
(56, 'Rue BÃ©rÃ©govoy', 'Trouvez la maison natale d\'Arthur Rimbaud. Quelle boutique est-ce aujourd\'hui ?', '1998'),
(57, 'Boulangerie Billard, rue de la RÃ©publique', 'Le Carolo est une cÃ©lÃ¨bre pÃ¢tisserie locale. Quels en sont les ingrÃ©dients ?', '2729'),
(58, 'Mairie, au coin de la Place Ducale', 'Trouvez les escaliers dans le coin de la Place, au bord de la mairie. Quels curieux bas-reliefs trouve-ton sur le mur qui longe l\'escalier?', '2019');

-- --------------------------------------------------------

--
-- Structure de la table `reponse`
--

DROP TABLE IF EXISTS `reponse`;
CREATE TABLE IF NOT EXISTS `reponse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reponse` text NOT NULL,
  `valid` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=155 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `reponse`
--

INSERT INTO `reponse` (`id`, `reponse`, `valid`) VALUES
(105, 'Ã  placer les canons qui dÃ©fendent les fortifications', 1),
(106, 'Ã  stocker la nourriture Ã  l\'air fais', 0),
(107, 'Ã  observer les environs', 0),
(108, 'un coq', 0),
(109, 'un sanglier', 1),
(110, 'un cerf', 0),
(111, 'un Å“il dans un triangle', 0),
(112, 'un arc-en-ciel', 1),
(113, 'un coeur', 0),
(114, '83', 1),
(115, '63', 0),
(116, '76', 0),
(117, 'ils sont peints en peinture fluorescente', 1),
(118, 'ils sont peints en noir', 0),
(119, 'la petite fille n\'a pas de mains ni de tÃªte', 0),
(120, 'les drapeaux', 0),
(121, ' les 6 statues des Muses', 1),
(122, 'un dÃ´me', 0),
(123, 'une fleur de lotus', 0),
(124, 'une tÃªte de pharaon', 0),
(125, 'un scarabÃ©e ailÃ©', 1),
(126, 'Renaut, Allard, Guichard, et Richard', 1),
(127, 'Allard, Richard, Renart et Guillaume', 0),
(128, 'Guillaume, Renaud, Guichard et Richard', 0),
(129, 'Barbe Bleue', 0),
(130, 'le dragon de MÃ©ziÃ¨res', 0),
(131, 'Blanche-Neige et les sept nains', 1),
(132, 'les roues de l\'ancien moulin', 0),
(133, 'un portrait d\'Arthur Rimbaud par le street artiste Ernest Pignon-Ernest', 1),
(134, 'une installation sonore dÃ©clamant les poÃ¨mes de Rimbaud', 0),
(135, 'des totems', 0),
(136, 'des tÃªtes de Rimbaud', 0),
(137, 'des chaises', 1),
(138, 'une tÃªte de lion entourÃ©e d\'un soleil', 0),
(139, 'une Ã©pÃ©e surmontÃ©e d\'un soleil, avec deux rameaux', 1),
(140, 'un dauphin avec une couronne', 0),
(141, 'un boulanger', 0),
(142, 'une boutique de bijoux', 0),
(143, 'pÃ¢te d\'amandes et feuillantines', 0),
(144, 'noisettes et ganache au chocolat', 0),
(145, 'meringue et crÃ¨me au pralin', 1),
(146, 'des tÃªtes', 1),
(147, 'des soleils', 0),
(148, 'des palmes', 0),
(149, 'reponse1', 0),
(150, 'reponse2', 1),
(151, 'reponse3', 0),
(152, 'reponse21', 1),
(153, 'reponse22', 0),
(154, 'reponse23', 0);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `appartenir`
--
ALTER TABLE `appartenir`
  ADD CONSTRAINT `belong_to_question0_FK` FOREIGN KEY (`id_question`) REFERENCES `question` (`id`),
  ADD CONSTRAINT `belong_to_reponse_FK` FOREIGN KEY (`id`) REFERENCES `reponse` (`id`);

--
-- Contraintes pour la table `avoir`
--
ALTER TABLE `avoir`
  ADD CONSTRAINT `have_qcm0_FK` FOREIGN KEY (`id_qcm`) REFERENCES `qcm` (`id`),
  ADD CONSTRAINT `have_question_FK` FOREIGN KEY (`id`) REFERENCES `question` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
