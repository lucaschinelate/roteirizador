-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema roteirizador
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema roteirizador
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `roteirizador` DEFAULT CHARACTER SET utf8 ;
USE `roteirizador` ;

-- -----------------------------------------------------
-- Table `roteirizador`.`EMPRESAS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `roteirizador`.`EMPRESAS` (
  `id` INT NOT NULL,
  `nome_empresa` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `roteirizador`.`FILIAIS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `roteirizador`.`FILIAIS` (
  `id` INT NOT NULL,
  `cnpj` VARCHAR(14) NOT NULL,
  `telefone` VARCHAR(15) NULL,
  `pais` VARCHAR(45) NOT NULL,
  `estado` VARCHAR(45) NOT NULL,
  `cidade` VARCHAR(45) NOT NULL,
  `bairro` VARCHAR(45) NOT NULL,
  `cep` VARCHAR(45) NOT NULL,
  `EMPRESA_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_FILIAL_EMPRESA1_idx` (`EMPRESA_id` ASC) ,
  CONSTRAINT `fk_FILIAL_EMPRESA1`
    FOREIGN KEY (`EMPRESA_id`)
    REFERENCES `roteirizador`.`EMPRESAS` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `roteirizador`.`FISICAS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `roteirizador`.`FISICAS` (
  `id` INT NOT NULL,
  `cpf` VARCHAR(15) NOT NULL,
  `rg` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `roteirizador`.`JURIDICAS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `roteirizador`.`JURIDICAS` (
  `id` INT NOT NULL,
  `cnpj` VARCHAR(15) NOT NULL,
  `razao_social` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `roteirizador`.`PESSOAS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `roteirizador`.`PESSOAS` (
  `id` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `numero_telefone` VARCHAR(45) NULL,
  `FISICA_id` INT NOT NULL,
  `JURIDICA_id` INT NOT NULL,
  PRIMARY KEY (`id`, `FISICA_id`, `JURIDICA_id`),
  INDEX `fk_PESSOA_FISICA1_idx` (`FISICA_id` ASC) ,
  INDEX `fk_PESSOA_JURIDICA1_idx` (`JURIDICA_id` ASC) ,
  CONSTRAINT `fk_PESSOA_FISICA1`
    FOREIGN KEY (`FISICA_id`)
    REFERENCES `roteirizador`.`FISICAS` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PESSOA_JURIDICA1`
    FOREIGN KEY (`JURIDICA_id`)
    REFERENCES `roteirizador`.`JURIDICAS` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `roteirizador`.`MOTORISTAS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `roteirizador`.`MOTORISTAS` (
  `cpf` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `data_admissao` DATE NOT NULL,
  `telefone` VARCHAR(15) NULL,
  `numero_cnh` VARCHAR(45) NULL,
  `data_validade_cnh` DATE NULL,
  `id` INT NOT NULL,
  `PESSOA_id` INT NOT NULL,
  `tipo_contrato` VARCHAR(2) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_MOTORISTA_PESSOA1_idx` (`PESSOA_id` ASC) ,
  CONSTRAINT `fk_MOTORISTA_PESSOA1`
    FOREIGN KEY (`PESSOA_id`)
    REFERENCES `roteirizador`.`PESSOAS` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `roteirizador`.`TIPO_VEICULOS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `roteirizador`.`TIPO_VEICULOS` (
  `id` INT NOT NULL,
  `descricao` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `roteirizador`.`VEICULOS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `roteirizador`.`VEICULOS` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `marca` VARCHAR(45) NULL,
  `km_rodado` INT NULL,
  `ano` DATE NULL,
  `modelo` VARCHAR(45) NULL,
  `capacida_peso` DECIMAL NULL,
  `capacidade_cubagem` DECIMAL NULL,
  `chassi` VARCHAR(45) NULL,
  `renavan` VARCHAR(45) NULL,
  `TIPO_VEICULOS_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) ,
  INDEX `fk_VEICULOS_TIPO_VEICULOS1_idx` (`TIPO_VEICULOS_id` ASC) ,
  CONSTRAINT `fk_VEICULOS_TIPO_VEICULOS1`
    FOREIGN KEY (`TIPO_VEICULOS_id`)
    REFERENCES `roteirizador`.`TIPO_VEICULOS` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `roteirizador`.`REGIOES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `roteirizador`.`REGIOES` (
  `id` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `roteirizador`.`ROTAS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `roteirizador`.`ROTAS` (
  `id` INT NOT NULL,
  `numeroPedagio` INT NULL,
  `gastoPedagio` FLOAT NULL,
  `descricaoRota` VARCHAR(45) NULL,
  `REGIAO_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_ROTA_REGIAO1_idx` (`REGIAO_id` ASC) ,
  CONSTRAINT `fk_ROTA_REGIAO1`
    FOREIGN KEY (`REGIAO_id`)
    REFERENCES `roteirizador`.`REGIOES` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `roteirizador`.`PRACAS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `roteirizador`.`PRACAS` (
  `id` INT NOT NULL,
  `praca` VARCHAR(45) NOT NULL,
  `ROTA_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_PRACA_ROTA1_idx` (`ROTA_id` ASC) ,
  CONSTRAINT `fk_PRACA_ROTA1`
    FOREIGN KEY (`ROTA_id`)
    REFERENCES `roteirizador`.`ROTAS` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `roteirizador`.`CLIENTES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `roteirizador`.`CLIENTES` (
  `id` INT NOT NULL,
  `PRACA_id` INT NOT NULL,
  `PESSOA_id` INT NOT NULL,
  PRIMARY KEY (`id`, `PESSOA_id`),
  INDEX `fk_CLIENTE_PRACA1_idx` (`PRACA_id` ASC) ,
  INDEX `fk_CLIENTE_PESSOA1_idx` (`PESSOA_id` ASC) ,
  CONSTRAINT `fk_CLIENTE_PRACA1`
    FOREIGN KEY (`PRACA_id`)
    REFERENCES `roteirizador`.`PRACAS` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CLIENTE_PESSOA1`
    FOREIGN KEY (`PESSOA_id`)
    REFERENCES `roteirizador`.`PESSOAS` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `roteirizador`.`PAIS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `roteirizador`.`PAIS` (
  `id` INT NOT NULL,
  `pais` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`, `pais`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `roteirizador`.`CIDADES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `roteirizador`.`CIDADES` (
  `codCidade` INT NOT NULL,
  `nomeCidade` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`codCidade`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `roteirizador`.`BAIRROS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `roteirizador`.`BAIRROS` (
  `cod_bairro` INT NOT NULL,
  `nomeBairro` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cod_bairro`, `nomeBairro`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `roteirizador`.`ENDERECOS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `roteirizador`.`ENDERECOS` (
  `id` INT NOT NULL,
  `ativo_inativo` TINYINT NOT NULL,
  `PESSOA_id` INT NOT NULL,
  `PESSOA_FISICA_id` INT NOT NULL,
  `PESSOA_JURIDICA_id` INT NOT NULL,
  `BAIRRO_cod_bairro` INT NOT NULL,
  `BAIRRO_nomeBairro` VARCHAR(45) NOT NULL,
  `PAIS_id` INT NOT NULL,
  `PAIS_pais` VARCHAR(45) NOT NULL,
  `CIDADE_codCidade` INT NOT NULL,
  PRIMARY KEY (`id`, `PESSOA_id`, `PESSOA_FISICA_id`, `PESSOA_JURIDICA_id`, `BAIRRO_cod_bairro`, `BAIRRO_nomeBairro`, `PAIS_id`, `PAIS_pais`, `CIDADE_codCidade`),
  INDEX `fk_ENDERECO_PESSOA1_idx` (`PESSOA_id` ASC, `PESSOA_FISICA_id` ASC, `PESSOA_JURIDICA_id` ASC) ,
  INDEX `fk_ENDERECO_BAIRRO1_idx` (`BAIRRO_cod_bairro` ASC, `BAIRRO_nomeBairro` ASC) ,
  INDEX `fk_ENDERECO_PAIS1_idx` (`PAIS_id` ASC, `PAIS_pais` ASC) ,
  INDEX `fk_ENDERECO_CIDADE1_idx` (`CIDADE_codCidade` ASC) ,
  CONSTRAINT `fk_ENDERECO_PESSOA1`
    FOREIGN KEY (`PESSOA_id` , `PESSOA_FISICA_id` , `PESSOA_JURIDICA_id`)
    REFERENCES `roteirizador`.`PESSOAS` (`id` , `FISICA_id` , `JURIDICA_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ENDERECO_BAIRRO1`
    FOREIGN KEY (`BAIRRO_cod_bairro` , `BAIRRO_nomeBairro`)
    REFERENCES `roteirizador`.`BAIRROS` (`cod_bairro` , `nomeBairro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ENDERECO_PAIS1`
    FOREIGN KEY (`PAIS_id` , `PAIS_pais`)
    REFERENCES `roteirizador`.`PAIS` (`id` , `pais`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ENDERECO_CIDADE1`
    FOREIGN KEY (`CIDADE_codCidade`)
    REFERENCES `roteirizador`.`CIDADES` (`codCidade`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `roteirizador`.`FILIAIS_MOTORISTAS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `roteirizador`.`FILIAIS_MOTORISTAS` (
  `FILIAL_id` INT NOT NULL,
  `MOTORISTA_id` INT NOT NULL,
  PRIMARY KEY (`FILIAL_id`, `MOTORISTA_id`),
  INDEX `fk_FILIAL_has_MOTORISTA_MOTORISTA1_idx` (`MOTORISTA_id` ASC) ,
  INDEX `fk_FILIAL_has_MOTORISTA_FILIAL1_idx` (`FILIAL_id` ASC) ,
  CONSTRAINT `fk_FILIAL_has_MOTORISTA_FILIAL1`
    FOREIGN KEY (`FILIAL_id`)
    REFERENCES `roteirizador`.`FILIAIS` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_FILIAL_has_MOTORISTA_MOTORISTA1`
    FOREIGN KEY (`MOTORISTA_id`)
    REFERENCES `roteirizador`.`MOTORISTAS` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `roteirizador`.`FILIAIS_VEICULOS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `roteirizador`.`FILIAIS_VEICULOS` (
  `FILIAL_id` INT NOT NULL,
  `VEICULO_id` INT NOT NULL,
  PRIMARY KEY (`FILIAL_id`, `VEICULO_id`),
  INDEX `fk_FILIAL_has_VEICULO_VEICULO1_idx` (`VEICULO_id` ASC) ,
  INDEX `fk_FILIAL_has_VEICULO_FILIAL1_idx` (`FILIAL_id` ASC) ,
  CONSTRAINT `fk_FILIAL_has_VEICULO_FILIAL1`
    FOREIGN KEY (`FILIAL_id`)
    REFERENCES `roteirizador`.`FILIAIS` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_FILIAL_has_VEICULO_VEICULO1`
    FOREIGN KEY (`VEICULO_id`)
    REFERENCES `roteirizador`.`VEICULOS` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `roteirizador`.`FILIAIS_CLIENTES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `roteirizador`.`FILIAIS_CLIENTES` (
  `FILIAL_id` INT NOT NULL,
  `CLIENTE_id` INT NOT NULL,
  PRIMARY KEY (`FILIAL_id`, `CLIENTE_id`),
  INDEX `fk_FILIAL_has_CLIENTE_CLIENTE1_idx` (`CLIENTE_id` ASC) ,
  INDEX `fk_FILIAL_has_CLIENTE_FILIAL1_idx` (`FILIAL_id` ASC) ,
  CONSTRAINT `fk_FILIAL_has_CLIENTE_FILIAL1`
    FOREIGN KEY (`FILIAL_id`)
    REFERENCES `roteirizador`.`FILIAIS` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_FILIAL_has_CLIENTE_CLIENTE1`
    FOREIGN KEY (`CLIENTE_id`)
    REFERENCES `roteirizador`.`CLIENTES` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
