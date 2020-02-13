/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50562
Source Host           : localhost:3306
Source Database       : domestic_service_sys

Target Server Type    : MYSQL
Target Server Version : 50562
File Encoding         : 65001

Date: 2020-02-07 11:31:19
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '����ԱID',
  `account` varchar(10) NOT NULL COMMENT '����Ա�˺�',
  `password` varchar(20) NOT NULL COMMENT '����Ա����',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='����Ա';

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin', '12345');

-- ----------------------------
-- Table structure for category_
-- ----------------------------
DROP TABLE IF EXISTS `category_`;
CREATE TABLE `category_` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category_
-- ----------------------------
INSERT INTO `category_` VALUES ('1', 'category1');
INSERT INTO `category_` VALUES ('2', 'category2');
INSERT INTO `category_` VALUES ('3', 'category3');
INSERT INTO `category_` VALUES ('4', 'category4');
INSERT INTO `category_` VALUES ('5', 'category5');

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(10) NOT NULL,
  `password` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='�ͻ�';

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES ('1', 'cus1', '1234567');
INSERT INTO `customer` VALUES ('2', 'cus2', '222222');
INSERT INTO `customer` VALUES ('3', 'cus3', '111111');
INSERT INTO `customer` VALUES ('4', 'cus4', '111111');
INSERT INTO `customer` VALUES ('5', 'cus5', '123456');
INSERT INTO `customer` VALUES ('6', 'cus6', '666666');
INSERT INTO `customer` VALUES ('7', 'cus20', '123456');
INSERT INTO `customer` VALUES ('8', 'cuss1', '111111');
INSERT INTO `customer` VALUES ('9', 'cus', 'cus');
INSERT INTO `customer` VALUES ('10', 'cus111', '111');

-- ----------------------------
-- Table structure for feedback_info
-- ----------------------------
DROP TABLE IF EXISTS `feedback_info`;
CREATE TABLE `feedback_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cus_id` int(11) NOT NULL,
  `ser_id` int(11) NOT NULL,
  `is_complain` char(1) DEFAULT NULL,
  `appraise` varchar(255) DEFAULT NULL,
  `grade` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cus_id` (`cus_id`),
  KEY `ser_id` (`ser_id`),
  CONSTRAINT `feedback_info_ibfk_1` FOREIGN KEY (`cus_id`) REFERENCES `customer` (`id`),
  CONSTRAINT `feedback_info_ibfk_2` FOREIGN KEY (`ser_id`) REFERENCES `service_info` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='������Ϣ';

-- ----------------------------
-- Records of feedback_info
-- ----------------------------
INSERT INTO `feedback_info` VALUES ('1', '1', '1', '0', '很好', '5');
INSERT INTO `feedback_info` VALUES ('2', '1', '2', '0', '很好', '5');
INSERT INTO `feedback_info` VALUES ('3', '1', '5', '0', '', '5');
INSERT INTO `feedback_info` VALUES ('4', '1', '6', '0', '', '5');
INSERT INTO `feedback_info` VALUES ('5', '2', '3', '0', '', '5');

-- ----------------------------
-- Table structure for housekeeper
-- ----------------------------
DROP TABLE IF EXISTS `housekeeper`;
CREATE TABLE `housekeeper` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(10) NOT NULL,
  `password` varchar(20) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `native_place` varchar(50) DEFAULT NULL,
  `id_card` char(18) DEFAULT NULL,
  `role` char(1) NOT NULL,
  `employment_time` int(11) DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `is_distributed` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='������Ա';

-- ----------------------------
-- Records of housekeeper
-- ----------------------------
INSERT INTO `housekeeper` VALUES ('1', 'hadmin', '123456', '王小华', '11', '内蒙古', '150101199102020014', '0', '10', '男', '1');
INSERT INTO `housekeeper` VALUES ('2', 'hk1', '111111', '王花花', '25', '内蒙古', '150101199202030012', '1', '10', '女', '0');
INSERT INTO `housekeeper` VALUES ('3', 'hk2', '222222', '王飞飞', '22', '北京', '150100199102030012', '1', '2', '女', '0');
INSERT INTO `housekeeper` VALUES ('13', 'hk9', 'hk9', '黎明', '25', '北京', '150100199102030012', '1', '15', '男', '0');
INSERT INTO `housekeeper` VALUES ('14', 'hadmin1', '111111', '王花花', '22', '内蒙', '150102199110011101', '0', '5', '女', '0');
INSERT INTO `housekeeper` VALUES ('15', 'hadmin2', '123456', 'ad', '33', '北京', '150100199102030012', '0', '15', '男', '0');

-- ----------------------------
-- Table structure for housekeeper_service
-- ----------------------------
DROP TABLE IF EXISTS `housekeeper_service`;
CREATE TABLE `housekeeper_service` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hk_id` int(11) NOT NULL,
  `info_id` int(11) NOT NULL,
  `is_finished` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hk_id` (`hk_id`),
  KEY `info_id` (`info_id`),
  CONSTRAINT `housekeeper_service_ibfk_1` FOREIGN KEY (`hk_id`) REFERENCES `housekeeper` (`id`),
  CONSTRAINT `housekeeper_service_ibfk_2` FOREIGN KEY (`info_id`) REFERENCES `service_info` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='������Ա��Ϣ��Ӧ';

-- ----------------------------
-- Records of housekeeper_service
-- ----------------------------
INSERT INTO `housekeeper_service` VALUES ('1', '2', '1', '1');
INSERT INTO `housekeeper_service` VALUES ('2', '2', '2', '1');
INSERT INTO `housekeeper_service` VALUES ('16', '13', '5', '1');
INSERT INTO `housekeeper_service` VALUES ('17', '2', '6', '1');
INSERT INTO `housekeeper_service` VALUES ('18', '3', '6', '1');

-- ----------------------------
-- Table structure for housekeeper_type
-- ----------------------------
DROP TABLE IF EXISTS `housekeeper_type`;
CREATE TABLE `housekeeper_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hk_id` int(11) NOT NULL,
  `st_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hk_id` (`hk_id`),
  KEY `st_id` (`st_id`),
  CONSTRAINT `housekeeper_type_ibfk_1` FOREIGN KEY (`hk_id`) REFERENCES `housekeeper` (`id`),
  CONSTRAINT `housekeeper_type_ibfk_2` FOREIGN KEY (`st_id`) REFERENCES `service_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='������Ա����';

-- ----------------------------
-- Records of housekeeper_type
-- ----------------------------

-- ----------------------------
-- Table structure for service_info
-- ----------------------------
DROP TABLE IF EXISTS `service_info`;
CREATE TABLE `service_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `cus_id` int(11) NOT NULL,
  `commission` float DEFAULT NULL,
  `content` varchar(100) NOT NULL,
  `is_finished` int(11) NOT NULL,
  `is_appraise` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `contact_people` varchar(10) NOT NULL,
  `contact_info` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cus_id` (`cus_id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `service_info_ibfk_1` FOREIGN KEY (`cus_id`) REFERENCES `customer` (`id`),
  CONSTRAINT `service_info_ibfk_2` FOREIGN KEY (`type_id`) REFERENCES `service_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='������Ϣ';

-- ----------------------------
-- Records of service_info
-- ----------------------------
INSERT INTO `service_info` VALUES ('1', '2020-02-01 00:00:00', '2020-02-02 00:00:00', '1', '15000', '新居开荒第一次保洁', '1', '1', '2', '张华', '13190111234');
INSERT INTO `service_info` VALUES ('2', '2020-02-01 00:00:00', '2020-02-03 00:00:00', '1', '16000', '日常保洁', '1', '1', '1', '张张', '13123112232');
INSERT INTO `service_info` VALUES ('3', '2020-02-01 00:00:00', '2020-02-03 00:00:00', '2', '12000', '新居开荒第一次保洁', '0', '1', '2', '黎明', '13369471111');
INSERT INTO `service_info` VALUES ('4', '2020-02-01 00:00:00', '2020-02-01 00:00:00', '2', '600', '洗油烟机', '0', '0', '4', '黎明', '13369471111');
INSERT INTO `service_info` VALUES ('5', '2020-02-04 00:00:00', '2020-02-05 00:00:00', '1', '8000', '搬家', '1', '1', '6', '张华', '13369471111');
INSERT INTO `service_info` VALUES ('6', '2020-02-01 00:00:00', '2020-02-05 00:00:00', '1', '12000', '专业清晰，明亮窗外色', '1', '1', '3', '张华', '13369471111');
INSERT INTO `service_info` VALUES ('7', '2020-02-01 00:00:00', '2020-02-02 00:00:00', '2', '600', '优质服务,还您一个温馨的家', '0', '0', '1', '华张', '13123112232');
INSERT INTO `service_info` VALUES ('8', '2020-02-01 00:00:00', '2020-02-02 00:00:00', '2', '15000', '专业清晰，明亮窗外色', '0', '0', '2', '华张', '13123112232');

-- ----------------------------
-- Table structure for service_type
-- ----------------------------
DROP TABLE IF EXISTS `service_type`;
CREATE TABLE `service_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  `content` varchar(255) NOT NULL,
  `price` float NOT NULL,
  `brief` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='��������';

-- ----------------------------
-- Records of service_type
-- ----------------------------
INSERT INTO `service_type` VALUES ('1', '日常保洁', '室内玻璃擦试、物品分类归位、家具除尘、墙体地面除尘除垢、家用电器表面清洁', '200', '日常保洁清洁护理');
INSERT INTO `service_type` VALUES ('2', '开荒保洁', '清洗擦拭、除胶除漆、重点清洁', '800', '新居开荒 装修硬装结束第一次保洁');
INSERT INTO `service_type` VALUES ('3', '大扫除', '去污保洁、擦拭玻璃、消杀组合', '600', '清除污垢、使用长期未住、未彻底清洁房屋');
INSERT INTO `service_type` VALUES ('4', '家电清洗', '油烟机、空调、电冰箱、洗衣机', '300', '全面清洗、去污防病菌');
INSERT INTO `service_type` VALUES ('5', '擦玻璃', '擦玻璃', '150', '专业清晰，明亮窗外色');
INSERT INTO `service_type` VALUES ('6', '搬家', '平面搬运、拆装、提供劳工', '600', '优质服务,还您一个温馨的家');
