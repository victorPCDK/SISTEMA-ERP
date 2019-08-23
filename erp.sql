/*
Navicat MySQL Data Transfer

Source Server         : ip2
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : erp

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2019-08-23 16:38:32
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `capacitaciones`
-- ----------------------------
DROP TABLE IF EXISTS `capacitaciones`;
CREATE TABLE `capacitaciones` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CAPACITACION` varchar(30) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of capacitaciones
-- ----------------------------
INSERT INTO `capacitaciones` VALUES ('1', 'CAJERO');
INSERT INTO `capacitaciones` VALUES ('2', 'ALMACEN');
INSERT INTO `capacitaciones` VALUES ('3', 'VENTAS');
INSERT INTO `capacitaciones` VALUES ('4', 'GERENTE');
INSERT INTO `capacitaciones` VALUES ('5', 'CHALAN');

-- ----------------------------
-- Table structure for `datos_empleado`
-- ----------------------------
DROP TABLE IF EXISTS `datos_empleado`;
CREATE TABLE `datos_empleado` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(50) NOT NULL,
  `APELLIDOS` varchar(60) NOT NULL,
  `CURP` varchar(18) NOT NULL,
  `FECHA_CONTRATACION` date NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `CURP` (`CURP`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of datos_empleado
-- ----------------------------
INSERT INTO `datos_empleado` VALUES ('1', 'VICTOR', 'PAREDES', 'PACV970514HPLRRC00', '1997-05-14');
INSERT INTO `datos_empleado` VALUES ('2', 'ROBERTO', 'CERVANTES', 'RONN971014HPLRRC00', '2018-08-23');
INSERT INTO `datos_empleado` VALUES ('3', 'JAHZEEL', 'HERNANDEZ', 'JAHH921304HPLRRC00', '2017-01-01');
INSERT INTO `datos_empleado` VALUES ('4', 'DENNIA', 'RIVAS', 'DENN970514HPLRRC00', '2000-02-02');
INSERT INTO `datos_empleado` VALUES ('5', 'CHRISTIAN', 'RAMIREZ', 'CHRI921423HPLRRC00', '2010-03-07');

-- ----------------------------
-- Table structure for `empleados`
-- ----------------------------
DROP TABLE IF EXISTS `empleados`;
CREATE TABLE `empleados` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CAPACITACIONES` varchar(100) NOT NULL,
  `SDI` float NOT NULL,
  `CLAVE_TIENDA_BASE` varchar(10) NOT NULL,
  `HORARIO_LABORAL` varchar(15) NOT NULL,
  `HORAS` int(11) NOT NULL,
  `PUESTO_BASE` varchar(100) NOT NULL,
  `ANTIGUEDAD_AÑOS` int(11) NOT NULL,
  `HORARIO_DISPONIBLE` varchar(100) NOT NULL,
  `CURP` varchar(18) NOT NULL,
  `CLAVE_TIENDA_TEMPORAL` varchar(10) DEFAULT NULL,
  `DIAS_LABORALES` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_CURP` (`CURP`),
  KEY `FK_CLAVE_TIENDA` (`CLAVE_TIENDA_BASE`),
  KEY `FK_CLAVE_TIENDATEMP` (`CLAVE_TIENDA_TEMPORAL`),
  CONSTRAINT `FK_CLAVE_TIENDA` FOREIGN KEY (`CLAVE_TIENDA_BASE`) REFERENCES `tienda` (`CLAVE_TIENDA`),
  CONSTRAINT `FK_CURP` FOREIGN KEY (`CURP`) REFERENCES `datos_empleado` (`CURP`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of empleados
-- ----------------------------

-- ----------------------------
-- Table structure for `papelera`
-- ----------------------------
DROP TABLE IF EXISTS `papelera`;
CREATE TABLE `papelera` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CAPACITACIONES` varchar(100) NOT NULL,
  `SDI` float NOT NULL,
  `CLAVE_TIENDA_BASE` varchar(10) NOT NULL,
  `HORARIO_LABORAL` varchar(15) NOT NULL,
  `HORAS` int(11) NOT NULL,
  `PUESTO_BASE` varchar(100) NOT NULL,
  `ANTIGUEDAD` int(11) NOT NULL,
  `HORARIO_DISPONIBLE` varchar(100) NOT NULL,
  `CURP` varchar(18) NOT NULL,
  `CLAVE_TIENDA_TEMPORAL` varchar(10) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_CURP` (`CURP`),
  KEY `FK_CLAVE_TIENDA` (`CLAVE_TIENDA_BASE`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of papelera
-- ----------------------------

-- ----------------------------
-- Table structure for `tienda`
-- ----------------------------
DROP TABLE IF EXISTS `tienda`;
CREATE TABLE `tienda` (
  `ID_TIENDA_BASE` int(11) NOT NULL AUTO_INCREMENT,
  `CLAVE_TIENDA` varchar(10) NOT NULL,
  `RFC` varchar(100) NOT NULL,
  `REQUERIMIENTO_PERSONAL` int(11) NOT NULL,
  `REQUERIMIENTO_HORARIO` varchar(100) NOT NULL,
  `META_VENTA` int(11) NOT NULL,
  `ZONA` varchar(100) NOT NULL,
  `TOLERANCIA` float NOT NULL,
  PRIMARY KEY (`ID_TIENDA_BASE`),
  UNIQUE KEY `RFC` (`RFC`),
  KEY `CLAVE_TIENDA` (`CLAVE_TIENDA`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of tienda
-- ----------------------------
INSERT INTO `tienda` VALUES ('9', '001SMM', 'SM070814HPL1', '8', '8:00 - 7:00', '1500', 'SAN MARTIN MERCADO', '0.15');
INSERT INTO `tienda` VALUES ('10', '002HT', 'HT070814HPL1', '2', '8:00 - 7:00', '1300', 'HUEJOTZINGO', '0.15');
INSERT INTO `tienda` VALUES ('11', '003PB', 'PB080714HPL1', '7', '8:00 - 7:00', '1400', 'PUEBLA', '0.15');
INSERT INTO `tienda` VALUES ('12', '004SMC', 'SMM980714HPL1', '5', '8:00 - 7:00', '1300', 'SAN MARTIN CENTRO', '0.15');
