-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 05, 2022 at 09:47 AM
-- Server version: 5.7.31
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `iset_rades_deploiment`
--

-- --------------------------------------------------------

--
-- Table structure for table `activites`
--

DROP TABLE IF EXISTS `activites`;
CREATE TABLE IF NOT EXISTS `activites` (
  `id_activites` int(11) NOT NULL,
  `titre_act` varchar(255) NOT NULL,
  `description_act` varchar(255) NOT NULL,
  `date_act` varchar(200) NOT NULL,
  `id_club` int(11) NOT NULL,
  PRIMARY KEY (`id_activites`),
  KEY `id_club` (`id_club`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `adresse`
--

DROP TABLE IF EXISTS `adresse`;
CREATE TABLE IF NOT EXISTS `adresse` (
  `id_adresse` int(11) NOT NULL,
  `code_postale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `rue` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ville` int(11) NOT NULL,
  `gouvernorat_adresse` int(11) NOT NULL,
  `pays` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  PRIMARY KEY (`id_adresse`),
  KEY `id_user` (`id_user`),
  KEY `fk_pays` (`pays`),
  KEY `fk_vil` (`ville`),
  KEY `fk_gouvernerat` (`gouvernorat_adresse`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `adresse`
--

INSERT INTO `adresse` (`id_adresse`, `code_postale`, `rue`, `ville`, `gouvernorat_adresse`, `pays`, `id_user`) VALUES
(0, '5015', 'Rue Fradj Bouzid', 1, 1, 1, 0),
(2, '2041', 'ariena', 1, 38, 1, 1),
(11, '8080', 'ariana', 1, 1, 1, 12),
(27, '2000', 'gabes', 1, 38, 1, 2),
(48, '2041', 'sqs', 1, 5, 1, 8),
(50, '8080', 'ariana', 1, 3, 1, 9),
(53, '7505', '13 rue', 1, 1, 1, 13),
(54, '7050', '13 rue', 1, 1, 1, 14),
(55, '7050', '13 rue', 1, 1, 1, 15),
(56, '7050', '13 rue', 1, 1, 1, 16),
(57, '7050', '13 rue', 1, 1, 1, 17),
(58, '7050', '13 rue', 1, 1, 1, 18),
(59, '7050', '13 rue', 1, 1, 1, 19),
(60, '7050', '13 rue', 1, 2, 1, 20),
(61, '7050', '13 rue', 1, 1, 1, 21),
(62, '2041', '13 rue', 1, 3, 1, 22),
(63, '7050', '', 1, 1, 1, 23),
(64, '7050', '', 1, 1, 1, 24),
(65, '7050', '', 1, 1, 1, 25),
(66, '7050', '', 1, 2, 1, 26),
(67, '', '13 rue', 1, 1, 1, 34),
(68, '7050', '', 1, 1, 1, 37);

-- --------------------------------------------------------

--
-- Table structure for table `bacclaureat`
--

DROP TABLE IF EXISTS `bacclaureat`;
CREATE TABLE IF NOT EXISTS `bacclaureat` (
  `id_bacc` int(11) NOT NULL,
  `annee` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `section` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mention` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `session` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `moyenne` float NOT NULL,
  PRIMARY KEY (`id_bacc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `bacclaureat`
--

INSERT INTO `bacclaureat` (`id_bacc`, `annee`, `section`, `mention`, `session`, `moyenne`) VALUES
(1, '2017', 'info', 'tres bien', 'principale', 16),
(18, '2017', 'Science', 'Passable', 'Principale', 10),
(19, '2010', 'Informatique', 'Excellent', 'Principale', 18.5),
(20, '2017', 'Informatique', 'Passable', 'Principale', 10),
(21, '1992', 'Technique', 'Trés Bien', 'Principale', 15.75),
(22, '2017', 'Informatique', 'Passable', 'Principale', 10),
(23, '2017', 'Informatique', 'Passable', 'Principale', 10),
(24, '2017', 'Informatique', 'Bien', 'Principale', 16.5);

-- --------------------------------------------------------

--
-- Table structure for table `calendrier`
--

DROP TABLE IF EXISTS `calendrier`;
CREATE TABLE IF NOT EXISTS `calendrier` (
  `id_calendrier` int(11) NOT NULL,
  `description` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `titre` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `date` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `temps` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `id_club` int(11) NOT NULL,
  PRIMARY KEY (`id_calendrier`),
  KEY `id_club` (`id_club`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `classe`
--

DROP TABLE IF EXISTS `classe`;
CREATE TABLE IF NOT EXISTS `classe` (
  `id_classe` int(11) NOT NULL COMMENT 'exemple : MPDAM, L3-DSI2',
  `libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `id_responsable` int(11) NOT NULL,
  `nb_etudiant` int(11) NOT NULL,
  PRIMARY KEY (`id_classe`),
  KEY `id_responsable` (`id_responsable`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `classe`
--

INSERT INTO `classe` (`id_classe`, `libelle`, `id_responsable`, `nb_etudiant`) VALUES
(1, 'kjkjk', 1, 23);

-- --------------------------------------------------------

--
-- Table structure for table `club`
--

DROP TABLE IF EXISTS `club`;
CREATE TABLE IF NOT EXISTS `club` (
  `id_club` int(11) NOT NULL,
  `nom_club` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `date_creation` date NOT NULL,
  `description` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `domaine` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `logo` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `id_membre` int(11) NOT NULL,
  PRIMARY KEY (`id_club`),
  KEY `id_membre` (`id_membre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `commentaire_publication`
--

DROP TABLE IF EXISTS `commentaire_publication`;
CREATE TABLE IF NOT EXISTS `commentaire_publication` (
  `id_commentaire` int(11) NOT NULL,
  `date` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `heure` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `id_publication` int(11) NOT NULL,
  `description` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `id_membre` int(11) NOT NULL,
  PRIMARY KEY (`id_commentaire`),
  KEY `id_publication` (`id_publication`),
  KEY `id_membre` (`id_membre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `competence`
--

DROP TABLE IF EXISTS `competence`;
CREATE TABLE IF NOT EXISTS `competence` (
  `id_competence` int(11) NOT NULL,
  `libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `niveau` tinyint(4) NOT NULL DEFAULT '1',
  `id_cv` int(11) NOT NULL,
  PRIMARY KEY (`id_competence`),
  KEY `id_cv` (`id_cv`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
CREATE TABLE IF NOT EXISTS `contact` (
  `id_contact` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `avatar` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `id_status_contact` int(11) NOT NULL,
  `unread` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `mood` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_contact`),
  KEY `id_user` (`id_user`),
  KEY `id_status_contact` (`id_status_contact`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contact_demande_entretien`
--

DROP TABLE IF EXISTS `contact_demande_entretien`;
CREATE TABLE IF NOT EXISTS `contact_demande_entretien` (
  `id_contact_demande_entretien` int(11) NOT NULL,
  `id_etudiant` int(11) NOT NULL,
  `id_responsable_entreprise` int(11) NOT NULL,
  `date_demande` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_offre_stage` int(11) NOT NULL,
  PRIMARY KEY (`id_contact_demande_entretien`),
  KEY `id_etudiant` (`id_etudiant`),
  KEY `id_responsable_entreprise` (`id_responsable_entreprise`),
  KEY `id_offre_stage` (`id_offre_stage`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cursus`
--

DROP TABLE IF EXISTS `cursus`;
CREATE TABLE IF NOT EXISTS `cursus` (
  `id_cursus` int(11) NOT NULL,
  `moyenne` double NOT NULL,
  `credit` int(11) NOT NULL,
  `mention` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `session` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `note_pfe` double DEFAULT NULL,
  `id_domaine` int(11) NOT NULL,
  `id_etablissement` int(11) NOT NULL,
  `id_specialite` int(11) NOT NULL,
  `id_niveau` int(11) NOT NULL,
  `id_etudiant` int(11) NOT NULL,
  `au_fin` int(4) NOT NULL,
  `au_debut` int(4) NOT NULL,
  PRIMARY KEY (`id_cursus`),
  KEY `id_domaine` (`id_domaine`),
  KEY `id_etablissement` (`id_etablissement`),
  KEY `id_specialite` (`id_specialite`),
  KEY `id_niveau` (`id_niveau`),
  KEY `id_etudiant` (`id_etudiant`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cursus`
--

INSERT INTO `cursus` (`id_cursus`, `moyenne`, `credit`, `mention`, `session`, `note_pfe`, `id_domaine`, `id_etablissement`, `id_specialite`, `id_niveau`, `id_etudiant`, `au_fin`, `au_debut`) VALUES
(3, 15, 60, 'Tres Bien', 'Principal', NULL, 2, 2, 2, 3, 1, 2020, 2018),
(4, 15, 54, 'Trés Bien', 'Principale', NULL, 2, 2, 2, 3, 5, 2019, 2018),
(5, 15, 56, 'Trés Bien', 'Principale', NULL, 2, 2, 2, 2, 6, 2019, 2018),
(6, 16, 56, 'Trés Bien', 'Principale', NULL, 2, 2, 2, 4, 6, 2022, 2020),
(7, 15, 54, 'Trés Bien', 'Principale', NULL, 2, 2, 3, 2, 7, 2019, 2018),
(8, 18, 54, 'Excellent', 'Principale', NULL, 2, 2, 3, 3, 7, 2020, 2019),
(10, 12, 54, 'Bien', 'Principale', NULL, 2, 2, 3, 4, 7, 2021, 2020),
(15, 15, 60, 'Trés Bien', 'Principale', 14, 3, 4, 6, 4, 10, 2022, 2020),
(16, 10, 40, 'Passable', 'Principale', 10, 2, 1, 3, 2, 9, 2019, 2018),
(17, 12, 40, 'Bien', 'Principale', 10, 2, 1, 3, 3, 9, 2019, 2019),
(18, 14, 40, 'Bien', 'Principale', 12, 2, 1, 3, 4, 9, 2019, 2020),
(19, 10.4, 45, 'Passable', 'Principale', 10.5, 2, 4, 3, 2, 12, 2010, 2009),
(20, 12, 45, 'Bien', 'Principale', NULL, 2, 1, 3, 3, 12, 2018, 2017),
(21, 12.5, 45, 'Bien', 'Principale', 12, 2, 1, 4, 4, 12, 2018, 2019),
(22, 16, 60, 'Bien', 'Principale', 10, 2, 1, 5, 2, 13, 2019, 2018),
(25, 12, 45, 'Passable', 'Principale', 10, 2, 1, 5, 3, 13, 2020, 2019),
(26, 16, 60, 'Bien', 'Principale', 14, 2, 1, 5, 4, 13, 2021, 2020),
(28, 14, 54, 'Assez bien', 'Principale', 10, 2, 1, 4, 2, 15, 2019, 2018),
(29, 16, 60, 'Bien', 'Controle', 10, 3, 1, 7, 3, 15, 2020, 2019),
(30, 16, 60, 'Bien', 'Principale', 16, 3, 1, 7, 4, 15, 2021, 2020),
(31, 13, 54, 'Assez bien', 'Principale', 10, 2, 1, 4, 2, 16, 2018, 2017),
(32, 14, 54, 'Assez bien', 'Principale', 10, 2, 1, 4, 3, 16, 2019, 2018),
(33, 17, 60, 'Trés Bien', 'Principale', 16, 2, 1, 4, 4, 16, 2020, 2019);

-- --------------------------------------------------------

--
-- Table structure for table `cursusgenerale`
--

DROP TABLE IF EXISTS `cursusgenerale`;
CREATE TABLE IF NOT EXISTS `cursusgenerale` (
  `id_cursusgenerale` int(11) NOT NULL,
  `diplome` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `anneeobtentation` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `etablissement` int(11) NOT NULL,
  `domaine` int(11) NOT NULL,
  `specialite` int(11) NOT NULL,
  `Redoublement` int(11) NOT NULL,
  PRIMARY KEY (`id_cursusgenerale`),
  KEY `fkdomaine` (`domaine`),
  KEY `fkspecialite` (`specialite`),
  KEY `fketab` (`etablissement`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cursusgenerale`
--

INSERT INTO `cursusgenerale` (`id_cursusgenerale`, `diplome`, `anneeobtentation`, `etablissement`, `domaine`, `specialite`, `Redoublement`) VALUES
(1, 'licence', '2017', 5, 1, 2, 1),
(3, 'Maitrise', '2016', 1, 2, 3, 1),
(4, 'Master recherche', '2018', 1, 2, 2, 1),
(5, 'Master appliqué', '2010', 1, 3, 6, 0),
(6, 'Master appliqué', '2001', 2, 2, 3, 0),
(7, 'Licence fondamentale', '2017', 15, 2, 3, 0),
(8, 'Licence fondamentale', '2010', 15, 2, 3, 0),
(9, 'Licence appliquée', '2018', 2, 2, 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `cv`
--

DROP TABLE IF EXISTS `cv`;
CREATE TABLE IF NOT EXISTS `cv` (
  `id_cv` int(11) NOT NULL,
  `specialite` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `id_etudiant` int(11) NOT NULL,
  `id_competence` int(11) NOT NULL,
  `id_experience` int(11) NOT NULL,
  `fichier_cv` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_cv`),
  KEY `id_etudiant` (`id_etudiant`),
  KEY `id_competence` (`id_competence`),
  KEY `id_experience` (`id_experience`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `demande_club`
--

DROP TABLE IF EXISTS `demande_club`;
CREATE TABLE IF NOT EXISTS `demande_club` (
  `id_demande` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `cin` int(11) NOT NULL,
  `equipe` int(11) NOT NULL,
  `id_club` int(11) NOT NULL,
  `motivation` varchar(400) COLLATE utf8_unicode_ci NOT NULL,
  `tel` int(11) NOT NULL,
  `date` date NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `statut` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `id_etudiant` int(11) NOT NULL,
  PRIMARY KEY (`id_demande`),
  KEY `id_etudiant` (`id_etudiant`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `demande_master`
--

DROP TABLE IF EXISTS `demande_master`;
CREATE TABLE IF NOT EXISTS `demande_master` (
  `id_demande` int(11) NOT NULL,
  `date_inscrit` date NOT NULL,
  `id_etat_demande_master` int(11) NOT NULL,
  `id_master` int(11) NOT NULL,
  `id_etudiant` int(11) NOT NULL,
  `fichier` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `note_entretien` double DEFAULT '0',
  `token_demande` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id_demande`),
  KEY `id_etudiant` (`id_etudiant`),
  KEY `id_master` (`id_master`),
  KEY `etat_demande_master` (`id_etat_demande_master`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `demande_master`
--

INSERT INTO `demande_master` (`id_demande`, `date_inscrit`, `id_etat_demande_master`, `id_master`, `id_etudiant`, `fichier`, `note_entretien`, `token_demande`) VALUES
(1, '2021-03-01', 3, 1, 3, '', 0, NULL),
(2, '2021-03-01', 1, 2, 4, '', 0, NULL),
(3, '2021-01-12', 1, 1, 4, '', 0, NULL),
(4, '2021-05-17', 6, 1, 5, 'http://localhost:3000/demande-master/2021-05-17T00-15-48.341ZDEV0001 (4).pdf', 16, NULL),
(5, '2021-06-15', 2, 1, 9, 'http://localhost:3000/demande-master/2021-06-15T08-53-50.404ZBL0001.pdf', 0, NULL),
(6, '2021-06-16', 3, 2, 12, 'http://localhost:3000/demande-master/2021-06-16T08-46-27.920Z_Untitled.pdf', 0, NULL),
(7, '2021-07-20', 3, 2, 13, 'http://localhost:3000/demande-master/2021-07-20T22-00-38.310ZDark Souls - Worldmap.pdf', 0, NULL),
(8, '2021-07-22', 3, 3, 15, 'http://localhost:3000/demande-master/2021-07-22T21-25-45.829ZDark Souls - Worldmap.pdf', 0, NULL),
(10, '2021-07-22', 2, 1, 15, 'http://localhost:3000/demande-master/2021-07-22T21-29-13.078ZDark Souls - Worldmap.pdf', 0, NULL),
(11, '2021-07-23', 4, 1, 13, 'http://localhost:3000/demande-master/2021-07-22T23-27-43.186ZDark Souls - Worldmap.pdf', 0, NULL),
(12, '2021-07-23', 5, 1, 16, 'http://localhost:3000/demande-master/2021-07-23T09-04-39.859ZDark Souls - Worldmap.pdf', 0, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyZXN1bHQiOjEyLCJpYXQiOjE2MzgxNDI1NTZ9.furIwK9St6F8axSHUs-ndNwKdBX50md5fox4P0hv_ek'),
(14, '2021-07-29', 3, 3, 13, 'http://localhost:3000/demande-master/2021-07-29T20-45-00.002ZDark Souls - Worldmap.pdf', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `demande_stage_entreprise`
--

DROP TABLE IF EXISTS `demande_stage_entreprise`;
CREATE TABLE IF NOT EXISTS `demande_stage_entreprise` (
  `id_demande_stage_entreprise` int(11) NOT NULL,
  `id_etudiant` int(11) NOT NULL,
  `id_offre_stage` int(11) NOT NULL,
  `id_etat_demande_stage_entreprise` int(11) NOT NULL DEFAULT '3',
  `date_demande` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `vue` int(1) NOT NULL DEFAULT '0',
  `id_etat_entretien_stage_pfe` int(11) NOT NULL DEFAULT '3',
  `pres_video` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_demande_stage_entreprise`),
  KEY `id_etudiant` (`id_etudiant`),
  KEY `id_offre_stage` (`id_offre_stage`),
  KEY `id_etat_demande_stage_entreprise` (`id_etat_demande_stage_entreprise`),
  KEY `id_etat_entretien_stage_pfe` (`id_etat_entretien_stage_pfe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `demande_stage_etudiant`
--

DROP TABLE IF EXISTS `demande_stage_etudiant`;
CREATE TABLE IF NOT EXISTS `demande_stage_etudiant` (
  `id_demande` int(11) NOT NULL,
  `date_demande` date NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `id_etat_demande_stage_etudiant` int(11) NOT NULL,
  `id_etudiant` int(11) NOT NULL,
  PRIMARY KEY (`id_demande`),
  KEY `id_etat_demande_stage_etudiant` (`id_etat_demande_stage_etudiant`),
  KEY `id_etudiant` (`id_etudiant`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `departement`
--

DROP TABLE IF EXISTS `departement`;
CREATE TABLE IF NOT EXISTS `departement` (
  `id_departement` int(11) NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_departement`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `departement`
--

INSERT INTO `departement` (`id_departement`, `code`, `libelle`, `description`) VALUES
(1, 'llpkk', 'ti', 'kguhjgj'),
(3, 'TI', 'Technologie de l\'informatique ', 'Departement Info'),
(4, 'AL', 'Agro alimentaire ', 'test2'),
(5, 'M', 'Mecanique ', 'test'),
(6, 'E', 'electrique', 'test'),
(9, 'Agro', 'Agro-Alimentaire', 'Agroalimentaire');

-- --------------------------------------------------------

--
-- Table structure for table `diplome`
--

DROP TABLE IF EXISTS `diplome`;
CREATE TABLE IF NOT EXISTS `diplome` (
  `id_diplome` int(11) NOT NULL,
  `libelle_diplome` varchar(255) NOT NULL,
  `annee_etude` int(11) NOT NULL,
  PRIMARY KEY (`id_diplome`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `diplome`
--

INSERT INTO `diplome` (`id_diplome`, `libelle_diplome`, `annee_etude`) VALUES
(1, 'Maitrise', 4),
(2, 'Licence fondamentale', 3),
(7, 'Master recherche', 2),
(4, 'Doctorat', 2),
(5, 'Cycle ingénieur', 5),
(3, 'Licence appliquée', 3),
(8, 'Autre', 5),
(6, 'Master appliqué', 2);

-- --------------------------------------------------------

--
-- Table structure for table `domaine`
--

DROP TABLE IF EXISTS `domaine`;
CREATE TABLE IF NOT EXISTS `domaine` (
  `id_domaine` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_domaine`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `domaine`
--

INSERT INTO `domaine` (`id_domaine`, `libelle`) VALUES
(2, 'Technologies de l\'informatique'),
(3, 'Génie éléctrique'),
(4, 'Sciences économiques et de gestion'),
(5, 'Génie de procédés'),
(6, 'Génie Mécanique');

-- --------------------------------------------------------

--
-- Table structure for table `enseignement`
--

DROP TABLE IF EXISTS `enseignement`;
CREATE TABLE IF NOT EXISTS `enseignement` (
  `id_enseignement` int(11) NOT NULL,
  `id_salle` int(11) NOT NULL,
  `id_seance` int(11) NOT NULL,
  `id_matiere` int(11) NOT NULL,
  `id_enseignant` int(11) NOT NULL COMMENT 'cette id est correspondant pour l''utilisateur qui est un role enseignant ',
  `id_classe` int(11) NOT NULL,
  `id_statut_enseignement` int(11) NOT NULL,
  `jour` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `qr_code` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_enseignement`),
  KEY `id_salle` (`id_salle`),
  KEY `id_seance` (`id_seance`),
  KEY `id_matiere` (`id_matiere`),
  KEY `id_classe` (`id_classe`),
  KEY `id_statut_enseignement` (`id_statut_enseignement`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `enseignement`
--

INSERT INTO `enseignement` (`id_enseignement`, `id_salle`, `id_seance`, `id_matiere`, `id_enseignant`, `id_classe`, `id_statut_enseignement`, `jour`, `qr_code`) VALUES
(1, 1, 1, 1, 1, 1, 1, '11', '');

-- --------------------------------------------------------

--
-- Table structure for table `entreprise`
--

DROP TABLE IF EXISTS `entreprise`;
CREATE TABLE IF NOT EXISTS `entreprise` (
  `id_entreprises` int(11) NOT NULL,
  `nom_societe` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `num_reg_commerce` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `localisation` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `site_web` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `id_domaine` int(11) NOT NULL,
  PRIMARY KEY (`id_entreprises`),
  KEY `id_domaine` (`id_domaine`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `entretien`
--

DROP TABLE IF EXISTS `entretien`;
CREATE TABLE IF NOT EXISTS `entretien` (
  `id_entretien` int(11) NOT NULL,
  `date` date NOT NULL,
  `heure` date NOT NULL,
  `salle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `id_etudiant` int(11) NOT NULL,
  `id_professeur` int(11) NOT NULL,
  PRIMARY KEY (`id_entretien`),
  KEY `id_etudiant` (`id_etudiant`),
  KEY `id_professeur` (`id_professeur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `equipes`
--

DROP TABLE IF EXISTS `equipes`;
CREATE TABLE IF NOT EXISTS `equipes` (
  `id_equipe` int(11) NOT NULL,
  `equipe` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_equipe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `etablissement`
--

DROP TABLE IF EXISTS `etablissement`;
CREATE TABLE IF NOT EXISTS `etablissement` (
  `id_etablissement` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code_postale` text COLLATE utf8_unicode_ci,
  `rue` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ville` int(11) DEFAULT NULL,
  `gouvernorat_adresse` int(11) DEFAULT NULL,
  `code_etablissement` text COLLATE utf8_unicode_ci,
  `site_web` text COLLATE utf8_unicode_ci,
  `logo` text COLLATE utf8_unicode_ci,
  `pays` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_etablissement`),
  KEY `fk_villee` (`ville`),
  KEY `fk_gouver` (`gouvernorat_adresse`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `etablissement`
--

INSERT INTO `etablissement` (`id_etablissement`, `libelle`, `code_postale`, `rue`, `ville`, `gouvernorat_adresse`, `code_etablissement`, `site_web`, `logo`, `pays`) VALUES
(1, 'Institut Supérieur des Etudes Technologiques de Charguia', '5125', 'Rue rades', 1, 5, 'IsetC', 'test.com', 'http://localhost:3000/etablissement_logo/2021-06-12T14-36-08.883Zangular.png', NULL),
(2, 'Institut Supérieur des Etudes Technologiques de Rades', '5125', '147 Rue rades', 1, 3, 'IsetR', '', 'http://localhost:3000/etablissement_logo/2021-06-12T14-36-08.883Zangular.png', NULL),
(3, ' Institut Supérieur des Etudes Technologiques de Mahdia', '5045', '145 rue theodore', 1, 21, 'IsetM', 'isetm.net', 'http://localhost:3000/etablissement_logo/2021-06-15T21-55-09.424Zdownload.png', NULL),
(4, 'Institut Supérieur des Etudes Technologiques de bizerte', '1022', 'bizerte', 1, 7, 'IsetB', 'isetb.com', 'http://localhost:3000/etablissement_logo/2021-06-15T21-58-09.283Zdownload.png', NULL),
(12, 'Institut Supérieur des Technologies de l\'Information et de la Communication', '', '', 1, 2, 'Istic', '	\r\nwww.istic.rnu.tn', 'http://localhost:3000/etablissement_logo/Istic.png', NULL),
(13, 'Institut Supérieur des Langues Appliquées et Informatique de Béja', '', '', 1, 3, 'ISLAIB', 'http://www.islaib.rnu.tn/', 'http://localhost:3000/etablissement_logo/Islaib.jpg', NULL),
(14, 'Institut Supérieur des Etudes Technologiques du Kef', '', '', 1, 1, 'IsetK', 'http://www.isetkf.rnu.tn/', 'http://localhost:3000/etablissement_logo/Isetk.jpg', NULL),
(15, 'Institut des Hautes Etudes à Tunis  (ETS Privé)', '', '', 1, 2, 'Ihet', 'https://www.ihet.ens.tn/', 'http://localhost:3000/etablissement_logo/Ihet.jpg', NULL),
(16, 'Ecole Supérieure Privée d\'Ingénierie et des Technologies Appliquées', '', '', 1, 2, 'Espita', 'http://www.espita.ens.tn/', 'http://localhost:3000/etablissement_logo/Espita.png', NULL),
(17, 'Ecole Nationale d\'Ingénieurs de Monastir', '', '', 1, 2, 'ENIM', 'http://www.enim.rnu.tn/', 'http://localhost:3000/etablissement_logo/Enim.png', NULL),
(18, 'Faculté des Sciences de Bizerte', '', '', 1, 2, 'FSB', 'http://www.fsb.rnu.tn/', 'http://localhost:3000/etablissement_logo/FSB.png', NULL),
(19, 'Autre', 'Autre', 'Autre', NULL, NULL, '', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `etat_demande_master`
--

DROP TABLE IF EXISTS `etat_demande_master`;
CREATE TABLE IF NOT EXISTS `etat_demande_master` (
  `id_etat_demande_master` int(11) NOT NULL,
  `libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_etat_demande_master`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `etat_demande_master`
--

INSERT INTO `etat_demande_master` (`id_etat_demande_master`, `libelle`) VALUES
(1, 'Admis'),
(2, 'Refuser'),
(3, 'En Cours'),
(4, 'Présélectionné'),
(5, 'Confirmé'),
(6, 'en Attente');

-- --------------------------------------------------------

--
-- Table structure for table `etat_demande_stage_entreprise`
--

DROP TABLE IF EXISTS `etat_demande_stage_entreprise`;
CREATE TABLE IF NOT EXISTS `etat_demande_stage_entreprise` (
  `id_etat_demande_stage_entreprise` int(11) NOT NULL,
  `libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_etat_demande_stage_entreprise`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `etat_demande_stage_entreprise`
--

INSERT INTO `etat_demande_stage_entreprise` (`id_etat_demande_stage_entreprise`, `libelle`) VALUES
(1, '');

-- --------------------------------------------------------

--
-- Table structure for table `etat_demande_stage_etudiant`
--

DROP TABLE IF EXISTS `etat_demande_stage_etudiant`;
CREATE TABLE IF NOT EXISTS `etat_demande_stage_etudiant` (
  `id_etat_demande_stage_etudiant` int(11) NOT NULL,
  `libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_etat_demande_stage_etudiant`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `etat_demande_stage_etudiant`
--

INSERT INTO `etat_demande_stage_etudiant` (`id_etat_demande_stage_etudiant`, `libelle`) VALUES
(1, ''),
(2, '');

-- --------------------------------------------------------

--
-- Table structure for table `etat_entretien_stage_pfe`
--

DROP TABLE IF EXISTS `etat_entretien_stage_pfe`;
CREATE TABLE IF NOT EXISTS `etat_entretien_stage_pfe` (
  `id_etat_entretien_stage_pfe` int(11) NOT NULL,
  `libelle` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_etat_entretien_stage_pfe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `etat_entretien_stage_pfe`
--

INSERT INTO `etat_entretien_stage_pfe` (`id_etat_entretien_stage_pfe`, `libelle`) VALUES
(1, '');

-- --------------------------------------------------------

--
-- Table structure for table `etat_offre_stage`
--

DROP TABLE IF EXISTS `etat_offre_stage`;
CREATE TABLE IF NOT EXISTS `etat_offre_stage` (
  `id_etat_offre_stage` int(11) NOT NULL,
  `libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_etat_offre_stage`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `etat_offre_stage`
--

INSERT INTO `etat_offre_stage` (`id_etat_offre_stage`, `libelle`) VALUES
(1, '');

-- --------------------------------------------------------

--
-- Table structure for table `etat_presence_enseignant`
--

DROP TABLE IF EXISTS `etat_presence_enseignant`;
CREATE TABLE IF NOT EXISTS `etat_presence_enseignant` (
  `id_etat_presence_enseignant` int(11) NOT NULL,
  `libelle` int(11) NOT NULL,
  PRIMARY KEY (`id_etat_presence_enseignant`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `etat_presence_enseignant`
--

INSERT INTO `etat_presence_enseignant` (`id_etat_presence_enseignant`, `libelle`) VALUES
(1, 0),
(2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `etat_presence_etudiant`
--

DROP TABLE IF EXISTS `etat_presence_etudiant`;
CREATE TABLE IF NOT EXISTS `etat_presence_etudiant` (
  `id_etat_presence_etudiant` int(11) NOT NULL,
  `libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_etat_presence_etudiant`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `etat_presence_etudiant`
--

INSERT INTO `etat_presence_etudiant` (`id_etat_presence_etudiant`, `libelle`) VALUES
(1, '111');

-- --------------------------------------------------------

--
-- Table structure for table `etudiant`
--

DROP TABLE IF EXISTS `etudiant`;
CREATE TABLE IF NOT EXISTS `etudiant` (
  `id_etudiant` int(11) NOT NULL,
  `id_situation_etudiant` int(11) DEFAULT NULL,
  `id_user` int(11) NOT NULL,
  `id_cursusgenerale` int(11) DEFAULT NULL,
  `id_bacc` int(11) DEFAULT NULL,
  `id_departement` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_etudiant`),
  KEY `fk_user` (`id_user`),
  KEY `fk_bacc` (`id_bacc`),
  KEY `fk_cursusgenerale` (`id_cursusgenerale`),
  KEY `fk_situation` (`id_situation_etudiant`),
  KEY `FK_PersonOrder` (`id_departement`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `etudiant`
--

INSERT INTO `etudiant` (`id_etudiant`, `id_situation_etudiant`, `id_user`, `id_cursusgenerale`, `id_bacc`, `id_departement`) VALUES
(1, NULL, 1, NULL, NULL, NULL),
(2, 3, 1, 1, 1, 1),
(3, NULL, 1, NULL, NULL, NULL),
(4, NULL, 2, NULL, NULL, NULL),
(5, NULL, 8, 3, 18, NULL),
(6, NULL, 11, NULL, NULL, NULL),
(7, NULL, 12, NULL, NULL, NULL),
(8, NULL, 14, NULL, NULL, NULL),
(9, NULL, 19, 4, 19, NULL),
(10, NULL, 21, 5, 20, NULL),
(11, NULL, 9, NULL, NULL, NULL),
(12, NULL, 22, 6, 21, NULL),
(13, NULL, 20, 7, 22, NULL),
(14, NULL, 32, NULL, NULL, NULL),
(15, NULL, 34, 8, 23, NULL),
(16, NULL, 37, 9, 24, NULL),
(17, NULL, 25, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `evenement`
--

DROP TABLE IF EXISTS `evenement`;
CREATE TABLE IF NOT EXISTS `evenement` (
  `id_event` int(11) NOT NULL,
  `titre_event` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8_unicode_ci NOT NULL,
  `date_debut` varchar(400) COLLATE utf8_unicode_ci NOT NULL,
  `date_fin` varchar(400) COLLATE utf8_unicode_ci NOT NULL,
  `heure_debut` varchar(400) COLLATE utf8_unicode_ci NOT NULL,
  `heure_fin` varchar(400) COLLATE utf8_unicode_ci NOT NULL,
  `statut` varchar(400) COLLATE utf8_unicode_ci NOT NULL,
  `url_event` varchar(400) COLLATE utf8_unicode_ci NOT NULL,
  `url_image` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `sponsor` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `logo_sponsor` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `id_membre` int(11) NOT NULL,
  `id_club` int(11) NOT NULL,
  PRIMARY KEY (`id_event`),
  KEY `id_membre` (`id_membre`),
  KEY `id_club` (`id_club`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `experience`
--

DROP TABLE IF EXISTS `experience`;
CREATE TABLE IF NOT EXISTS `experience` (
  `id_experience` int(11) NOT NULL,
  `nom_entreprise` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `date_debut` date NOT NULL,
  `date_fin` date NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `post` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `id_cv` int(11) NOT NULL,
  PRIMARY KEY (`id_experience`),
  KEY `id_cv` (`id_cv`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gouvernerat`
--

DROP TABLE IF EXISTS `gouvernerat`;
CREATE TABLE IF NOT EXISTS `gouvernerat` (
  `id_gouvernerat` int(11) NOT NULL AUTO_INCREMENT,
  `libelle_gouvernerat` varchar(255) NOT NULL,
  `id_ville` int(11) NOT NULL,
  PRIMARY KEY (`id_gouvernerat`),
  KEY `fk_ville` (`id_ville`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gouvernerat`
--

INSERT INTO `gouvernerat` (`id_gouvernerat`, `libelle_gouvernerat`, `id_ville`) VALUES
(1, 'Bab El Bhar', 1),
(2, 'Tunis', 1),
(3, 'Bab Souika', 1),
(4, 'Carthage', 1),
(5, 'Cité El Khadra', 1),
(6, 'Djebel Djelloud', 1),
(7, 'El Hrairia', 1),
(8, 'El Kabaria', 1),
(9, 'El Menzah', 1),
(10, 'El Omrane', 1),
(11, 'El Omrane Supérieur', 1),
(12, 'El Ouardia', 1),
(13, 'Ettahrir', 1),
(14, 'Ezzouhour', 1),
(15, 'La Goulette', 1),
(16, 'La Marsa', 1),
(17, 'Le Bardo', 1),
(18, 'Le Kram', 1),
(19, 'Medina', 1),
(20, 'Bab El Bhar', 1),
(21, 'Bab Souika', 1),
(22, 'Carthage', 1),
(23, 'Cité El Khadra', 1),
(24, 'Djebel Djelloud', 1),
(25, 'El Hrairia', 1),
(26, 'El Kabaria', 1),
(27, 'El Menzah', 1),
(28, 'El Omrane', 1),
(29, 'El Omrane Supérieur', 1),
(30, 'El Ouardia', 1),
(31, 'Ettahrir', 1),
(32, 'Ezzouhour', 1),
(33, 'La Goulette', 1),
(34, 'La Marsa', 1),
(35, 'Le Bardo', 1),
(36, 'Le Kram', 1),
(37, 'Medina', 1),
(38, 'Sijoumi', 1),
(39, 'Sidi El Béchir', 1),
(40, 'Sidi Hassine', 1);

-- --------------------------------------------------------

--
-- Table structure for table `inscription`
--

DROP TABLE IF EXISTS `inscription`;
CREATE TABLE IF NOT EXISTS `inscription` (
  `id_inscription` int(11) NOT NULL,
  `date_inscription` date NOT NULL,
  `id_classe` int(11) NOT NULL,
  `id_etudiant` int(11) NOT NULL,
  PRIMARY KEY (`id_inscription`),
  KEY `id_classe` (`id_classe`),
  KEY `id_etudiant` (`id_etudiant`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `inscription`
--

INSERT INTO `inscription` (`id_inscription`, `date_inscription`, `id_classe`, `id_etudiant`) VALUES
(1, '2021-10-05', 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `liste_membre`
--

DROP TABLE IF EXISTS `liste_membre`;
CREATE TABLE IF NOT EXISTS `liste_membre` (
  `id_club` int(11) NOT NULL,
  `cin_membre` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `role` int(11) NOT NULL,
  `equipe` int(11) NOT NULL,
  PRIMARY KEY (`id_club`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `master`
--

DROP TABLE IF EXISTS `master`;
CREATE TABLE IF NOT EXISTS `master` (
  `id_master` int(11) NOT NULL,
  `nom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `id_departement` int(11) NOT NULL,
  `seuil_admission` int(11) NOT NULL,
  `seuil_admis_attente` int(11) NOT NULL,
  `date_fin_master` date NOT NULL,
  `id_etablissement` int(11) NOT NULL,
  `id_admin_master` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_master`),
  KEY `fk_departement` (`id_departement`),
  KEY `fk_admin_master` (`id_admin_master`),
  KEY `fk_etablise` (`id_etablissement`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `master`
--

INSERT INTO `master` (`id_master`, `nom`, `id_departement`, `seuil_admission`, `seuil_admis_attente`, `date_fin_master`, `id_etablissement`, `id_admin_master`) VALUES
(1, 'M1MPDAM', 3, 60, 5, '2021-08-25', 2, 32),
(2, 'BI', 3, 60, 58, '2021-07-20', 3, 33),
(3, 'Data Science', 3, 37, 11, '2023-12-31', 2, 36),
(7, 'Cybersecurity', 3, 50, 10, '2021-06-14', 1, NULL),
(8, 'Master embarqué', 3, 54, 30, '2022-08-09', 2, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `matiere`
--

DROP TABLE IF EXISTS `matiere`;
CREATE TABLE IF NOT EXISTS `matiere` (
  `id_matiere` int(11) NOT NULL,
  `libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `charge_horaire` int(11) NOT NULL,
  `id_type_enseignement` int(11) NOT NULL,
  `id_semestre` int(11) NOT NULL,
  `id_niveau` int(11) NOT NULL,
  PRIMARY KEY (`id_matiere`),
  KEY `id_type_enseignement` (`id_type_enseignement`),
  KEY `id_semestre` (`id_semestre`),
  KEY `id_niveau` (`id_niveau`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `media_activites`
--

DROP TABLE IF EXISTS `media_activites`;
CREATE TABLE IF NOT EXISTS `media_activites` (
  `id` int(11) NOT NULL,
  `id_activites` int(11) NOT NULL,
  `imageUrl` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_activites` (`id_activites`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `membre`
--

DROP TABLE IF EXISTS `membre`;
CREATE TABLE IF NOT EXISTS `membre` (
  `id_membre` int(11) NOT NULL,
  `cin` int(11) NOT NULL,
  `tel` int(11) NOT NULL,
  `email` varchar(400) COLLATE utf8_unicode_ci NOT NULL,
  `motdepasse` varchar(400) COLLATE utf8_unicode_ci NOT NULL,
  `membreimage` varchar(400) COLLATE utf8_unicode_ci NOT NULL,
  `role` int(11) NOT NULL,
  PRIMARY KEY (`id_membre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
CREATE TABLE IF NOT EXISTS `messages` (
  `id_message` int(11) NOT NULL,
  `message_text` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `id_status_messages` int(11) NOT NULL,
  `url_file` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `date_message` date NOT NULL,
  `id_user_sender` int(11) NOT NULL,
  `id_user_receiver` int(11) NOT NULL,
  PRIMARY KEY (`id_message`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `niveau`
--

DROP TABLE IF EXISTS `niveau`;
CREATE TABLE IF NOT EXISTS `niveau` (
  `id_niveau` int(11) NOT NULL,
  `libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_niveau`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `niveau`
--

INSERT INTO `niveau` (`id_niveau`, `libelle`) VALUES
(1, ' hbhh'),
(2, ';;;');

-- --------------------------------------------------------

--
-- Table structure for table `offre_stage`
--

DROP TABLE IF EXISTS `offre_stage`;
CREATE TABLE IF NOT EXISTS `offre_stage` (
  `id_offre_stage` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `duree` int(11) NOT NULL,
  `date_debut` date NOT NULL,
  `date_fin` date NOT NULL,
  `id_etat_offre_stage` int(11) NOT NULL,
  `cahier_charge` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `id_responsable_entreprise` int(11) NOT NULL,
  `nbr_vue` int(11) NOT NULL DEFAULT '0',
  `nbr_postulation` int(11) NOT NULL DEFAULT '0',
  `titre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Aucune description ',
  PRIMARY KEY (`id_offre_stage`),
  KEY `id_responsable_entreprise` (`id_responsable_entreprise`),
  KEY `id_etat_offre_stage` (`id_etat_offre_stage`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `option`
--

DROP TABLE IF EXISTS `option`;
CREATE TABLE IF NOT EXISTS `option` (
  `id_option` int(11) NOT NULL,
  `libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `id_niveau` int(11) NOT NULL,
  `id_parcours` int(11) NOT NULL,
  PRIMARY KEY (`id_option`),
  KEY `id_niveau` (`id_niveau`),
  KEY `id_parcours` (`id_parcours`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `papier_administratif`
--

DROP TABLE IF EXISTS `papier_administratif`;
CREATE TABLE IF NOT EXISTS `papier_administratif` (
  `id_papier` int(11) NOT NULL AUTO_INCREMENT,
  `raison` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` date NOT NULL,
  `id_type_papier` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_statut_papier` int(11) NOT NULL,
  PRIMARY KEY (`id_papier`,`date`),
  KEY `id_type_papier` (`id_type_papier`),
  KEY `id_user` (`id_user`),
  KEY `id_statut_papier` (`id_statut_papier`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `papier_administratif`
--

INSERT INTO `papier_administratif` (`id_papier`, `raison`, `date`, `id_type_papier`, `id_user`, `id_statut_papier`) VALUES
(2, 'A cause de... ', '2021-11-02', 1, 1, 1),
(5, 'A cause de... ', '2021-11-02', 5, 1, 3),
(8, 'A cause de... ', '2021-11-09', 5, 1, 1),
(9, 'dsdq2', '2021-04-27', 1, 1, 3),
(10, 'aA', '2021-11-28', 8, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `parameter`
--

DROP TABLE IF EXISTS `parameter`;
CREATE TABLE IF NOT EXISTS `parameter` (
  `ref` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(350) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `parcours`
--

DROP TABLE IF EXISTS `parcours`;
CREATE TABLE IF NOT EXISTS `parcours` (
  `id_parcours` int(11) NOT NULL,
  `libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_parcours`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `parcours`
--

INSERT INTO `parcours` (`id_parcours`, `libelle`) VALUES
(0, ''),
(1, ''),
(2, '');

-- --------------------------------------------------------

--
-- Table structure for table `participation`
--

DROP TABLE IF EXISTS `participation`;
CREATE TABLE IF NOT EXISTS `participation` (
  `id_participation` int(11) NOT NULL,
  `id_event` int(11) NOT NULL,
  `id_membre` int(11) NOT NULL,
  `statut` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_participation`),
  KEY `id_event` (`id_event`),
  KEY `id_membre` (`id_membre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pays`
--

DROP TABLE IF EXISTS `pays`;
CREATE TABLE IF NOT EXISTS `pays` (
  `id_pays` int(11) NOT NULL AUTO_INCREMENT,
  `libelle_pays` varchar(255) NOT NULL,
  PRIMARY KEY (`id_pays`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pays`
--

INSERT INTO `pays` (`id_pays`, `libelle_pays`) VALUES
(1, 'Tunisie');

-- --------------------------------------------------------

--
-- Table structure for table `poste_entreprise`
--

DROP TABLE IF EXISTS `poste_entreprise`;
CREATE TABLE IF NOT EXISTS `poste_entreprise` (
  `id_poste` int(11) NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_poste`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `presence_enseignant`
--

DROP TABLE IF EXISTS `presence_enseignant`;
CREATE TABLE IF NOT EXISTS `presence_enseignant` (
  `id_enseignement` int(11) NOT NULL,
  `etat` int(1) NOT NULL DEFAULT '0',
  `id_presence_enseignant` int(11) NOT NULL,
  PRIMARY KEY (`id_presence_enseignant`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `presence_enseignant`
--

INSERT INTO `presence_enseignant` (`id_enseignement`, `etat`, `id_presence_enseignant`) VALUES
(0, 0, 1),
(2, 5, 2);

-- --------------------------------------------------------

--
-- Table structure for table `presence_etudiant`
--

DROP TABLE IF EXISTS `presence_etudiant`;
CREATE TABLE IF NOT EXISTS `presence_etudiant` (
  `id_presence` int(11) NOT NULL,
  `id_etudiant` int(11) NOT NULL,
  `id_enseignement` int(11) NOT NULL,
  `id_etat_presence_etd` int(11) NOT NULL DEFAULT '2',
  `localisation` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `time` date NOT NULL,
  `id_seance` int(11) NOT NULL,
  PRIMARY KEY (`id_presence`),
  KEY `id_etudiant` (`id_etudiant`),
  KEY `id_etat_presence_etd` (`id_etat_presence_etd`),
  KEY `id_seance` (`id_seance`),
  KEY `id_enseignement` (`id_enseignement`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `presence_etudiant`
--

INSERT INTO `presence_etudiant` (`id_presence`, `id_etudiant`, `id_enseignement`, `id_etat_presence_etd`, `localisation`, `time`, `id_seance`) VALUES
(1, 2, 1, 1, ',,,,,', '2021-10-06', 2);

-- --------------------------------------------------------

--
-- Table structure for table `professeur`
--

DROP TABLE IF EXISTS `professeur`;
CREATE TABLE IF NOT EXISTS `professeur` (
  `id_professeur` int(11) NOT NULL,
  `id_departement` int(11) NOT NULL,
  `id_option` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  PRIMARY KEY (`id_professeur`),
  KEY `id_departement` (`id_departement`),
  KEY `id_option` (`id_option`),
  KEY `id_user` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `publication_club`
--

DROP TABLE IF EXISTS `publication_club`;
CREATE TABLE IF NOT EXISTS `publication_club` (
  `id_publication` int(11) NOT NULL,
  `description` varchar(400) COLLATE utf8_unicode_ci NOT NULL,
  `date` varchar(400) COLLATE utf8_unicode_ci NOT NULL,
  `heure` varchar(400) COLLATE utf8_unicode_ci NOT NULL,
  `url_image` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `id_membre` int(11) NOT NULL,
  `id_club` int(11) NOT NULL,
  PRIMARY KEY (`id_publication`),
  KEY `id_membre` (`id_membre`),
  KEY `id_club` (`id_club`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reclamation`
--

DROP TABLE IF EXISTS `reclamation`;
CREATE TABLE IF NOT EXISTS `reclamation` (
  `id_reclamation` int(11) NOT NULL AUTO_INCREMENT,
  `id_type_reclamation` int(11) NOT NULL,
  `id_statut_reclamation` int(11) NOT NULL,
  `date_reclamation` date NOT NULL,
  `id_user` int(11) NOT NULL,
  `piece_jointe` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `oldSpeciality` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `newSpeciality` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `oldClass` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `newClass` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `oldSection` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `newSection` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `class_note` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `sem_note` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `mat_note` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `class_exam` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `sem_exam` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `mat_exam` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `class_inscr` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `sem_inscr` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `mat_inscr` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_reclamation`,`date_reclamation`) USING BTREE,
  KEY `id_statut_reclamation` (`id_statut_reclamation`),
  KEY `id_user` (`id_user`),
  KEY `id_type_reclamation` (`id_type_reclamation`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `reclamation`
--

INSERT INTO `reclamation` (`id_reclamation`, `id_type_reclamation`, `id_statut_reclamation`, `date_reclamation`, `id_user`, `piece_jointe`, `message`, `oldSpeciality`, `newSpeciality`, `oldClass`, `newClass`, `oldSection`, `newSection`, `class_note`, `sem_note`, `mat_note`, `class_exam`, `sem_exam`, `mat_exam`, `class_inscr`, `sem_inscr`, `mat_inscr`) VALUES
(4, 1, 1, '2021-11-16', 1, NULL, 'Reponse 2', 'Specialite2', 'Specialite3', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null'),
(5, 2, 3, '2021-11-16', 1, NULL, '', 'null', 'null', 'class3', 'class2', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null'),
(6, 2, 2, '2021-11-16', 1, NULL, '', 'null', 'null', 'class2', 'class3', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null'),
(11, 1, 2, '2021-11-28', 1, NULL, '', 'Specialite1', 'Specialite2', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null'),
(12, 2, 2, '2021-11-28', 1, NULL, '', 'null', 'null', 'class2', 'class3', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null');

-- --------------------------------------------------------

--
-- Table structure for table `responsable_classe`
--

DROP TABLE IF EXISTS `responsable_classe`;
CREATE TABLE IF NOT EXISTS `responsable_classe` (
  `id_responsable_group` int(11) NOT NULL,
  `qualite` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `id_user` int(11) NOT NULL,
  PRIMARY KEY (`id_responsable_group`),
  KEY `id_user` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `responsable_classe`
--

INSERT INTO `responsable_classe` (`id_responsable_group`, `qualite`, `id_user`) VALUES
(1, 'maitre', 6);

-- --------------------------------------------------------

--
-- Table structure for table `responsable_entreprise`
--

DROP TABLE IF EXISTS `responsable_entreprise`;
CREATE TABLE IF NOT EXISTS `responsable_entreprise` (
  `id_responsable_entreprise` int(11) NOT NULL,
  `id_entreprise` int(11) NOT NULL,
  `id_poste_entreprise` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  PRIMARY KEY (`id_responsable_entreprise`),
  KEY `id_entreprise` (`id_entreprise`),
  KEY `id_poste_entreprise` (`id_poste_entreprise`),
  KEY `id_user` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `id_role` int(11) NOT NULL,
  `libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id_role`, `libelle`) VALUES
(2, 'etudiant master'),
(3, 'Responsable Classe'),
(4, 'Admin'),
(5, 'Professeur'),
(6, 'enseignant'),
(7, 'responsable entreprise'),
(8, 'Candidat Master'),
(9, 'user platforme inscription'),
(10, 'Admin master');

-- --------------------------------------------------------

--
-- Table structure for table `rubrique`
--

DROP TABLE IF EXISTS `rubrique`;
CREATE TABLE IF NOT EXISTS `rubrique` (
  `id` int(11) NOT NULL,
  `libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `score` double NOT NULL,
  `coefficient` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `id_entretien` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_entretien` (`id_entretien`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `salle`
--

DROP TABLE IF EXISTS `salle`;
CREATE TABLE IF NOT EXISTS `salle` (
  `id_salle` int(11) NOT NULL,
  `libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `capacite` int(11) NOT NULL,
  `localisation` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `id_type_salle` int(11) NOT NULL,
  PRIMARY KEY (`id_salle`),
  KEY `id_type_salle` (`id_type_salle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `salle`
--

INSERT INTO `salle` (`id_salle`, `libelle`, `capacite`, `localisation`, `id_type_salle`) VALUES
(1, 'A1', 25, '', 2),
(8, 'A2', 25, '', 2),
(9, 'A3', 25, '', 2),
(10, 'Lab 1', 20, '', 1),
(11, 'Lab 2', 20, '', 1),
(12, 'A10', 25, '', 2),
(13, 'Lab IOS', 20, '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `seance`
--

DROP TABLE IF EXISTS `seance`;
CREATE TABLE IF NOT EXISTS `seance` (
  `id_seance` int(11) NOT NULL,
  `libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `date_debut_seance` time NOT NULL,
  `date_fin_seance` time NOT NULL,
  PRIMARY KEY (`id_seance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `seance`
--

INSERT INTO `seance` (`id_seance`, `libelle`, `date_debut_seance`, `date_fin_seance`) VALUES
(1, 'S1', '00:08:30', '00:10:00'),
(2, 'S2', '00:10:00', '00:11:30'),
(3, 'S3', '00:11:30', '00:13:00'),
(4, 'S4', '00:13:00', '00:14:30'),
(5, 'S5', '00:14:30', '00:16:00'),
(6, 'S6', '00:16:00', '00:17:30');

-- --------------------------------------------------------

--
-- Table structure for table `semestre`
--

DROP TABLE IF EXISTS `semestre`;
CREATE TABLE IF NOT EXISTS `semestre` (
  `id_semestre` int(11) NOT NULL,
  `num_semestre` int(11) NOT NULL,
  `date_debut_annee_univ` date NOT NULL,
  `date_fin_annee_univ` date NOT NULL,
  PRIMARY KEY (`id_semestre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `semestre`
--

INSERT INTO `semestre` (`id_semestre`, `num_semestre`, `date_debut_annee_univ`, `date_fin_annee_univ`) VALUES
(1, 1, '2020-09-15', '2021-01-10'),
(2, 2, '2021-01-11', '2021-06-20');

-- --------------------------------------------------------

--
-- Table structure for table `situation_etudiant`
--

DROP TABLE IF EXISTS `situation_etudiant`;
CREATE TABLE IF NOT EXISTS `situation_etudiant` (
  `id_situation_etudiant` int(11) NOT NULL,
  `libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_situation_etudiant`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `situation_etudiant`
--

INSERT INTO `situation_etudiant` (`id_situation_etudiant`, `libelle`) VALUES
(1, 'celibataire'),
(2, 'Mariee'),
(3, 'divorce');

-- --------------------------------------------------------

--
-- Table structure for table `situation_professionnel`
--

DROP TABLE IF EXISTS `situation_professionnel`;
CREATE TABLE IF NOT EXISTS `situation_professionnel` (
  `id_situation_professionnel` int(11) NOT NULL,
  `libelle_situation_professionnel` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_situation_professionnel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `situation_professionnel`
--

INSERT INTO `situation_professionnel` (`id_situation_professionnel`, `libelle_situation_professionnel`) VALUES
(1, 'Employé'),
(2, 'Etudiant '),
(3, 'Autre');

-- --------------------------------------------------------

--
-- Table structure for table `specialite`
--

DROP TABLE IF EXISTS `specialite`;
CREATE TABLE IF NOT EXISTS `specialite` (
  `id_specialite` int(11) NOT NULL,
  `libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `id_domaine` int(11) NOT NULL,
  PRIMARY KEY (`id_specialite`),
  KEY `fk_do` (`id_domaine`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `specialite`
--

INSERT INTO `specialite` (`id_specialite`, `libelle`, `id_domaine`) VALUES
(2, 'DSI', 2),
(3, 'RSI', 2),
(4, 'MDW', 2),
(5, 'SEM', 2);

-- --------------------------------------------------------

--
-- Table structure for table `specialite_cv`
--

DROP TABLE IF EXISTS `specialite_cv`;
CREATE TABLE IF NOT EXISTS `specialite_cv` (
  `id_specialite_cv` int(11) NOT NULL,
  `libelle` varchar(255) NOT NULL,
  `id_cv` int(11) NOT NULL,
  PRIMARY KEY (`id_specialite_cv`),
  KEY `id_cv` (`id_cv`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `status_contact`
--

DROP TABLE IF EXISTS `status_contact`;
CREATE TABLE IF NOT EXISTS `status_contact` (
  `id_status_contact` int(11) NOT NULL,
  `libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_status_contact`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `status_contact`
--

INSERT INTO `status_contact` (`id_status_contact`, `libelle`) VALUES
(1, 'status contact 1'),
(2, 'status contact 2');

-- --------------------------------------------------------

--
-- Table structure for table `status_messages`
--

DROP TABLE IF EXISTS `status_messages`;
CREATE TABLE IF NOT EXISTS `status_messages` (
  `id_status_messages` int(11) NOT NULL,
  `libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_status_messages`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `status_messages`
--

INSERT INTO `status_messages` (`id_status_messages`, `libelle`) VALUES
(1, 'status messages 1');

-- --------------------------------------------------------

--
-- Table structure for table `statut_demande_club`
--

DROP TABLE IF EXISTS `statut_demande_club`;
CREATE TABLE IF NOT EXISTS `statut_demande_club` (
  `id_statut_demande_club` int(11) NOT NULL,
  `libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_statut_demande_club`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `statut_demande_club`
--

INSERT INTO `statut_demande_club` (`id_statut_demande_club`, `libelle`) VALUES
(1, 'statut 1'),
(2, 'statut 2');

-- --------------------------------------------------------

--
-- Table structure for table `statut_enseignement`
--

DROP TABLE IF EXISTS `statut_enseignement`;
CREATE TABLE IF NOT EXISTS `statut_enseignement` (
  `id_statut_enseignement` int(11) NOT NULL,
  `libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_statut_enseignement`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `statut_enseignement`
--

INSERT INTO `statut_enseignement` (`id_statut_enseignement`, `libelle`) VALUES
(1, 'Statut 1'),
(2, 'Statut 2');

-- --------------------------------------------------------

--
-- Table structure for table `statut_papier`
--

DROP TABLE IF EXISTS `statut_papier`;
CREATE TABLE IF NOT EXISTS `statut_papier` (
  `id_statut_papier` int(11) NOT NULL,
  `libelle_statut_papier` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_statut_papier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `statut_papier`
--

INSERT INTO `statut_papier` (`id_statut_papier`, `libelle_statut_papier`) VALUES
(1, 'Acceptée'),
(2, 'Rejetée'),
(3, 'En Attente');

-- --------------------------------------------------------

--
-- Table structure for table `statut_reclamation`
--

DROP TABLE IF EXISTS `statut_reclamation`;
CREATE TABLE IF NOT EXISTS `statut_reclamation` (
  `id_statut_reclamation` int(11) NOT NULL,
  `libelle_statut_reclamation` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_statut_reclamation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `statut_reclamation`
--

INSERT INTO `statut_reclamation` (`id_statut_reclamation`, `libelle_statut_reclamation`) VALUES
(1, 'Acceptée'),
(2, 'En Attente'),
(3, 'Rejetée');

-- --------------------------------------------------------

--
-- Table structure for table `table_score`
--

DROP TABLE IF EXISTS `table_score`;
CREATE TABLE IF NOT EXISTS `table_score` (
  `id_score` int(11) NOT NULL,
  `nom_attr_score` varchar(20) NOT NULL,
  `attr_score` varchar(20) NOT NULL,
  `valeur` double NOT NULL,
  `id_master_score` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_score`),
  KEY `id_master_score` (`id_master_score`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `table_score`
--

INSERT INTO `table_score` (`id_score`, `nom_attr_score`, `attr_score`, `valeur`, `id_master_score`, `active`) VALUES
(122, 'Bonus C', 'BC', 4, 1, 1),
(123, 'Bien', 'Bien', 3, 1, 1),
(124, 'Assez Bien', 'AssB', 2, 1, 1),
(125, 'Passable', 'Pass', 1, 1, 1),
(126, 'Tres Bien', 'TBien', 4, 1, 1),
(127, 'BonusS', 'BnS', 5, 1, 1),
(128, 'Coefficient Moy', 'CdM', 4, 1, 1),
(129, '0', 'RED0', 1, 1, 1),
(130, '1', 'RED1', 2, 1, 1),
(131, '2', 'RED2', 3, 1, 1),
(132, '3', 'RED3', 4, 1, 1),
(133, '4', 'RED4', 6, 1, 1),
(134, 'Semestre 5', 'sem5', 14, 1, 1),
(135, 'PFE', 'pfe', 10, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tmp_data`
--

DROP TABLE IF EXISTS `tmp_data`;
CREATE TABLE IF NOT EXISTS `tmp_data` (
  `ref` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `data` varchar(500) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `type_enseignement`
--

DROP TABLE IF EXISTS `type_enseignement`;
CREATE TABLE IF NOT EXISTS `type_enseignement` (
  `id_type_enseignant` int(11) NOT NULL,
  `libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_type_enseignant`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `type_enseignement`
--

INSERT INTO `type_enseignement` (`id_type_enseignant`, `libelle`) VALUES
(1, 'Presentielle '),
(2, 'a distance');

-- --------------------------------------------------------

--
-- Table structure for table `type_papier`
--

DROP TABLE IF EXISTS `type_papier`;
CREATE TABLE IF NOT EXISTS `type_papier` (
  `id_type_papier` int(11) NOT NULL,
  `libelle_type_papier` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_type_papier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `type_papier`
--

INSERT INTO `type_papier` (`id_type_papier`, `libelle_type_papier`) VALUES
(1, 'Attestation de présence'),
(2, 'Attestation de départ '),
(3, 'Duplicata d’attestation d’inscription '),
(4, 'Duplicata de carte d’étudiant '),
(5, 'Duplicata ou de relevé de notes'),
(6, 'Attestation de retrait d’inscription'),
(7, 'Attestation de cursus universitaire '),
(8, 'Duplicata du diplôme'),
(9, 'Duplicata de relevé de notes');

-- --------------------------------------------------------

--
-- Table structure for table `type_reclamation`
--

DROP TABLE IF EXISTS `type_reclamation`;
CREATE TABLE IF NOT EXISTS `type_reclamation` (
  `id_type_reclamation` int(11) NOT NULL,
  `libelle_type_reclamation` varchar(255) NOT NULL,
  PRIMARY KEY (`id_type_reclamation`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `type_reclamation`
--

INSERT INTO `type_reclamation` (`id_type_reclamation`, `libelle_type_reclamation`) VALUES
(1, 'Changement de specialite'),
(2, 'Changement de classe'),
(3, 'Changement de section'),
(4, 'Verification des notes'),
(5, 'Refaire d\'un examen'),
(6, 'Inscription pedagogique');

-- --------------------------------------------------------

--
-- Table structure for table `type_salle`
--

DROP TABLE IF EXISTS `type_salle`;
CREATE TABLE IF NOT EXISTS `type_salle` (
  `id_typeSalle` int(11) NOT NULL,
  `libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_typeSalle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `type_salle`
--

INSERT INTO `type_salle` (`id_typeSalle`, `libelle`) VALUES
(1, 'Laboratoire'),
(2, 'salle de cours');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `id_role` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `nom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `prenom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `age` int(11) NOT NULL,
  `cin` text COLLATE utf8_unicode_ci NOT NULL,
  `sexe` text COLLATE utf8_unicode_ci NOT NULL,
  `num_passport` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `date_naissance` date NOT NULL,
  `gouvern_naissance` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_situation_professionnel` int(11) NOT NULL,
  `verifie` int(11) NOT NULL,
  PRIMARY KEY (`id_user`),
  UNIQUE KEY `email` (`email`),
  KEY `fk_ro` (`id_role`),
  KEY `fk_situaon` (`id_situation_professionnel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`email`, `password`, `id_role`, `id_user`, `nom`, `prenom`, `age`, `cin`, `sexe`, `num_passport`, `date_naissance`, `gouvern_naissance`, `id_situation_professionnel`, `verifie`) VALUES
('karimbouzid.1997@gmail.com', '123456789', 2, 1, 'Bouzid', 'Karim', 23, '06993131', 'homme', '06993131', '1997-09-20', 'monastir', 0, 0),
('ilyeshrizi@gmail.com', '123456', 2, 2, 'Hrizi', 'Ilyes', 23, '06887755', 'homme', '06887755', '1997-11-05', 'gabes', 0, 0),
('test@gmail.com', '12345', 4, 3, 'test', 'test', 22, '11111111', 'Homme', '11111111', '1994-02-10', 'tunis', 0, 0),
('hanen@gmail.com', '12345', 3, 4, 'hanen', 'aissa', 22, '45454545', 'Femme', '45454545', '1998-01-01', 'ben arous', 0, 0),
('beji@gmail.com', '12345', 5, 5, 'Sofien', 'Beji', 49, '52525252', 'Homme', '52525252', '1980-02-10', 'tunis', 0, 0),
('habib@gmail.com', '123456', 6, 6, 'smei', 'habib', 50, '12457896', 'homme', '12457896', '2020-10-06', 'tunis', 0, 0),
('responsable@gmail.com', '123456', 7, 7, 'jbeli', 'mohamed ali', 24, '06875421', 'homme', '06875421', '1996-11-26', 'tunis', 0, 0),
('bilel@gmail.com', '$2b$10$Lok/Y9VWaMGIirYivULT.O4wwhdIVEtnvQYzOo4dQuAPSK9VL6CK6', 4, 8, 'bilel', 'hedhli', 0, '11457896', 'Masculin', '', '1998-02-23', NULL, 2, 1),
('Admin@isetr.com', '$2b$10$6ji62wOFtx3svHrxfyFE7OmypWlXIal.1obRP6PYLWwuDBblkXeLu', 4, 9, 'Ahmed', 'Hedi', 0, '47896512', 'Masculin', '', '1983-11-30', NULL, 2, 1),
('Dorsaf@gmail.com', '$2b$10$y.4snjGSxYRW4anLNfrzM.TEBhYQlJs34yjMFQgg0bnG6AoTXJUo.', 4, 10, 'Dorsaf', 'Boughdiri', 0, '11457896', 'Feminin', '', '1998-09-27', NULL, 2, 1),
('Ahmed@gmail.com', '$2b$10$p0w4H39Oj5HlEHb1nCsSluFX37oNOUrzdsdB6ntEiFIiVIb2w2xbO', 2, 11, 'Ahmed', 'Bejaoui', 0, '11456789', 'Masculin', '', '1998-05-27', NULL, 2, 1),
('amin@gmail.com', '$2b$10$p2YHcxGSBOWmXtb7eQD1Re1RfQ61tWbq.TbB.bt5V8gtOxpcnkUuy', 2, 12, 'Amine', 'Zarrouk', 0, '11356978', 'Masculin', '', '1997-05-28', NULL, 2, 1),
('mohamedhedi@gmail.com', '$2b$10$cRrz0qB1/rUNwwgt1W8aCes79U5650uGIL5NyS1Ohos3odjETEIqW', 2, 13, 'mohamed', 'hedi', 0, '11415416', 'Masculin', '', '2021-12-31', '1', 2, 1),
('test5@gmail.com', '$2b$10$anjItGubUAPbjjRzSdNODunN43.T2aSOOjKTtU3j3jDOifTYC8WhS', 2, 14, 'emir', 'emir', 0, '14789655', 'Feminin', '', '2021-12-31', '1', 2, 1),
('boughdiridorsaf123@gmail.com', '$2b$10$wqs7qbqzkcA6zwWggsQ1pehzFkzfi9OTlBU6Y3j.0ixajCfQuNGtS', 2, 15, 'dorsaf', 'boughdiri', 0, '11256981', 'Masculin', '', '2021-12-31', 'Tunis', 2, 1),
('bilelhedhli2@gmail.com', '$2b$10$gO0ikevDYcI8isoCAaKDGem0TQSq7FVcvNL7w9XPPTsH3USoMOlnG', 9, 19, 'test', 'test', 0, '14444444', 'Masculin', '', '2012-12-31', 'Tunis', 2, 1),
('emine@gmail.com', '$2b$10$oIsR4aWyMBrhJ3mySnlRqOS7NFHktZGieQSBweUQuew.C.4mRD.Ga', 9, 20, 'emine', 'test', 0, '45789665', 'Masculin', '', '2008-12-31', 'Cité El Khadra', 2, 1),
('Mariem@gmail.com', '$2b$10$6w2SLhD.Oqq1JGbO5rSnpuBwdqxDKt237gSw5ZzY38qx5zqFURpiS', 9, 21, 'Mariem', 'Belhadg', 0, '12345678', 'Feminin', '', '1997-12-31', 'Medina', 2, 1),
('bilelhedhli1@gmail.com', '$2b$10$8GLv1gd623kmKbWV0FHkK.4yp.qf1FRtoPH7YgNy2nZCKGrcekoPi', 9, 22, 'beji', 'sofienne', 0, '', 'Masculin', 'kjkj', '2021-06-30', 'Medina', 3, 1),
('Aymen123@gmail.com', '$2b$10$NFY64OyCx5ZSHzHFnKQA0uuZRALxq8Sa1mNicgOdrAmr.0aQqTGeW', 9, 23, 'test', 'test', 0, '11415416', 'Homme', '', '2021-12-31', 'Medina', 1, 1),
('bilelhedhli147@gmail.com', '$2b$10$6gKvAQSOIfgpNQfKQhgF5.5N2c24v9CR/xIq43vc3WfNd6XqvXjPm', 9, 24, 'Mohamed', 'Hedo', 0, '11415416', 'Homme', '', '2021-12-31', 'Medina', 1, 1),
('bilelhedhli145@gmail.com', '$2b$10$i3TgZ2/K6Zwh6TYY6uMLXuwuHapvuPEIU8n2m79oPxSwhtrH7whzG', 9, 25, 'mohamed', 'hedi', 0, '11256981', 'Homme', '', '2021-12-31', 'Medina', 1, 1),
('test1456@gmail.com', '$2b$10$xTlkZTKaZrwmQk1bTlYvU.rdCpplzNE2EtezK7kaJDOM.tSd5UgMq', 10, 26, 'Aymen', 'Kardi', 22, '11556699', 'Homme', '', '1998-02-23', 'Null', 1, 1),
('adminmaster1@gmail.com', '$2b$10$6ji62wOFtx3svHrxfyFE7OmypWlXIal.1obRP6PYLWwuDBblkXeLu', 10, 32, 'Bilel', 'hedhli', 0, '11258962', '', '', '1998-03-03', '', 1, 1),
('bensedrinedonia147@gmail.com', '$2b$10$awNqwdsKW8Xp7qc04U1PTuTUz0PNDlEgm.jN4BxxvjvdBSU.MMHvO', 10, 33, 'Donia', 'Ben Sedrine', 0, '11358912', '', '', '1998-03-03', '', 1, 1),
('bilelhedhli789@gmail.com', '$2b$10$LpYlcw6niH1Kgv9qY8GRduGafhmEg2cZ4p8yNibQLv98RckaNv8Gq', 9, 34, 'Dorsaf', 'Boughdiri', 0, '11415416', 'Femme', 'DH154777', '2006-02-04', 'Medina', 2, 1),
('boughdiridorsaf1298@gmail.com', '$2b$10$gRE8NwdN./WZUA9EJNiq0e/wS78Kv5onOUdslRJxbLdSFNkAElOv2', 10, 36, 'Dorsaf', 'Boughdiri', 0, '10000000', '', '', '1998-03-03', '', 1, 1),
('bilelhedhli@gmail.com', '$2b$10$w4dMxNquohfNVo8AWaz7KuO43ftprGks/TD.RGpDwq2vabMarNiXC', 9, 37, 'vacance', 'ete', 0, '12345678', 'Homme', '', '1998-02-23', 'Medina', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ville`
--

DROP TABLE IF EXISTS `ville`;
CREATE TABLE IF NOT EXISTS `ville` (
  `id_ville` int(11) NOT NULL AUTO_INCREMENT,
  `libelle_ville` varchar(255) NOT NULL,
  PRIMARY KEY (`id_ville`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ville`
--

INSERT INTO `ville` (`id_ville`, `libelle_ville`) VALUES
(1, 'Tunis');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `classe`
--
ALTER TABLE `classe`
  ADD CONSTRAINT `classe_ibfk_1` FOREIGN KEY (`id_responsable`) REFERENCES `responsable_classe` (`id_responsable_group`);

--
-- Constraints for table `cursus`
--
ALTER TABLE `cursus`
  ADD CONSTRAINT `fk_domaine_cursus` FOREIGN KEY (`id_domaine`) REFERENCES `domaine` (`id_domaine`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_etudiant_cursus` FOREIGN KEY (`id_etudiant`) REFERENCES `etudiant` (`id_etudiant`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `etablissement`
--
ALTER TABLE `etablissement`
  ADD CONSTRAINT `fk_gouver` FOREIGN KEY (`gouvernorat_adresse`) REFERENCES `gouvernerat` (`id_gouvernerat`),
  ADD CONSTRAINT `fk_villee` FOREIGN KEY (`ville`) REFERENCES `ville` (`id_ville`);

--
-- Constraints for table `etudiant`
--
ALTER TABLE `etudiant`
  ADD CONSTRAINT `FK_PersonOrder` FOREIGN KEY (`id_departement`) REFERENCES `departement` (`id_departement`),
  ADD CONSTRAINT `fk_bacc` FOREIGN KEY (`id_bacc`) REFERENCES `bacclaureat` (`id_bacc`),
  ADD CONSTRAINT `fk_cursusgenerale` FOREIGN KEY (`id_cursusgenerale`) REFERENCES `cursusgenerale` (`id_cursusgenerale`),
  ADD CONSTRAINT `fk_situation` FOREIGN KEY (`id_situation_etudiant`) REFERENCES `situation_etudiant` (`id_situation_etudiant`),
  ADD CONSTRAINT `fk_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

--
-- Constraints for table `evenement`
--
ALTER TABLE `evenement`
  ADD CONSTRAINT `evenement_ibfk_1` FOREIGN KEY (`id_membre`) REFERENCES `membre` (`id_membre`),
  ADD CONSTRAINT `evenement_ibfk_2` FOREIGN KEY (`id_club`) REFERENCES `club` (`id_club`);

--
-- Constraints for table `experience`
--
ALTER TABLE `experience`
  ADD CONSTRAINT `experience_ibfk_1` FOREIGN KEY (`id_cv`) REFERENCES `cv` (`id_cv`);

--
-- Constraints for table `gouvernerat`
--
ALTER TABLE `gouvernerat`
  ADD CONSTRAINT `fk_ville` FOREIGN KEY (`id_ville`) REFERENCES `ville` (`id_ville`);

--
-- Constraints for table `inscription`
--
ALTER TABLE `inscription`
  ADD CONSTRAINT `inscription_ibfk_1` FOREIGN KEY (`id_classe`) REFERENCES `classe` (`id_classe`),
  ADD CONSTRAINT `inscription_ibfk_2` FOREIGN KEY (`id_etudiant`) REFERENCES `etudiant` (`id_etudiant`);

--
-- Constraints for table `master`
--
ALTER TABLE `master`
  ADD CONSTRAINT `fk_admin_master` FOREIGN KEY (`id_admin_master`) REFERENCES `user` (`id_user`),
  ADD CONSTRAINT `fk_departement` FOREIGN KEY (`id_departement`) REFERENCES `departement` (`id_departement`);

--
-- Constraints for table `matiere`
--
ALTER TABLE `matiere`
  ADD CONSTRAINT `matiere_ibfk_1` FOREIGN KEY (`id_type_enseignement`) REFERENCES `type_enseignement` (`id_type_enseignant`),
  ADD CONSTRAINT `matiere_ibfk_2` FOREIGN KEY (`id_type_enseignement`) REFERENCES `type_enseignement` (`id_type_enseignant`),
  ADD CONSTRAINT `matiere_ibfk_3` FOREIGN KEY (`id_type_enseignement`) REFERENCES `type_enseignement` (`id_type_enseignant`),
  ADD CONSTRAINT `matiere_ibfk_4` FOREIGN KEY (`id_semestre`) REFERENCES `semestre` (`id_semestre`),
  ADD CONSTRAINT `matiere_ibfk_5` FOREIGN KEY (`id_niveau`) REFERENCES `niveau` (`id_niveau`);

--
-- Constraints for table `media_activites`
--
ALTER TABLE `media_activites`
  ADD CONSTRAINT `media_activites_ibfk_1` FOREIGN KEY (`id_activites`) REFERENCES `activites` (`id_activites`);

--
-- Constraints for table `offre_stage`
--
ALTER TABLE `offre_stage`
  ADD CONSTRAINT `offre_stage_ibfk_1` FOREIGN KEY (`id_responsable_entreprise`) REFERENCES `responsable_entreprise` (`id_responsable_entreprise`),
  ADD CONSTRAINT `offre_stage_ibfk_2` FOREIGN KEY (`id_responsable_entreprise`) REFERENCES `responsable_entreprise` (`id_responsable_entreprise`),
  ADD CONSTRAINT `offre_stage_ibfk_3` FOREIGN KEY (`id_etat_offre_stage`) REFERENCES `etat_offre_stage` (`id_etat_offre_stage`);

--
-- Constraints for table `option`
--
ALTER TABLE `option`
  ADD CONSTRAINT `option_ibfk_1` FOREIGN KEY (`id_niveau`) REFERENCES `niveau` (`id_niveau`),
  ADD CONSTRAINT `option_ibfk_2` FOREIGN KEY (`id_niveau`) REFERENCES `niveau` (`id_niveau`),
  ADD CONSTRAINT `option_ibfk_3` FOREIGN KEY (`id_parcours`) REFERENCES `parcours` (`id_parcours`);

--
-- Constraints for table `papier_administratif`
--
ALTER TABLE `papier_administratif`
  ADD CONSTRAINT `papier_administratif_ibfk_1` FOREIGN KEY (`id_type_papier`) REFERENCES `type_papier` (`id_type_papier`),
  ADD CONSTRAINT `papier_administratif_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`),
  ADD CONSTRAINT `papier_administratif_ibfk_3` FOREIGN KEY (`id_statut_papier`) REFERENCES `statut_papier` (`id_statut_papier`);

--
-- Constraints for table `participation`
--
ALTER TABLE `participation`
  ADD CONSTRAINT `participation_ibfk_1` FOREIGN KEY (`id_event`) REFERENCES `evenement` (`id_event`),
  ADD CONSTRAINT `participation_ibfk_2` FOREIGN KEY (`id_membre`) REFERENCES `membre` (`id_membre`);

--
-- Constraints for table `presence_etudiant`
--
ALTER TABLE `presence_etudiant`
  ADD CONSTRAINT `presence_etudiant_ibfk_1` FOREIGN KEY (`id_etudiant`) REFERENCES `etudiant` (`id_etudiant`),
  ADD CONSTRAINT `presence_etudiant_ibfk_10` FOREIGN KEY (`id_enseignement`) REFERENCES `enseignement` (`id_enseignement`),
  ADD CONSTRAINT `presence_etudiant_ibfk_11` FOREIGN KEY (`id_etat_presence_etd`) REFERENCES `etat_presence_etudiant` (`id_etat_presence_etudiant`),
  ADD CONSTRAINT `presence_etudiant_ibfk_12` FOREIGN KEY (`id_seance`) REFERENCES `seance` (`id_seance`),
  ADD CONSTRAINT `presence_etudiant_ibfk_13` FOREIGN KEY (`id_enseignement`) REFERENCES `enseignement` (`id_enseignement`),
  ADD CONSTRAINT `presence_etudiant_ibfk_2` FOREIGN KEY (`id_enseignement`) REFERENCES `enseignement` (`id_enseignement`),
  ADD CONSTRAINT `presence_etudiant_ibfk_3` FOREIGN KEY (`id_etudiant`) REFERENCES `etudiant` (`id_etudiant`),
  ADD CONSTRAINT `presence_etudiant_ibfk_4` FOREIGN KEY (`id_enseignement`) REFERENCES `enseignement` (`id_enseignement`),
  ADD CONSTRAINT `presence_etudiant_ibfk_5` FOREIGN KEY (`id_etudiant`) REFERENCES `etudiant` (`id_etudiant`),
  ADD CONSTRAINT `presence_etudiant_ibfk_6` FOREIGN KEY (`id_enseignement`) REFERENCES `enseignement` (`id_enseignement`),
  ADD CONSTRAINT `presence_etudiant_ibfk_7` FOREIGN KEY (`id_etudiant`) REFERENCES `etudiant` (`id_etudiant`),
  ADD CONSTRAINT `presence_etudiant_ibfk_8` FOREIGN KEY (`id_enseignement`) REFERENCES `enseignement` (`id_enseignement`),
  ADD CONSTRAINT `presence_etudiant_ibfk_9` FOREIGN KEY (`id_etudiant`) REFERENCES `etudiant` (`id_etudiant`);

--
-- Constraints for table `professeur`
--
ALTER TABLE `professeur`
  ADD CONSTRAINT `professeur_ibfk_1` FOREIGN KEY (`id_departement`) REFERENCES `departement` (`id_departement`),
  ADD CONSTRAINT `professeur_ibfk_2` FOREIGN KEY (`id_option`) REFERENCES `option` (`id_option`),
  ADD CONSTRAINT `professeur_ibfk_3` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

--
-- Constraints for table `publication_club`
--
ALTER TABLE `publication_club`
  ADD CONSTRAINT `publication_club_ibfk_1` FOREIGN KEY (`id_membre`) REFERENCES `membre` (`id_membre`),
  ADD CONSTRAINT `publication_club_ibfk_2` FOREIGN KEY (`id_club`) REFERENCES `club` (`id_club`);

--
-- Constraints for table `reclamation`
--
ALTER TABLE `reclamation`
  ADD CONSTRAINT `reclamation_ibfk_1` FOREIGN KEY (`id_statut_reclamation`) REFERENCES `statut_reclamation` (`id_statut_reclamation`),
  ADD CONSTRAINT `reclamation_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`),
  ADD CONSTRAINT `reclamation_ibfk_3` FOREIGN KEY (`id_type_reclamation`) REFERENCES `type_reclamation` (`id_type_reclamation`);

--
-- Constraints for table `responsable_classe`
--
ALTER TABLE `responsable_classe`
  ADD CONSTRAINT `responsable_classe_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

--
-- Constraints for table `responsable_entreprise`
--
ALTER TABLE `responsable_entreprise`
  ADD CONSTRAINT `responsable_entreprise_ibfk_1` FOREIGN KEY (`id_entreprise`) REFERENCES `entreprise` (`id_entreprises`),
  ADD CONSTRAINT `responsable_entreprise_ibfk_2` FOREIGN KEY (`id_entreprise`) REFERENCES `entreprise` (`id_entreprises`),
  ADD CONSTRAINT `responsable_entreprise_ibfk_3` FOREIGN KEY (`id_poste_entreprise`) REFERENCES `poste_entreprise` (`id_poste`),
  ADD CONSTRAINT `responsable_entreprise_ibfk_4` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

--
-- Constraints for table `rubrique`
--
ALTER TABLE `rubrique`
  ADD CONSTRAINT `rubrique_ibfk_1` FOREIGN KEY (`id_entretien`) REFERENCES `entretien` (`id_entretien`);

--
-- Constraints for table `salle`
--
ALTER TABLE `salle`
  ADD CONSTRAINT `salle_ibfk_1` FOREIGN KEY (`id_type_salle`) REFERENCES `type_salle` (`id_typeSalle`);

--
-- Constraints for table `specialite_cv`
--
ALTER TABLE `specialite_cv`
  ADD CONSTRAINT `specialite_cv_ibfk_1` FOREIGN KEY (`id_cv`) REFERENCES `cv` (`id_cv`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
