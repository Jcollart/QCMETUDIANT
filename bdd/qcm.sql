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

CREATE TABLE `etudiant` (
  `id_etudiant` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `participant` varchar(255) NOT NULL,
  `cle` varchar(255) NOT NULL,
  `actif` varchar(255) NOT NULL,
  `etablissement` varchar(255) NOT NULL,
  `nom_team` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(56, 'FANTI', 'Murielle', 'Team108', 'murielle.fanti@yahoo.com ', '0609763287', '1', 'e06150eaa539481e2070b37abc2adf3b', '1', 'IFSI', 'Team nÂ°1'),
(57, 'GUERIN', 'CharlÃ¨ne', 'Team108', 'wilmet.charlene@orange.fr', '0688270907', '2', 'ca651b575b5c2d73f0e0bba1e61b5f7d', '1', 'IFSI', 'Team nÂ°1'),
(58, 'LANGLET', 'Annabel', 'Team108', 'langlet.annabel@ifsi08.fr', '0619144458', '3', '8a78bb79d3df0079437df8ba1e798cfe', '1', 'IFSI', 'Team nÂ°1'),
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
(72, 'Pillier ', 'MÃ©linda', 'Lescoupines', 'melinda.plr@outlook.com', '0630386281', '1', 'af2ac201e4e3a9bc11ff03ca5e87f978', '1', 'IFSI', 'Les DrÃ´les de Dames'),
(74, 'Rousseaux', 'StÃ©phanie', 'Lescoupines', 'stephanie.rousseaux@outlook.fr', '0621497377', '2', 'c86360032f5fcf1d619adbf2deab0660', '1', 'IFSI', 'Les DrÃ´les de Dames'),
(76, 'SacrÃ©', 'Colleen', 'Lescoupines', 'colleen.sacre08@laposte.net', '0635595075', '3', 'b5703e49d972e5774a81149c738b3d00', '0', 'IFSI', 'Les DrÃ´les de Dames'),
(78, 'Renaux', 'LÃ©a', 'Lescoupines', 'lea.renaux@outlook.com', '0642886001', '4', '07fe529aa2caa52dda1a60e6142b7135', '1', 'IFSI', 'Les DrÃ´les de Dames'),
(80, 'Moreau', 'Marie', 'Lescoupines', 'moreau.marie08000@gmail.com', '0659324159', '5', '52202905505c9438df6b6508bbc3a646', '1', 'IFSI', 'Les DrÃ´les de Dames'),
(81, 'Jaloux ', 'AmÃ©lie', 'ameldu08', 'amelie.jlx08@gmail.com', '0750996220', '1', '580732cc1ab643f42168a5f5e74df4e2', '1', 'IFSI', 'LMMAC'),
(82, 'WOILLARD', 'Manon', 'ameldu08', 'manonwoillard8@gmail.com', '0650409961', '2', '27d27a88e20a2b5ebb3f706230a48bbd', '1', 'IFSI', 'LMMAC'),
(83, 'Demarly', 'ClÃ©mence', 'ameldu08', 'dem79clem@gmail.com', '0610865336', '3', '94483eb4f56640587f47204c2cd54000', '1', 'IFSI', 'LMMAC'),
(84, 'ROLLAND', 'Morgane', 'ameldu08', 'Morgane.rolland.61@gmail.com', '0634215992', '4', '8a7b732d59c42bfca0a2ad942393936c', '1', 'IFSI', 'LMMAC'),
(85, 'CAMPORINI', 'Lou Anna', 'ameldu08', 'Campoloune@gmail.com', '0763417264', '5', '56264a3dfedd62b221b98c2a7c261100', '1', 'IFSI', 'LMMAC'),
(86, 'Mabilat', 'Pierre', 'HorizonS Etudiants', 'pierre.mabilat0187@gmail.com', '0679392202', '1', 'a6b903e9ce64645f6497abdb9825ab9c', '1', 'IUTRCC', 'Les paupiettes'),
(87, 'Bardey', 'Maylie', 'HorizonS Etudiants', 'maylie.bardey@gmail.com', '0689448256', '2', '7eae0fe7d696d2761b28ffd3619b44b7', '1', 'IUTRCC', 'Les paupiettes'),
(88, 'Vilvandre', 'Alicia', 'HorizonS Etudiants', 'alicia.vilvandre@etudiant.univ-reims.fr', '0659291095', '3', 'fe1581e04e25411a5c7dff77d6a76fb4', '0', 'IUTRCC', 'Les paupiettes'),
(89, 'Saintin', 'Prunelle', 'HorizonS Etudiants', 'Prunelle1.s1@gmail.com', '0678249475', '4', 'e20ebabf78a5feb27d766613192840ad', '1', 'IUTRCC', 'Les paupiettes'),
(90, 'Keilmann', 'Justine', 'HorizonS Etudiants', 'Justinekeilmann@hotmail.fr', '0629812277', '5', '4de7734f59b28dbc6aa80a2d84427e0c', '0', 'IUTRCC', 'Les paupiettes'),
(91, 'Ledoux', 'AngÃ¨le', 'SAM1', 'angele.ledoux@gmail.com', '0778952541', '1', '598f3c0b96dc48137f2451b76a56898a', '1', 'LMDS', 'SAM 1'),
(92, 'Didier', 'Emeline', 'SAM1', 'emeline.didier1@icloud.fr', '0638463692', '2', '72a7dd1dc8f0fe303d43a5bdc873d01a', '0', 'LMDS', 'SAM 1'),
(93, 'Daniel', 'Justine', 'SAM1', 'danieljustine0@gmail.com', '0606785572', '3', '5a3498800f08cdcff4d1ecf171554905', '1', 'LMDS', 'SAM 1'),
(94, 'Makhloufi', 'Lia', 'SAM1', 'lia.makhloufi1@gmail.com', '0652666588', '4', '6781fc755fdd3ebe779193a4417e484b', '1', 'LMDS', 'SAM 1'),
(95, 'Ahn', 'Paola', 'SAM1', 'paolaahnn1@gmail.com', '0635497199', '5', 'fd89bf0eff30825ca6ee3f712424312a', '1', 'LMDS', 'SAM 1'),
(96, 'Dehas', 'Ryad', 'btssam', 'dehasryad53@gmail.com', '0769860734', '1', '423fd0cdcd202619ce5497c59cbfff19', '1', 'LMDS', 'SÃ©vi\'Team'),
(97, 'Lavarde', 'Yanis', 'btssam', 'lavarde.yanis08@gmail.com', '0675588918', '2', 'f1c789eda63a0a09d3a09116aef6fb88', '1', 'LMDS', 'SÃ©vi\'Team'),
(98, 'Beloucif', 'StÃ©phane', 'btssam', 'beloucifstephane11@gmail.com', '0763417258', '3', 'dc7106bbb5e7237de7eac88746c99cf7', '1', 'LMDS', 'SÃ©vi\'Team'),
(99, 'Guez', 'Wendy', 'btssam', 'wendyguezd@gmail.com', '0770263983', '4', 'f878a554737788b28d2e1d5fe98a2eb1', '1', 'LMDS', 'SÃ©vi\'Team'),
(100, 'Pereira Da Silva ', 'Lucie', 'btssam', 'luciepereiradasilva4@gmail.com', '0787159855', '5', 'ea41eaa317ad9062a127a5e922882bf6', '1', 'LMDS', 'SÃ©vi\'Team'),
(101, 'ROMAIN', 'Alexis', '123456', 'alexislogobi@icloud.com', '0771868542', '1', 'ee8dea76dca86a5a67e19941bd1e2e5b', '1', 'LMDS', 'Les 5'),
(102, 'RAHEM', 'Ryan', '123456', 'ryan.rahem@gmail.com', '0694897962', '2', '25501fcc1117840d2d2d995e33f8e394', '1', 'LMDS', 'Les 5'),
(103, 'UHILAMOAFA', 'Maickel', '123456', 'muhila067@gmail.com', '0618365933', '3', 'd0516759baff302064e991bfcb28cc59', '1', 'LMDS', 'Les 5'),
(104, 'BLAIN', 'AlizÃ©e', '123456', 'alizee.blain@gmail.com', '0695108566', '4', 'f1d5649cc1ce5f10136730b8ee91fee0', '1', 'LMDS', 'Les 5'),
(105, 'CHEVALIER', 'Alexandra', '123456', 'alexandra-chevalier@outlook.com', '0695108566', '5', 'b32d3b52db0b7086a6dc911c671e75c9', '1', 'LMDS', 'Les 5'),
(106, 'Mathy', 'Emilie', 'SAM 1 et 2 ', 'emilie.mathy08@gmail.com', '0781820274', '1', 'f7a990ea9bdcb46f0a9e5bef394cb035', '1', 'LMDS', 'SAM 1 et 2 '),
(107, 'Hourlier', 'LÃ©ana', 'SAM 1 et 2 ', 'leana.hourlier@gmail.com', '0635263843', '2', '2a9e469114a7262a8657364bbeda57a4', '1', 'LMDS', 'SAM 1 et 2 '),
(108, 'Turquin', 'Marie', 'SAM 1 et 2 ', 'marieturquin@gmail.com', '06.87.01.01.49', '3', 'e8b7eb2cc285fe8ebfef8050e77e3056', '1', 'LMDS', 'SAM 1 et 2 '),
(109, 'Biason', 'OcÃ©ane', 'SAM 1 et 2 ', 'obiason.etion@gmail.com', '0619031532', '4', '2ee432ba9f8b336a4b9ec6ea827136a8', '1', 'LMDS', 'SAM 1 et 2 '),
(110, 'gobron', 'flavie', 'SAM 1 et 2 ', 'flavie.gobron@gmail.com', '0781093448', '5', 'a4cb8266bf24acc7d1975101ef9d1239', '0', 'LMDS', 'SAM 1 et 2 '),
(111, 'marques de andrade', 'Ã©lisa', 'btssam2019', 'moge.elisa08@gmail.com', '0684396057', '1', '9b9c1c3062e330365eb7104b3db082fd', '1', 'LMDS', 'SÃ©vi Team '),
(112, 'idri', 'sonia', 'btssam2019', 'soniaidriidri@gmail.com', '06 52 65 79 33', '2', '52b13c13ed02cd677665af9c3e405bb9', '1', 'LMDS', 'SÃ©vi Team '),
(113, 'chlendi', 'anais', 'btssam2019', 'anaiis.basket14@gmail.com', '0618154122', '3', 'c471ef9ab29e395c479d745cdd9a3aa7', '1', 'LMDS', 'SÃ©vi Team '),
(114, 'ANTOINE', 'Lise-Marie', 'btssam2019', 'lisemarie08@hotmail.fr', '0623206106', '4', 'a1acf55d8b5ed482a8eec0dc328984d3', '1', 'LMDS', 'SÃ©vi Team '),
(115, 'Guillaume', 'Killyan', 'btssam2019', 'guillaume.killyan@gmail.com', '0750927645', '5', 'bcdbc6d01b8a4a2602dc3a7823c45e19', '1', 'LMDS', 'SÃ©vi Team '),
(116, 'Sivritepe', 'Ayse', 'btssam', 'sivritepeayse82@gmail.com', '0787747010', '1', 'b9785e31a5c70b3148e80b6ca6f607f5', '1', 'LMDS', 'Team\'emreidris'),
(117, 'Sehl', 'Yacine', 'btssam', 'bm134492@gmail.com', '0761329903', '2', '585111121104ea2025ac99e739592faa', '1', 'LMDS', 'Team\'emreidris'),
(118, 'Moussaoui ', 'Yannis', 'btssam', 'yannismoussaoui0@gmail.com', '0770481737', '3', '0e08c9e683f93e222a11df0be31520a8', '1', 'LMDS', 'Team\'emreidris'),
(119, 'DA CUNHA LOPES', 'ThÃ©a', 'btssam', 'thealopes6@gmail.com', '0650909138', '4', 'a671eba571f4724bef517146abc797de', '1', 'LMDS', 'Team\'emreidris'),
(120, 'Delizee', 'Ludivine', 'btssam', 'ludivine.delizee@orange.fr', '0615454341', '5', '35793dfc613772d05bbac3635d56df61', '1', 'LMDS', 'Team\'emreidris'),
(121, 'KOca', 'Esranur', 'TeamSAM', 'kocaesranur1@gmail.com', '0769140022', '1', 'c9ce0740bdfb685379a993ba70a5b706', '1', 'IUTRCC', 'TeamSAM'),
(122, 'Toumi', 'Amira', 'TeamSAM', 'amiraa.toumi08@gmail.com', '0767528821', '2', 'ebb4e32f22e02dc2d997da40c6fdb3fc', '1', 'IUTRCC', 'TeamSAM'),
(123, 'Thiebaut', 'Emeline', 'TeamSAM', 'emelinetf@outlook.fr', '0650696694', '3', 'fe6c264681fb4548414a902e4473cfea', '1', 'IUTRCC', 'TeamSAM'),
(124, 'Petitpas', 'Caroline', 'TeamSAM', 'caroline.petitpas.08@gmail.com', '0631188973', '4', '247c57e13fbf88724b9ade80f0e72635', '1', 'IUTRCC', 'TeamSAM'),
(125, 'touahria', 'donia', 'TeamSAM', 'doniatouahria@hotmail.com', '0623528596', '5', 'c9b8384ad8919860d5a9ffe0c0edf34e', '1', 'IUTRCC', 'TeamSAM'),
(126, 'Nicolas', 'Alice', '11la74po', 'alicenicolas08@gmail.com', '06 21 12 82 00 ', '1', '1e947030feae7bac37ee2486468b6f06', '1', 'LMDS', 'integrationsam'),
(127, 'Verlaine', 'Anais', '11la74po', 'anaisverlaine10@gmail.com', '0646287641', '2', '50cfc7695bf75d94fd1e3d825ea10861', '1', 'LMDS', 'integrationsam'),
(128, 'Noyelles', 'Elodie', '11la74po', 'elodie.adam08@gmail.com', '0649020829', '3', '10495efd5cf3e22321dd91777f1120a6', '1', 'LMDS', 'integrationsam'),
(129, 'Braconnier', 'Paul', '11la74po', 'braconnier.paulsession2019@gmail.com', '06 37 23 13 06', '4', '25cc14a705044eb061324adb65f44ee5', '1', 'LMDS', 'integrationsam'),
(130, 'Boulent', 'StÃ©phanie', '11la74po', 'Boulent1808@gmail.com', '06 56 75 33 85', '5', '7ee629da63125386324c50a7762ff136', '0', 'LMDS', 'integrationsam'),
(131, 'DECARREAUX', 'Pauline', 'QDAVS', 'pdecarreaux.etion@gmail.com', '', '1', 'ce40cc7938b735f77ed1dd6e63f7821a', '1', 'IUTRCC', 'QDAVS'),
(132, 'QUIMPER', 'MaÃ©va', 'QDAVS', 'maevaquimp@hotmail.fr', '', '2', '54ab27bcc61ba96665f40ad6d33ac55f', '0', 'IUTRCC', 'QDAVS'),
(133, 'SAVAS ', 'MervÃ©', 'QDAVS', 'meerveesvs@hotmail.com', '', '3', '1d081329261e8409c911be0b26491cc7', '1', 'IUTRCC', 'QDAVS'),
(134, 'AKTAS ', 'melek', 'QDAVS', 'aktsm61@gmail.com', '', '4', 'f9a42d3aa1eaeb542a57389e7f5c3d94', '1', 'IUTRCC', 'QDAVS'),
(135, 'VIGIER BROBECK', 'Mina', 'QDAVS', 'minavigierbrobeck@gmail.com', '0750299155', '5', '87fca41c1249b1db2a52ead1c973748b', '1', 'IUTRCC', 'QDAVS'),
(141, 'marchal', 'maxence', 'maxencebazin', 'maxence.marchal08@gmail.com', '0630166295', '1', 'b7723ca4a37f5b1a224dce4f80eaea6b', '1', 'LDMB', 'les ravagÃ©s'),
(142, 'gerard', 'nicolas', 'maxencebazin', 'gerardnicolas7@gmail.com', '0651030458', '2', '4679efcfc9943359e47db21e3bf9991f', '1', 'LDMB', 'les ravagÃ©s'),
(143, 'astier', 'Baptiste', 'maxencebazin', 'baptisteastier08270@gmail.com', '0781537112', '3', '7f8365a9acd9cc76e87143cffb53e138', '1', 'LDMB', 'les ravagÃ©s'),
(144, 'godot', 'thomas', 'maxencebazin', 'thomas.godot2109@gmail.com', '0619342986', '4', 'a183ef1548f8a25a737166f6a2c5c51b', '1', 'LDMB', 'les ravagÃ©s'),
(145, 'amalfitano', 'loris', 'maxencebazin', 'amalfitanoloris1704@gmail.com', '0610585527', '5', '8683d0dda1ef24ac5fcb6752cbebd3a4', '1', 'LDMB', 'les ravagÃ©s'),
(146, 'ZAGHDANE', 'Dounia', 'orzyzoo', 'douniazaghdane@gmail.com', '0767545016', '1', '5484af65efe096b2e921a70e42dad2ad', '1', 'LMDS', '240 BASTOS'),
(147, 'Bouillard', 'Sophie', 'orzyzoo', 'sbouillard.etion@gmail.com', '0644745470', '2', 'e344e7956d2a6eb20e913503473803e0', '1', 'LMDS', '240 BASTOS'),
(148, 'Gelu', 'Alison', 'orzyzoo', 'gelualison@gmail.com', '0695180559', '3', '9c88f395f23a14e458bf151e0e4ab211', '1', 'LMDS', '240 BASTOS'),
(149, 'Machado', 'Maeva', 'orzyzoo', 'maevamachadorodrigues@gmail.com', '0640602386', '4', '5f4f40e4ee2bd4ad7004699af5103405', '1', 'LMDS', '240 BASTOS'),
(150, 'Moulin', 'Kenza', 'orzyzoo', 'kenzamoulin@gmail.com', '0616328155', '5', 'ce632f662e5b87752db22200d10b82dd', '0', 'LMDS', '240 BASTOS'),
(151, 'BELNER', 'Hugo', 'cdi3guh', 'hbelner08@gmail.com', '0688132068', '1', '260fd8a47026fcf3d24f1d48e9d2a48a', '1', 'LMDS', 'Equipe Dozo'),
(152, 'DEMONTIS ', 'Marvyn', 'cdi3guh', 'marvyn.demontis.pro@gmail.com', '0645786412', '2', 'a00b9f60ab975403a461dc741020beec', '1', 'LMDS', 'Equipe Dozo'),
(153, 'GANDON', 'Simon', 'cdi3guh', 'gandonsimon@gmail.com', '0640054420', '3', '4ceaaaebed31097c35e2302487aa0c1b', '1', 'LMDS', 'Equipe Dozo'),
(154, 'JACQUAT', 'MaÃ«lle', 'cdi3guh', 'maelle.jacquat@gmail.com', '0760887726', '4', '622851e8f194ed7fe5bb52d3f0d5419e', '1', 'LMDS', 'Equipe Dozo'),
(155, 'SALZINGER', 'Lisa', 'cdi3guh', 'salzingerlisa@gmail.com', '0660089663', '5', '43c5c03bdf6d08ebcc1286f9c87d9f2c', '1', 'LMDS', 'Equipe Dozo'),
(156, 'Cerniaski', 'Eva', 'Groupe9', 'em.cerniaski@gmail.com', '0761772164', '1', 'a7a6ba34d423106a874a084d5e1f39f9', '1', 'LMDS', 'Groupe9'),
(157, 'Terreux', 'Justine', 'Groupe9', 'justineterreux@hotmail.fr', '0666615330', '2', '5fb7eb6f9b55768fc1fed75711600821', '0', 'LMDS', 'Groupe9'),
(158, 'Pannier', 'Sarah', 'Groupe9', 'sarah.pannier98@gmail.com', '0627181291', '3', 'ae1623306d95fce7f65c1729c4b0f6b0', '1', 'LMDS', 'Groupe9'),
(159, 'Persinet', 'Lou', 'Groupe9', 'loumiddle@hotmail.fr', '0666903100', '4', '0c6c0d6ce04ed201c944f4adb37791fe', '0', 'LMDS', 'Groupe9'),
(160, 'Lassaux', 'Lucile', 'Groupe9', 'lucile.lassaux08@gmail.com', '0615354578', '5', '6b70d97a06c89f98c5290b5562295d52', '1', 'LMDS', 'Groupe9'),
(161, 'Meyssonnier', 'Lucile', '', 'lucile.meyssonnier@hotmail.fr', '0650214651', '1', 'd6f82cc026f5b9984c761ce27c45a0e8', '1', 'LMDS', 'Les carolos zinzins'),
(162, 'Mkadara', 'Ikma', '', 'ikma.mkadara@gmail.com', '0768614196', '2', '3ae2c98ab986681d6c1f47bfa4fc4479', '1', 'LMDS', 'Les carolos zinzins'),
(163, 'Jeannot', 'Amandine', '', 'amandinejt@yahoo.fr', '0605486477', '3', '4f780cca9033330345fb2935b0e6cda3', '1', 'LMDS', 'Les carolos zinzins'),
(164, 'BLAVIER', 'NATHAN', '', 'nathan.blavier08@gmail.com', '0788178525', '4', 'dc409aaeaaa7298e1ac71d929bea6d90', '1', 'LMDS', 'Les carolos zinzins'),
(165, 'LEOST', 'ALICE', '', 'alice-leost@hotmail.fr', '0649458518', '5', '0c92585c62f7585189e55e1cbe1c5eea', '1', 'LMDS', 'Les carolos zinzins'),
(166, 'ETIENNE', 'oceane', 'mathilde', 'oceane.etienne01@gmail.com', '0670284114', '1', 'b329fbfcedefe89384f2f52a80195e61', '1', 'LMDS', 'Akatsuki'),
(167, 'BAUX', 'Mathilde', 'mathilde', 'bauxmathilde@gmail.com', '0623161654', '2', '6ad79c4d450d6f4f6dca12a8e400da7d', '1', 'LMDS', 'Akatsuki'),
(168, 'DONDY', 'Jason', 'mathilde', 'jasondondy@gmail.com', '0624317246', '3', 'bae797e04af48e0a37edadea3cea10e1', '1', 'LMDS', 'Akatsuki'),
(169, 'BOURGAIN', 'Emma', 'mathilde', 'emma.bourgain@outlook.fr', '0652818517', '4', '2166335b635d52f14924222516cda291', '1', 'LMDS', 'Akatsuki'),
(170, 'LELAURIN', 'LÃ©a', 'mathilde', 'lelaurinlea15@gmail.com', '0787741765', '5', '1950637f5b537586daf00dc0c9a1680e', '0', 'LMDS', 'Akatsuki');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `etudiant`
--
ALTER TABLE `etudiant`
  ADD PRIMARY KEY (`id_etudiant`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `etudiant`
--
ALTER TABLE `etudiant`
  MODIFY `id_etudiant` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=171;COMMIT;

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
