-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : jeu. 25 août 2022 à 14:41
-- Version du serveur :  10.5.13-MariaDB-0ubuntu0.21.04.1
-- Version de PHP : 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `bd_comic`
--

-- --------------------------------------------------------

--
-- Structure de la table `com_collection`
--

CREATE TABLE `com_collection` (
  `col_id` bigint(20) NOT NULL,
  `col_name` varchar(255) NOT NULL,
  `col_prestige` varchar(255) NOT NULL,
  `col_release_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `com_comic`
--

CREATE TABLE `com_comic` (
  `com_id` bigint(20) NOT NULL,
  `com_isbn` bigint(20) NOT NULL,
  `com_title` varchar(255) NOT NULL,
  `com_abstract` text NOT NULL,
  `com_publication_date` date NOT NULL,
  `com_number_page` int(11) NOT NULL,
  `com_fk_world_id` bigint(20) NOT NULL,
  `com_fk_period_id` bigint(20) NOT NULL,
  `com_fk_serie_id` bigint(20) NOT NULL,
  `com_fk_designer_id` bigint(20) NOT NULL,
  `com_fk_editor_id` bigint(20) NOT NULL,
  `com_fk_scriptwriter_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `com_comic_collection`
--

CREATE TABLE `com_comic_collection` (
  `com_col_id` bigint(20) NOT NULL,
  `com_col_fk_comic_id` bigint(20) NOT NULL,
  `com_col_fk_collection_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `com_comic_personnage`
--

CREATE TABLE `com_comic_personnage` (
  `com_pers_id` bigint(20) NOT NULL,
  `com_pers_fk_comic_id` bigint(20) NOT NULL,
  `com_pers_fk_personage_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `com_designer`
--

CREATE TABLE `com_designer` (
  `design_id` bigint(20) NOT NULL,
  `design_name` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `com_editor`
--

CREATE TABLE `com_editor` (
  `edit_id` bigint(20) NOT NULL,
  ` edit_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `com_period`
--

CREATE TABLE `com_period` (
  `prd_id` bigint(20) NOT NULL,
  `prd_name` varchar(255) NOT NULL,
  `prd_description` text NOT NULL,
  `prd_year` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `com_personage`
--

CREATE TABLE `com_personage` (
  `pers_id` bigint(20) NOT NULL,
  `pers_name` varchar(255) NOT NULL,
  `pers_alias` varchar(255) NOT NULL,
  `pers_ status` varchar(255) NOT NULL,
  `pers_description` text NOT NULL,
  `pers_first_app` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `com_reward`
--

CREATE TABLE `com_reward` (
  `rew_id` bigint(20) NOT NULL,
  `rew_name` varchar(255) NOT NULL,
  `rew_description` text NOT NULL,
  `rew_ year_obtained` date NOT NULL,
  `rew_fk_comic_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `com_scriptwriter`
--

CREATE TABLE `com_scriptwriter` (
  `sw_id` bigint(20) NOT NULL,
  `sw_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `com_serie`
--

CREATE TABLE `com_serie` (
  `ser_id` bigint(20) NOT NULL,
  `ser_name` varchar(255) NOT NULL,
  `ser_number_volume` int(11) NOT NULL,
  `ser_description` text NOT NULL,
  `ser_year_pub` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `com_world`
--

CREATE TABLE `com_world` (
  `wld_id` bigint(20) NOT NULL,
  `wld_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `com_collection`
--
ALTER TABLE `com_collection`
  ADD PRIMARY KEY (`col_id`);

--
-- Index pour la table `com_comic`
--
ALTER TABLE `com_comic`
  ADD PRIMARY KEY (`com_id`),
  ADD KEY `com_fk_world_id` (`com_fk_world_id`),
  ADD KEY `com_fk_period_id` (`com_fk_period_id`),
  ADD KEY `com_fk_serie_id` (`com_fk_serie_id`),
  ADD KEY `co_comic_ibfk_5` (`com_fk_designer_id`),
  ADD KEY `com_fk_scriptwriter_id` (`com_fk_scriptwriter_id`),
  ADD KEY `com_fk_editor_id` (`com_fk_editor_id`);

--
-- Index pour la table `com_comic_collection`
--
ALTER TABLE `com_comic_collection`
  ADD PRIMARY KEY (`com_col_id`),
  ADD KEY `com_col_collection_id` (`com_col_fk_collection_id`),
  ADD KEY `com_col_comic_id` (`com_col_fk_comic_id`);

--
-- Index pour la table `com_comic_personnage`
--
ALTER TABLE `com_comic_personnage`
  ADD PRIMARY KEY (`com_pers_id`),
  ADD KEY `h_fk_comic_id` (`com_pers_fk_comic_id`),
  ADD KEY `h_fk_personage_id` (`com_pers_fk_personage_id`);

--
-- Index pour la table `com_designer`
--
ALTER TABLE `com_designer`
  ADD PRIMARY KEY (`design_id`);

--
-- Index pour la table `com_editor`
--
ALTER TABLE `com_editor`
  ADD PRIMARY KEY (`edit_id`);

--
-- Index pour la table `com_period`
--
ALTER TABLE `com_period`
  ADD PRIMARY KEY (`prd_id`);

--
-- Index pour la table `com_personage`
--
ALTER TABLE `com_personage`
  ADD PRIMARY KEY (`pers_id`);

--
-- Index pour la table `com_reward`
--
ALTER TABLE `com_reward`
  ADD PRIMARY KEY (`rew_id`),
  ADD KEY `r_fk_comic_id` (`rew_fk_comic_id`);

--
-- Index pour la table `com_scriptwriter`
--
ALTER TABLE `com_scriptwriter`
  ADD PRIMARY KEY (`sw_id`);

--
-- Index pour la table `com_serie`
--
ALTER TABLE `com_serie`
  ADD PRIMARY KEY (`ser_id`);

--
-- Index pour la table `com_world`
--
ALTER TABLE `com_world`
  ADD PRIMARY KEY (`wld_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `com_collection`
--
ALTER TABLE `com_collection`
  MODIFY `col_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `com_comic`
--
ALTER TABLE `com_comic`
  MODIFY `com_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `com_comic_personnage`
--
ALTER TABLE `com_comic_personnage`
  MODIFY `com_pers_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `com_designer`
--
ALTER TABLE `com_designer`
  MODIFY `design_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `com_editor`
--
ALTER TABLE `com_editor`
  MODIFY `edit_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `com_period`
--
ALTER TABLE `com_period`
  MODIFY `prd_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `com_personage`
--
ALTER TABLE `com_personage`
  MODIFY `pers_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `com_reward`
--
ALTER TABLE `com_reward`
  MODIFY `rew_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `com_scriptwriter`
--
ALTER TABLE `com_scriptwriter`
  MODIFY `sw_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `com_serie`
--
ALTER TABLE `com_serie`
  MODIFY `ser_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `com_world`
--
ALTER TABLE `com_world`
  MODIFY `wld_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `com_comic`
--
ALTER TABLE `com_comic`
  ADD CONSTRAINT `com_comic_ibfk_2` FOREIGN KEY (`com_fk_world_id`) REFERENCES `com_world` (`wld_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `com_comic_ibfk_3` FOREIGN KEY (`com_fk_period_id`) REFERENCES `com_period` (`prd_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `com_comic_ibfk_4` FOREIGN KEY (`com_fk_serie_id`) REFERENCES `com_serie` (`ser_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `com_comic_ibfk_5` FOREIGN KEY (`com_fk_designer_id`) REFERENCES `com_designer` (`design_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `com_comic_ibfk_7` FOREIGN KEY (`com_fk_scriptwriter_id`) REFERENCES `com_scriptwriter` (`sw_id`),
  ADD CONSTRAINT `com_comic_ibfk_8` FOREIGN KEY (`com_fk_editor_id`) REFERENCES `com_editor` (`edit_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `com_comic_collection`
--
ALTER TABLE `com_comic_collection`
  ADD CONSTRAINT `com_comic_collection_ibfk_1` FOREIGN KEY (`com_col_fk_collection_id`) REFERENCES `com_collection` (`col_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `com_comic_collection_ibfk_2` FOREIGN KEY (`com_col_fk_comic_id`) REFERENCES `com_comic` (`com_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `com_comic_personnage`
--
ALTER TABLE `com_comic_personnage`
  ADD CONSTRAINT `com_comic_personnage_ibfk_1` FOREIGN KEY (`com_pers_fk_comic_id`) REFERENCES `com_comic` (`com_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `com_comic_personnage_ibfk_2` FOREIGN KEY (`com_pers_fk_personage_id`) REFERENCES `com_personage` (`pers_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `com_reward`
--
ALTER TABLE `com_reward`
  ADD CONSTRAINT `com_reward_ibfk_1` FOREIGN KEY (`rew_fk_comic_id`) REFERENCES `com_comic` (`com_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `com_serie`
--
ALTER TABLE `com_serie`
  ADD CONSTRAINT `com_serie_ibfk_1` FOREIGN KEY (`ser_id`) REFERENCES `com_comic` (`com_fk_serie_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
