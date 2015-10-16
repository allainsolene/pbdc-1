-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Ven 25 Septembre 2015 à 16:21
-- Version du serveur :  5.6.17
-- Version de PHP :  5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `alae_cano_chopin_allain`
--

-- --------------------------------------------------------

--
-- Structure de la table `administrateur`
--

CREATE TABLE IF NOT EXISTS `administrateur` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `identifiant` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `mp` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `administrateur`
--

INSERT INTO `administrateur` (`id`, `identifiant`, `mp`) VALUES
(1, 'florian', '0147896325'),
(2, 'mathieu', '5236987410'),
(3, 'solene', '9874102365');

-- --------------------------------------------------------

--
-- Structure de la table `commentaireenfant`
--

CREATE TABLE IF NOT EXISTS `commentaireenfant` (
  `id_enfant` int(3) NOT NULL,
  `id_personnel` int(3) NOT NULL,
  `commentaire_enfant` varchar(100) NOT NULL,
  PRIMARY KEY (`id_enfant`),
  KEY `id_personnel` (`id_personnel`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `commentaireenfant`
--

INSERT INTO `commentaireenfant` (`id_enfant`, `id_personnel`, `commentaire_enfant`) VALUES
(1, 3, 'encastre legos'),
(2, 1, 'marche tout seul');

-- --------------------------------------------------------

--
-- Structure de la table `enfant`
--

CREATE TABLE IF NOT EXISTS `enfant` (
  `id_enfant` int(3) NOT NULL AUTO_INCREMENT,
  `nom_enfant` varchar(30) COLLATE utf8_bin NOT NULL,
  `prenom_enfant` varchar(30) COLLATE utf8_bin NOT NULL,
  `commentaire_enfant` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id_enfant`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=4 ;

--
-- Contenu de la table `enfant`
--

INSERT INTO `enfant` (`id_enfant`, `nom_enfant`, `prenom_enfant`, `commentaire_enfant`) VALUES
(1, 'Chopin', 'Mathieu', ''),
(2, 'Cano', 'Florian', 'asthme'),
(3, 'Allain', 'Solene', '');

-- --------------------------------------------------------

--
-- Structure de la table `famille`
--

CREATE TABLE IF NOT EXISTS `famille` (
  `id_famille` int(3) NOT NULL AUTO_INCREMENT,
  `identifiant` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `mp` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `nom1` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `prenom1` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `adresse11` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `adresse12` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `cp1` int(5) unsigned zerofill DEFAULT NULL,
  `ville1` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `mail1` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `tel11` varchar(15) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `tel12` varchar(15) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `tel13` varchar(15) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `fonction1` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'Père Mère Autre',
  `nom2` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `prenom2` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `adresse21` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `adresse22` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `cp2` char(5) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ville2` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `mail2` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `tel21` varchar(15) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `tel22` varchar(15) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `tel23` varchar(15) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `fonction2` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'Père Mère Autre',
  `date_envoi_mail_demande_inscription` date DEFAULT NULL,
  PRIMARY KEY (`id_famille`),
  UNIQUE KEY `identifiant` (`identifiant`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Contenu de la table `famille`
--

INSERT INTO `famille` (`id_famille`, `identifiant`, `mp`, `nom1`, `prenom1`, `adresse11`, `adresse12`, `cp1`, `ville1`, `mail1`, `tel11`, `tel12`, `tel13`, `fonction1`, `nom2`, `prenom2`, `adresse21`, `adresse22`, `cp2`, `ville2`, `mail2`, `tel21`, `tel22`, `tel23`, `fonction2`, `date_envoi_mail_demande_inscription`) VALUES
(1, 'Chopin', '0123456789', 'Chopin', 'Christine', '113 avenue fontevraud', NULL, 49400, 'saumur', 'chopiC@gmail.com', '0660216979', NULL, NULL, 'directeur d''agence', 'Chopin', 'Didier', '113 avenue fontevraud', NULL, '49400', 'saumur', 'chopiD@gmail.com', '0658729407', NULL, NULL, 'boulanger', '2015-09-17'),
(9, '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `inscriptionenfant`
--

CREATE TABLE IF NOT EXISTS `inscriptionenfant` (
  `id_famille` int(3) NOT NULL,
  `id_enfant` int(3) NOT NULL,
  PRIMARY KEY (`id_famille`,`id_enfant`),
  KEY `id_enfant` (`id_enfant`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Contenu de la table `inscriptionenfant`
--

INSERT INTO `inscriptionenfant` (`id_famille`, `id_enfant`) VALUES
(1, 2);

-- --------------------------------------------------------

--
-- Structure de la table `inscriptionfamille`
--

CREATE TABLE IF NOT EXISTS `inscriptionfamille` (
  `id` int(3) NOT NULL,
  `id_famille` int(3) NOT NULL,
  PRIMARY KEY (`id`,`id_famille`),
  KEY `id_famille` (`id_famille`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `inscriptionfamille`
--

INSERT INTO `inscriptionfamille` (`id`, `id_famille`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `personnel`
--

CREATE TABLE IF NOT EXISTS `personnel` (
  `id_personnel` int(3) NOT NULL AUTO_INCREMENT,
  `login` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `mdp_personnel` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'pbcd49',
  PRIMARY KEY (`id_personnel`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `personnel`
--

INSERT INTO `personnel` (`id_personnel`, `login`, `mdp_personnel`) VALUES
(1, 'Damien', 'pbcd49'),
(2, 'Mickael', 'pbcd49'),
(3, 'Thomas', 'pbcd49');

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `commentaireenfant`
--
ALTER TABLE `commentaireenfant`
  ADD CONSTRAINT `commentaireenfant_ibfk_1` FOREIGN KEY (`id_enfant`) REFERENCES `enfant` (`id_enfant`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `commentaireenfant_ibfk_2` FOREIGN KEY (`id_personnel`) REFERENCES `personnel` (`id_personnel`);

--
-- Contraintes pour la table `inscriptionenfant`
--
ALTER TABLE `inscriptionenfant`
  ADD CONSTRAINT `inscriptionenfant_ibfk_2` FOREIGN KEY (`id_enfant`) REFERENCES `enfant` (`id_enfant`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `inscriptionenfant_ibfk_1` FOREIGN KEY (`id_famille`) REFERENCES `famille` (`id_famille`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `inscriptionfamille`
--
ALTER TABLE `inscriptionfamille`
  ADD CONSTRAINT `inscriptionfamille_ibfk_2` FOREIGN KEY (`id_famille`) REFERENCES `famille` (`id_famille`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `inscriptionfamille_ibfk_1` FOREIGN KEY (`id`) REFERENCES `administrateur` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
