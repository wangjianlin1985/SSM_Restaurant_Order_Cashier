/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50620
Source Host           : localhost:3306
Source Database       : ssm_cantingdiancan

Target Server Type    : MYSQL
Target Server Version : 50620
File Encoding         : 65001

Date: 2020-02-12 19:29:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `desk`
-- ----------------------------
DROP TABLE IF EXISTS `desk`;
CREATE TABLE `desk` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '桌位id',
  `deskCode` varchar(50) NOT NULL COMMENT '桌位编号',
  `status` int(10) NOT NULL COMMENT '1：空 2：点菜未买单',
  `peopleNum` int(10) DEFAULT '0' COMMENT '人数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of desk
-- ----------------------------
INSERT INTO `desk` VALUES ('1', '102', '1', '0');
INSERT INTO `desk` VALUES ('2', '103', '1', '0');
INSERT INTO `desk` VALUES ('3', '104', '1', '0');
INSERT INTO `desk` VALUES ('4', '105', '1', '0');
INSERT INTO `desk` VALUES ('5', '109', '1', '0');

-- ----------------------------
-- Table structure for `deskbill`
-- ----------------------------
DROP TABLE IF EXISTS `deskbill`;
CREATE TABLE `deskbill` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '账单id',
  `deskID` int(10) DEFAULT NULL COMMENT '账单对应的桌位ID',
  `billCode` varchar(50) DEFAULT NULL COMMENT '账单编号',
  `totalMoney` decimal(20,2) DEFAULT '0.00' COMMENT '消费总计',
  `peopleNum` int(10) DEFAULT '0' COMMENT '消费人数',
  `discount` decimal(10,1) DEFAULT '0.0' COMMENT '消费折扣',
  `createDate` datetime DEFAULT NULL COMMENT '消费时间',
  `debtor` varchar(50) DEFAULT NULL COMMENT '挂账人',
  `payType` int(10) DEFAULT NULL COMMENT '结账方式：1.微信2.支付宝3.刷卡4.现金5.挂账',
  `beforeMoney` decimal(20,2) DEFAULT '0.00' COMMENT '折扣前总计',
  `deskCode` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of deskbill
-- ----------------------------
INSERT INTO `deskbill` VALUES ('1', '1', '201908021564733834931', '98.00', '4', null, '2019-08-02 16:17:16', '', '1', '98.00', '102');
INSERT INTO `deskbill` VALUES ('2', '2', '202002121581504840819', '42.30', '3', '0.9', '2020-02-12 18:54:00', '', '4', '47.00', '103');
INSERT INTO `deskbill` VALUES ('3', '4', '202002121581504858887', '55.00', '2', null, '2020-02-12 18:54:18', '', '2', '55.00', '105');
INSERT INTO `deskbill` VALUES ('4', '5', '202002111581418617823', '33.00', '3', null, '2020-02-11 18:56:57', '', '2', '33.00', '109');
INSERT INTO `deskbill` VALUES ('5', '3', '202002121581505522049', '23.00', '2', null, '2020-02-12 19:05:22', '', '4', '23.00', '104');
INSERT INTO `deskbill` VALUES ('6', '1', '202002121581505733033', '86.00', '2', null, '2020-02-12 19:08:53', '', '2', '86.00', '102');

-- ----------------------------
-- Table structure for `deskbill_detail`
-- ----------------------------
DROP TABLE IF EXISTS `deskbill_detail`;
CREATE TABLE `deskbill_detail` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '账单详情ID',
  `deskBillID` int(10) DEFAULT NULL COMMENT '账单ID',
  `dishName` varchar(50) DEFAULT NULL COMMENT '菜品名',
  `dishNum` int(10) DEFAULT NULL COMMENT '菜品数目',
  `cost` decimal(20,2) DEFAULT NULL COMMENT '小计',
  `content` varchar(50) DEFAULT NULL COMMENT '菜品备注',
  `price` double(20,2) DEFAULT NULL COMMENT '单价',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of deskbill_detail
-- ----------------------------
INSERT INTO `deskbill_detail` VALUES ('1', '1', '炒丝瓜', '1', '12.00', '', '12.00');
INSERT INTO `deskbill_detail` VALUES ('2', '1', '排骨汤', '2', '86.00', '', '43.00');
INSERT INTO `deskbill_detail` VALUES ('3', '2', '炒肉', '1', '23.00', '', '23.00');
INSERT INTO `deskbill_detail` VALUES ('4', '2', '炒丝瓜', '2', '24.00', '', '12.00');
INSERT INTO `deskbill_detail` VALUES ('5', '3', '炒丝瓜', '1', '12.00', '', '12.00');
INSERT INTO `deskbill_detail` VALUES ('6', '3', '排骨汤', '1', '43.00', '', '43.00');
INSERT INTO `deskbill_detail` VALUES ('7', '4', '炒肉', '1', '23.00', '', '23.00');
INSERT INTO `deskbill_detail` VALUES ('8', '4', '凉皮', '1', '10.00', '', '10.00');
INSERT INTO `deskbill_detail` VALUES ('9', '5', '炒肉', '1', '23.00', '', '23.00');
INSERT INTO `deskbill_detail` VALUES ('10', '6', '炒肉', '2', '46.00', '', '23.00');
INSERT INTO `deskbill_detail` VALUES ('11', '6', '哈尔滨啤酒', '2', '40.00', '', '20.00');

-- ----------------------------
-- Table structure for `dish`
-- ----------------------------
DROP TABLE IF EXISTS `dish`;
CREATE TABLE `dish` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '菜品ID',
  `dishName` varchar(50) DEFAULT NULL COMMENT '菜品名字',
  `price` decimal(20,2) DEFAULT NULL COMMENT '菜品单价',
  `type` int(10) DEFAULT NULL COMMENT '菜品类型1:汤，2：炒菜,3:酒水，4：其它',
  `stock` int(10) DEFAULT NULL COMMENT '菜品库存',
  `fileName` varchar(100) DEFAULT NULL COMMENT '图片名',
  `drinkBillID` int(10) DEFAULT NULL COMMENT '进货ID',
  `drinkBillCode` varbinary(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dish
-- ----------------------------
INSERT INTO `dish` VALUES ('1', '炒丝瓜', '12.00', '2', null, '201908021564733028949_food.jpg', null, '');
INSERT INTO `dish` VALUES ('2', '炒肉', '23.00', '2', null, '201908021564733065827_food.jpg', null, '');
INSERT INTO `dish` VALUES ('3', '排骨汤', '43.00', '1', null, '201908021564733083260_food.jpg', null, '');
INSERT INTO `dish` VALUES ('4', '梦之蓝', '1000.00', '3', null, '201908021564733782916_food.jpg', null, 0x323031393038303231353634373333373238353730);
INSERT INTO `dish` VALUES ('5', '凉皮', '10.00', '4', null, '201908021564733881467_food.jpg', null, '');
INSERT INTO `dish` VALUES ('6', '哈尔滨啤酒', '20.00', '3', null, '202002121581505655338_1.jpg', null, 0x323032303032313231353831353035343232343236);

-- ----------------------------
-- Table structure for `drinkbill`
-- ----------------------------
DROP TABLE IF EXISTS `drinkbill`;
CREATE TABLE `drinkbill` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '进货信息id',
  `drinbillCode` varchar(100) NOT NULL COMMENT '订单编号',
  `productName` varchar(50) DEFAULT NULL COMMENT '商品名称',
  `proCount` int(10) DEFAULT NULL COMMENT '商品数目',
  `remark` varchar(50) DEFAULT NULL COMMENT '备注',
  `unit` varchar(10) DEFAULT NULL COMMENT '单位',
  `createDate` datetime DEFAULT NULL COMMENT '创建时间',
  `createBy` varchar(50) DEFAULT NULL COMMENT '创建人',
  `providerID` int(10) DEFAULT NULL COMMENT '供应商ID',
  `totalCost` decimal(20,2) DEFAULT NULL COMMENT '订单总价',
  `price` decimal(20,2) DEFAULT NULL COMMENT '商品单价',
  `isPay` int(5) DEFAULT '0' COMMENT '是否付款1未付款2已付款',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of drinkbill
-- ----------------------------
INSERT INTO `drinkbill` VALUES ('1', '201908021564733728570', '梦之蓝', '10000', '', '1000', '2019-08-02 16:15:29', '测试aa', '1', '800000.00', '800.00', '2');
INSERT INTO `drinkbill` VALUES ('3', '202002121581505422426', '哈尔滨啤酒', '500', '测试', '瓶', '2020-02-12 19:03:42', '王晓婷', '2', '5000.00', '10.00', '2');

-- ----------------------------
-- Table structure for `drink_sell_bill`
-- ----------------------------
DROP TABLE IF EXISTS `drink_sell_bill`;
CREATE TABLE `drink_sell_bill` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '销售信息id',
  `drinkbillID` int(10) DEFAULT NULL COMMENT '对应的酒水进货信息id',
  `sellCount` int(10) DEFAULT NULL COMMENT '销售数目',
  `sellPrice` decimal(20,2) DEFAULT NULL COMMENT '销售单价',
  `DrinkBillCode` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of drink_sell_bill
-- ----------------------------
INSERT INTO `drink_sell_bill` VALUES ('1', '1', '0', '810000.00', '201908021564733728570');
INSERT INTO `drink_sell_bill` VALUES ('3', '3', '2', '20.00', '202002121581505422426');

-- ----------------------------
-- Table structure for `provider`
-- ----------------------------
DROP TABLE IF EXISTS `provider`;
CREATE TABLE `provider` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '供应商id',
  `proName` varchar(50) DEFAULT NULL COMMENT '供应商名',
  `product` varchar(50) DEFAULT NULL COMMENT '主要供应商品',
  `telNumber` varchar(50) DEFAULT NULL COMMENT '联系电话',
  `address` varchar(50) DEFAULT NULL COMMENT '地址',
  `contact` varchar(50) DEFAULT NULL COMMENT '主要联系人',
  `phone` varchar(50) DEFAULT NULL COMMENT '联系人手机号码',
  `remark` varchar(50) DEFAULT NULL COMMENT '备注',
  `createDate` datetime DEFAULT NULL COMMENT '订单创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of provider
-- ----------------------------
INSERT INTO `provider` VALUES ('1', '洋河酒厂', '酒', '13310921423', '江苏省宿迁市', '刘强东', '13342081234', '无', '2019-08-02 16:05:38');
INSERT INTO `provider` VALUES ('2', '双沟酒业有限公司', '双沟酒', '31213213223', '江苏省宿迁市', 'test@gmail.com', '15929340934', '无', '2019-08-02 16:20:42');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `userCode` varchar(50) NOT NULL COMMENT '用户账号',
  `userName` varchar(50) DEFAULT NULL COMMENT '用户姓名',
  `userPassWord` varchar(50) NOT NULL COMMENT '用户密码',
  `phone` varchar(50) DEFAULT NULL COMMENT '用户手机号码',
  `identity` varchar(50) DEFAULT NULL COMMENT '用户身份证号码',
  `createDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', '小明', 'adminadmin', '13333333333', '111111111111111111', '2019-05-07 00:00:00');
INSERT INTO `user` VALUES ('2', '1414', '王晓婷', '123456', '15408340834', '132123132123123132', '2019-08-02 16:19:34');
