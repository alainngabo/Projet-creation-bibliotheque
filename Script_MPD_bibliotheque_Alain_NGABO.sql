drop database if exists bibliothèque;
create database if not exists bibliothèque;
USE `bibliothèque` ;

-- -----------------------------------------------------
-- Table `bibliothèque`.`auteur`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bibliothèque`.`auteur` (
  `idauteur` VARCHAR(30) NOT NULL,
  `nom` VARCHAR(30) NULL DEFAULT NULL,
  `prenom` VARCHAR(30) NULL DEFAULT NULL,
  `adresse` VARCHAR(30) NULL DEFAULT NULL,
  `telephone` INT NULL DEFAULT NULL,
  `sexe` VARCHAR(10) NULL DEFAULT NULL,
  `jourdenaissance` VARCHAR(30) NULL DEFAULT NULL,
  `isbn` INT NOT NULL
  )
;


-- -----------------------------------------------------
-- Table `bibliothèque`.`editeur`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bibliothèque`.`editeur` (
  `idediteur` VARCHAR(30) NOT NULL,
  `nom` VARCHAR(30) NULL DEFAULT NULL,
  `adresse` VARCHAR(30) NULL DEFAULT NULL,
  `telephone` INT NULL DEFAULT NULL
  )
;


-- -----------------------------------------------------
-- Table `bibliothèque`.`fichiersabonnes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bibliothèque`.`fichiersabonnes` (
  `numeromatricule` VARCHAR(30) NOT NULL,
  `nom` VARCHAR(30) NULL DEFAULT NULL,
  `adresse` VARCHAR(30) NULL DEFAULT NULL,
  `telephone` INT NULL DEFAULT NULL,
  `sexe` VARCHAR(10) NULL DEFAULT NULL,
  `jourdenaissance` VARCHAR(30) NULL DEFAULT NULL,
  `datedadhesion` VARCHAR(30) NULL DEFAULT NULL,
  `categorieprofessionnelle` VARCHAR(30) NULL DEFAULT NULL,
  `historiqueemprunt` VARCHAR(30) NULL DEFAULT NULL
  )
;


-- -----------------------------------------------------
-- Table `bibliothèque`.`motscles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bibliothèque`.`motscles` (
  `idmotscles` VARCHAR(30) NOT NULL,
  `isbn` INT NOT NULL
  
  )
;


-- -----------------------------------------------------
-- Table `bibliothèque`.`livre`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bibliothèque`.`livre` (
  `isbn` INT NOT NULL,
  `titre` VARCHAR(30) NULL DEFAULT NULL,
  `theme` VARCHAR(30) NULL DEFAULT NULL,
  `langue` VARCHAR(10) NULL DEFAULT NULL,
  `anneedecriture` INT NULL DEFAULT NULL,
  `id_auteur` VARCHAR(30) NULL DEFAULT NULL,
  `id_motscles` VARCHAR(30) NULL DEFAULT NULL
    )
;


-- -----------------------------------------------------
-- Table `bibliothèque`.`exemplairelivre`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bibliothèque`.`exemplairelivre` (
  `coderayon` VARCHAR(30) NOT NULL,
  `codecatalogue` VARCHAR(30) NULL DEFAULT NULL,
  `dateacquisition` VARCHAR(30) NULL DEFAULT NULL,
  `codeusure` VARCHAR(30) NULL DEFAULT NULL,
  `isbn` INT NULL DEFAULT NULL,
  `id_editeur` VARCHAR(30) NULL DEFAULT NULL
)
;


-- -----------------------------------------------------
-- Table `bibliothèque`.`emprunt`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bibliothèque`.`emprunt` (
  `numeromatricule` VARCHAR(30) NULL DEFAULT NULL,
  `coderayon` VARCHAR(30) NOT NULL,
  `nombredelivres` INT NULL DEFAULT NULL,
  `dateemprunt` VARCHAR(30) NULL DEFAULT NULL,
  `dateretour` VARCHAR(30) NULL DEFAULT NULL
 )
;


-- -----------------------------------------------------
-- Table `bibliothèque`.`rayon`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bibliothèque`.`rayon` (
  `idrayon` VARCHAR(30) NOT NULL,
  `livre` INT NULL DEFAULT NULL,
  `coderayon` VARCHAR(30) NULL DEFAULT NULL
  )
;

Alter table auteur add PRIMARY KEY (`idauteur`);
alter table editeur add PRIMARY KEY (`idediteur`);
alter table fichiersabonnes add primary key (`numeromatricule`);
alter table motscles add PRIMARY KEY (`idmotscles`);
alter table livre add PRIMARY KEY (`isbn`);
alter table exemplairelivre add PRIMARY KEY (`coderayon`);
alter table emprunt add PRIMARY KEY (`coderayon`);
alter table rayon add PRIMARY KEY (`idrayon`);

alter table auteur add foreign key (`isbn`) References `bibliothèque`.`livre` (`isbn`);
alter table motscles add foreign key (`isbn`) References `bibliothèque`.`livre` (`isbn`);
Alter table livre add  FOREIGN KEY (`id_auteur`) REFERENCES `bibliothèque`.`auteur` (`idauteur`);
alter table livre add FOREIGN KEY (`id_motscles`) REFERENCES `bibliothèque`.`motscles` (`idmotscles`);
alter table exemplairelivre add FOREIGN KEY (`isbn`) REFERENCES `bibliothèque`.`livre` (`isbn`);
alter table exemplairelivre add FOREIGN KEY (`id_editeur`) REFERENCES `bibliothèque`.`editeur` (`idediteur`);
alter table emprunt add  FOREIGN KEY (`numeromatricule`) REFERENCES `bibliothèque`.`fichiersabonnes` (`numeromatricule`); 
alter table emprunt add  FOREIGN KEY (`coderayon`) REFERENCES `bibliothèque`.`exemplairelivre` (`coderayon`);
alter table rayon add FOREIGN KEY (`livre`) REFERENCES `bibliothèque`.`livre` (`isbn`);
alter table rayon add FOREIGN KEY (`coderayon`) REFERENCES `bibliothèque`.`exemplairelivre` (`coderayon`);

   
    

