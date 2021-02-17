/*
Navicat MySQL Data Transfer

Source Server         : hu66
Source Server Version : 50555
Source Host           : 127.0.0.1:3306
Source Database       : youxian

Target Server Type    : MYSQL
Target Server Version : 50555
File Encoding         : 65001

Date: 2021-01-07 22:09:40
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `activeinfo`
-- ----------------------------
DROP TABLE IF EXISTS `activeinfo`;
CREATE TABLE `activeinfo` (
  `acid` int(11) NOT NULL AUTO_INCREMENT COMMENT '活动编号',
  `gid` int(11) DEFAULT NULL COMMENT '商品编号',
  `activeName` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '活动名称',
  `rebate` decimal(2,0) NOT NULL COMMENT '折扣',
  `sdate` date NOT NULL COMMENT '活动开始时间',
  `edate` date NOT NULL COMMENT '活动结束时间',
  `status` int(2) DEFAULT NULL COMMENT '活动状态',
  PRIMARY KEY (`acid`),
  KEY `FK_activeinfo_gid` (`gid`),
  CONSTRAINT `FK_activeinfo_gid` FOREIGN KEY (`gid`) REFERENCES `goodsinfo` (`gid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of activeinfo
-- ----------------------------

-- ----------------------------
-- Table structure for `admininfo`
-- ----------------------------
DROP TABLE IF EXISTS `admininfo`;
CREATE TABLE `admininfo` (
  `aid` int(10) NOT NULL AUTO_INCREMENT COMMENT '管理员编号',
  `tel` int(11) NOT NULL COMMENT '管理员手机号',
  `aname` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '管理员姓名',
  `pwd` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '密码',
  `email` varchar(15) COLLATE utf8_bin NOT NULL COMMENT '联系方式',
  `status` int(3) DEFAULT NULL COMMENT '0封禁  1管理员  100超级',
  PRIMARY KEY (`aid`),
  UNIQUE KEY `tel` (`tel`),
  UNIQUE KEY `aname` (`aname`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of admininfo
-- ----------------------------
INSERT INTO admininfo VALUES ('101', '111', '管理员', '698d51a19d8a121ce581499d7b701668', '111', '1');
INSERT INTO admininfo VALUES ('103', '1', '超级', 'c4ca4238a0b923820dcc509a6f75849b', '1', '100');
INSERT INTO admininfo VALUES ('104', '222', '管理员2', 'bcbe3365e6ac95ea2c0343a2395834dd', '222', '1');

-- ----------------------------
-- Table structure for `cartinfo`
-- ----------------------------
DROP TABLE IF EXISTS `cartinfo`;
CREATE TABLE `cartinfo` (
  `cid` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单编号',
  `mid` int(11) DEFAULT NULL COMMENT '会员编号',
  `gid` int(11) DEFAULT NULL COMMENT '商品编号',
  `nums` int(11) DEFAULT NULL COMMENT '购买数量',
  PRIMARY KEY (`cid`),
  KEY `FK_cartinfo_mid` (`mid`),
  KEY `FK_cartinfo_gid` (`gid`),
  CONSTRAINT `FK_cartinfo_gid` FOREIGN KEY (`gid`) REFERENCES `goodsinfo` (`gid`),
  CONSTRAINT `FK_cartinfo_mid` FOREIGN KEY (`mid`) REFERENCES `memberinfo` (`mid`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of cartinfo
-- ----------------------------
INSERT INTO cartinfo VALUES ('30', '37', '4', '1');
INSERT INTO cartinfo VALUES ('31', '37', '2', '1');

-- ----------------------------
-- Table structure for `detailinfo`
-- ----------------------------
DROP TABLE IF EXISTS `detailinfo`;
CREATE TABLE `detailinfo` (
  `did` int(11) NOT NULL AUTO_INCREMENT COMMENT '详细编号',
  `oid` varchar(200) COLLATE utf8_bin NOT NULL COMMENT '订单编号',
  `gid` int(11) NOT NULL COMMENT '商品编号',
  `gname` varchar(100) COLLATE utf8_bin NOT NULL,
  `pics` varchar(200) COLLATE utf8_bin NOT NULL COMMENT '商品图片',
  `price` decimal(10,2) NOT NULL COMMENT '商品单价',
  `nums` int(11) NOT NULL COMMENT '购买数量',
  PRIMARY KEY (`did`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of detailinfo
-- ----------------------------
INSERT INTO detailinfo VALUES ('37', 'bff0fc99699743d092627e69c4fb29bc', '2', '葡萄', '../ttsx_pics/3.jpg', '89.00', '1');
INSERT INTO detailinfo VALUES ('38', '70a91b1fdd054b228c039f1b884629f7', '3', '猕猴桃', '../ttsx_pics/4.jpg', '80.00', '1');
INSERT INTO detailinfo VALUES ('39', '4461586923734af4b688be5e101c1fd4', '3', '猕猴桃', '../ttsx_pics/4.jpg', '80.00', '1');
INSERT INTO detailinfo VALUES ('40', 'cb22567e2c9a4e78a3e5b48d97854821', '4', '柠檬', '../ttsx_pics/5.jpg', '100.00', '1');
INSERT INTO detailinfo VALUES ('41', '7d00ed4d4470475884479606a3bc4722', '2', '葡萄', '../ttsx_pics/3.jpg', '89.00', '1');
INSERT INTO detailinfo VALUES ('42', '7d00ed4d4470475884479606a3bc4722', '1', '草莓', '../ttsx_pics/2.jpg', '99.00', '1');
INSERT INTO detailinfo VALUES ('43', 'b0a28c733e1f408e8e37d782db260c77', '3', '猕猴桃', '../ttsx_pics/4.jpg', '80.00', '1');
INSERT INTO detailinfo VALUES ('44', '20976bf27291468a99e135c186c34c47', '3', '猕猴桃', '../ttsx_pics/4.jpg', '80.00', '1');
INSERT INTO detailinfo VALUES ('45', '0d834222909c445ba0f150c98939a4bc', '2', '葡萄', '../ttsx_pics/3.jpg', '89.00', '1');
INSERT INTO detailinfo VALUES ('46', '92a43f0f753e4be8957fcce0af111e10', '7', '香菜', '../ttsx_pics/24.jpg', '99.00', '1');
INSERT INTO detailinfo VALUES ('47', '829108a85e7b4c6a89187a29e19f7bca', '4', '柠檬', '../ttsx_pics/5.jpg', '100.00', '1');
INSERT INTO detailinfo VALUES ('48', '5b93fa0a8f4e495997f0ae54f974df4b', '2', '葡萄', '../ttsx_pics/3.jpg', '89.00', '5');
INSERT INTO detailinfo VALUES ('49', '5b93fa0a8f4e495997f0ae54f974df4b', '1', '草莓', '../ttsx_pics/2.jpg', '99.00', '1');
INSERT INTO detailinfo VALUES ('50', '11d9b0dbd7ab4fc6be87fca21849fb26', '4', '柠檬', '../ttsx_pics/5.jpg', '100.00', '1');

-- ----------------------------
-- Table structure for `goodsinfo`
-- ----------------------------
DROP TABLE IF EXISTS `goodsinfo`;
CREATE TABLE `goodsinfo` (
  `gid` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品编号',
  `tid` int(11) NOT NULL COMMENT '商品类型',
  `sid` int(11) DEFAULT NULL COMMENT '所属店铺',
  `gname` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '商品名称',
  `pics` varchar(200) COLLATE utf8_bin NOT NULL COMMENT '商品图片',
  `dintro` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '商品详细',
  `intro` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '商品简介',
  `price` decimal(10,2) NOT NULL COMMENT '原价',
  `inventory` int(100) NOT NULL COMMENT '库存',
  `volume` int(100) NOT NULL COMMENT '销量',
  `status` int(2) NOT NULL COMMENT '0 封禁    1在架  2下架',
  PRIMARY KEY (`gid`),
  KEY `FK_goodsinfo_sid` (`sid`),
  CONSTRAINT `FK_goodsinfo_sid` FOREIGN KEY (`sid`) REFERENCES `shopinfo` (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of goodsinfo
-- ----------------------------
INSERT INTO goodsinfo VALUES ('1', '1', '1', '草莓', '../ttsx_pics/2.jpg;../ttsx_pics/2.jpg;../ttsx_pics/2.jpg;', '我是商品详情', '新鲜', '77.00', '20', '8', '1');
INSERT INTO goodsinfo VALUES ('2', '1', '1', '葡萄', '../ttsx_pics/3.jpg', '详情', '简介', '89.00', '82', '73', '1');
INSERT INTO goodsinfo VALUES ('3', '1', '2', '猕猴桃', '../ttsx_pics/4.jpg', '详细', '简介', '80.00', '84', '20', '1');
INSERT INTO goodsinfo VALUES ('4', '1', '8', '柠檬', '../ttsx_pics/5.jpg', '很好', '很好', '100.00', '13', '10', '1');
INSERT INTO goodsinfo VALUES ('5', '2', '1', '大白菜', '../ttsx_pics/22.jpg', '我是商品详情', '新鲜', '99.00', '9', '3', '1');
INSERT INTO goodsinfo VALUES ('6', '2', '5', '芹菜', '../ttsx_pics/23.jpg', '我是商品详情', '新鲜', '99.00', '10', '2', '1');
INSERT INTO goodsinfo VALUES ('7', '2', '6', '香菜', '../ttsx_pics/24.jpg', '我是商品详情', '新鲜', '99.00', '9', '3', '1');
INSERT INTO goodsinfo VALUES ('8', '2', '3', '辣椒', '../ttsx_pics/25.jpg', '我是商品详情', '新鲜', '99.00', '10', '2', '1');
INSERT INTO goodsinfo VALUES ('9', '3', '2', '大虾', '../ttsx_pics/7.jpg', '我是商品详情', '新鲜', '99.00', '10', '2', '1');
INSERT INTO goodsinfo VALUES ('10', '3', '1', '鱼', '../ttsx_pics/8.jpg', '我是商品详情', '新鲜', '99.00', '10', '2', '1');
INSERT INTO goodsinfo VALUES ('11', '3', '4', '贝壳', '../ttsx_pics/9.jpg', '我是商品详情', '新鲜', '99.00', '10', '2', '1');
INSERT INTO goodsinfo VALUES ('12', '3', '1', '虾仁', '../ttsx_pics/10.jpg', '我是商品详情', '新鲜', '99.00', '10', '2', '1');
INSERT INTO goodsinfo VALUES ('13', '4', '7', '五花肉', '../ttsx_pics/12.jpg', '我是商品详情', '新鲜', '99.00', '9', '3', '1');
INSERT INTO goodsinfo VALUES ('14', '4', '1', '鸡腿', '../ttsx_pics/13.jpg', '我是商品详情', '新鲜', '99.00', '10', '2', '1');
INSERT INTO goodsinfo VALUES ('15', '4', '8', '牛肉', '../ttsx_pics/14.jpg', '我是商品详情', '新鲜', '99.00', '10', '2', '1');
INSERT INTO goodsinfo VALUES ('16', '4', '1', '羊肉', '../ttsx_pics/15.png', '我是商品详情', '新鲜', '99.00', '9', '13', '1');
INSERT INTO goodsinfo VALUES ('17', '5', '3', '鸡蛋', '../ttsx_pics/17.jpg', '我是商品详情', '新鲜', '99.00', '10', '2', '1');
INSERT INTO goodsinfo VALUES ('18', '5', '8', '咸鸭蛋', '../ttsx_pics/18.jpg;', '我是商品详情', '新鲜', '99.00', '10', '2', '1');
INSERT INTO goodsinfo VALUES ('19', '5', '5', '鹌鹑蛋', '../ttsx_pics/19.jpg;', '我是商品详情', '新鲜', '99.00', '8', '4', '1');
INSERT INTO goodsinfo VALUES ('20', '5', '2', '鹅蛋', '../ttsx_pics/20.png;', '我是商品详情', '新鲜', '99.00', '10', '2', '1');
INSERT INTO goodsinfo VALUES ('21', '6', '3', '鱼丸', '../ttsx_pics/27.jpg;', '我是商品详情', '新鲜', '99.00', '10', '2', '1');
INSERT INTO goodsinfo VALUES ('22', '6', '4', '蟹棒', '../ttsx_pics/28.jpg;', '我是商品详情', '新鲜', '99.00', '9', '3', '1');
INSERT INTO goodsinfo VALUES ('23', '6', '3', '虾丸', '../ttsx_pics/29.jpg;', '我是商品详情', '新鲜', '99.00', '10', '2', '1');
INSERT INTO goodsinfo VALUES ('24', '6', '5', '虾饺', '../ttsx_pics/30.jpg;', '我是商品详情', '新鲜', '99.00', '10', '2', '1');
INSERT INTO goodsinfo VALUES ('25', '6', '5', '淘宝', '../ttsx_pics/29.jpg;', null, null, '13.00', '13', '23', '1');

-- ----------------------------
-- Table structure for `memberinfo`
-- ----------------------------
DROP TABLE IF EXISTS `memberinfo`;
CREATE TABLE `memberinfo` (
  `mid` int(11) NOT NULL AUTO_INCREMENT COMMENT '会员编号',
  `nickName` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '昵称',
  `pwd` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '密码',
  `tel` varchar(15) COLLATE utf8_bin DEFAULT NULL COMMENT '联系方式',
  `email` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '注册邮箱',
  `photo` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '图像',
  `status` int(2) DEFAULT NULL COMMENT '状态(1正常 0封禁  )',
  `sf` int(2) NOT NULL COMMENT '(1 会员  2是商家  )',
  PRIMARY KEY (`mid`),
  UNIQUE KEY `nickName` (`nickName`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `tel` (`tel`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of memberinfo
-- ----------------------------
INSERT INTO memberinfo VALUES ('11', '请问请问', '1', '1266', '1266', '../ttsx_pics/1606569402925_ep06.png', '1', '2');
INSERT INTO memberinfo VALUES ('19', '钱钱钱钱钱钱', 'e10adc3949ba59abbe56e057f20f883e', '199', '1999', '../ttsx_pics/1606556971722_ep06.png', '1', '2');
INSERT INTO memberinfo VALUES ('24', '枪齐全去', 'e10adc3949ba59abbe56e057f20f883e', '7878', '7878', '../ttsx_pics/1606556971722_ep06.png', '1', '2');
INSERT INTO memberinfo VALUES ('25', '在架', 'e10adc3949ba59abbe56e057f20f883e', '11', '111', '../ttsx_pics/1607699128620_ep05.png', '1', '1');
INSERT INTO memberinfo VALUES ('26', '呃呃呃', 'e10adc3949ba59abbe56e057f20f883e', '125', '125', '../ttsx_pics/1606556971722_ep06.png', '1', '1');
INSERT INTO memberinfo VALUES ('27', '你哈', 'e10adc3949ba59abbe56e057f20f883e', '999', '999', '../ttsx_pics/1606557515583_score.png', '1', '1');
INSERT INTO memberinfo VALUES ('29', '否付费', 'e10adc3949ba59abbe56e057f20f883e', '787878', '787878', '../ttsx_pics/1606568128600_ep02.png', '1', '1');
INSERT INTO memberinfo VALUES ('30', '酷酷酷', 'e10adc3949ba59abbe56e057f20f883e', '9989', '9989', '../ttsx_pics/1606650497978_ep03.png', '1', '1');
INSERT INTO memberinfo VALUES ('31', '12帆帆帆帆', 'e10adc3949ba59abbe56e057f20f883e', '1760848130', '17608481308@qq.com', '../ttsx_pics/1606651125742_ep12.png', '1', '1');
INSERT INTO memberinfo VALUES ('32', '我是卖家', 'e10adc3949ba59abbe56e057f20f883e', '17608481308', '999999@qq.com', null, '1', '2');
INSERT INTO memberinfo VALUES ('33', '676767', '7718c4d9cc11736f566e6bd41e965eb7', '17608481300', '906430016@qq.com', null, '1', '1');
INSERT INTO memberinfo VALUES ('35', '你好999', 'e10adc3949ba59abbe56e057f20f883e', '17608481111', '334483010@qq.com', '../ttsx_pics/1608603701570_4.jpg', '1', '1');
INSERT INTO memberinfo VALUES ('41', '胡逸恒2', 'e10adc3949ba59abbe56e057f20f883e', '17608481112', '906430@qq.com', '../ttsx_pics/1608605525206_4.jpg', '1', '1');

-- ----------------------------
-- Table structure for `orderinfo`
-- ----------------------------
DROP TABLE IF EXISTS `orderinfo`;
CREATE TABLE `orderinfo` (
  `oid` varchar(200) COLLATE utf8_bin NOT NULL COMMENT '订单编号',
  `mid` int(11) NOT NULL COMMENT '会员编号',
  `sid` int(11) NOT NULL COMMENT '店铺',
  `pid` int(11) NOT NULL COMMENT '地址编号',
  `sname` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `odate` datetime NOT NULL COMMENT '下单日期',
  `status` int(2) NOT NULL COMMENT '收货状态 0未支付 1已支付代发货  2已发货  3已收货(已完成） 4纠纷',
  `total` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '总价',
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of orderinfo
-- ----------------------------
INSERT INTO orderinfo VALUES ('0d834222909c445ba0f150c98939a4bc', '25', '1', '6', '淘宝', '2020-12-20 14:44:00', '2', '89');
INSERT INTO orderinfo VALUES ('11d9b0dbd7ab4fc6be87fca21849fb26', '41', '8', '12', '去', '2020-12-22 10:54:29', '0', '100');
INSERT INTO orderinfo VALUES ('20976bf27291468a99e135c186c34c47', '25', '2', '6', '天猫', '2020-12-20 14:42:27', '0', '80');
INSERT INTO orderinfo VALUES ('5b93fa0a8f4e495997f0ae54f974df4b', '41', '1', '12', '淘宝', '2020-12-22 10:54:28', '2', '544');
INSERT INTO orderinfo VALUES ('7d00ed4d4470475884479606a3bc4722', '25', '1', '6', '淘宝', '2020-12-20 14:36:34', '2', '188');
INSERT INTO orderinfo VALUES ('829108a85e7b4c6a89187a29e19f7bca', '25', '8', '8', '去', '2020-12-21 15:40:48', '1', '100');
INSERT INTO orderinfo VALUES ('92a43f0f753e4be8957fcce0af111e10', '25', '6', '8', '11', '2020-12-21 15:40:48', '0', '99');
INSERT INTO orderinfo VALUES ('b0a28c733e1f408e8e37d782db260c77', '25', '2', '6', '天猫', '2020-12-20 14:36:35', '0', '80');

-- ----------------------------
-- Table structure for `placeinfo`
-- ----------------------------
DROP TABLE IF EXISTS `placeinfo`;
CREATE TABLE `placeinfo` (
  `pid` int(11) NOT NULL AUTO_INCREMENT COMMENT '地址编号',
  `pname` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '收件人',
  `mid` int(11) NOT NULL COMMENT '会员编号',
  `tel` varchar(15) COLLATE utf8_bin NOT NULL COMMENT '电话',
  `province` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '省份',
  `city` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '城市',
  `area` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '地区',
  `addr` varchar(200) COLLATE utf8_bin NOT NULL COMMENT '详细地址',
  `status` int(2) NOT NULL COMMENT ' 1  普通  2默认',
  PRIMARY KEY (`pid`),
  KEY `FK_memberinfo_mid` (`mid`),
  CONSTRAINT `FK_memberinfo_mid` FOREIGN KEY (`mid`) REFERENCES `memberinfo` (`mid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of placeinfo
-- ----------------------------
INSERT INTO placeinfo VALUES ('5', '谭桂荣', '25', '17608481307', '湖南省', '衡阳市', '蒸湘区', '湖南交通工程学院', '1');
INSERT INTO placeinfo VALUES ('6', '刘杰', '25', '17608481308', '湖南省', '娄底市', '娄星区', '建设局', '2');
INSERT INTO placeinfo VALUES ('8', '胡逸恒', '25', '17608481309', '福建省', '厦门市', '海沧区', '逸恒科技股份有限公司', '1');
INSERT INTO placeinfo VALUES ('9', '谭桂荣', '25', '17608481307', '湖北省', '咸宁市', '赤壁市', '湖南交通工程学院', '1');
INSERT INTO placeinfo VALUES ('10', '1', '25', '17608481111', '浙江省', '宁波市', '江东区', '1', '1');
INSERT INTO placeinfo VALUES ('11', '胡逸恒', '35', '17608481308', '湖南省', '衡阳市', '蒸湘区', '湖南交通工程学院', '2');
INSERT INTO placeinfo VALUES ('12', '胡66', '41', '17608481308', '湖南省', '衡阳市', '蒸湘区', '湖南交通工程学院', '2');
INSERT INTO placeinfo VALUES ('13', '1', '41', '17608481111', '北京市', '县', '延庆县', '1', '1');

-- ----------------------------
-- Table structure for `shopinfo`
-- ----------------------------
DROP TABLE IF EXISTS `shopinfo`;
CREATE TABLE `shopinfo` (
  `sid` int(11) NOT NULL AUTO_INCREMENT COMMENT '店铺编号',
  `mid` int(11) DEFAULT NULL COMMENT '卖家编号',
  `sname` varchar(200) COLLATE utf8_bin NOT NULL COMMENT '店铺名称',
  `intro` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '店铺简介',
  `pics` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '店铺图片',
  `tel` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '联系方式',
  `license` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '营业执照',
  `regDate` datetime DEFAULT NULL COMMENT '注册日期',
  `status` int(2) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of shopinfo
-- ----------------------------
INSERT INTO shopinfo VALUES ('1', '32', '淘宝', '../ttsx_pics/1606556971722_ep06.png', '../ttsx_pics/1606556971722_ep06.png', '121', '../ttsx_pics/1606556971722_ep06.png', '2020-11-30 00:00:00', '1');
INSERT INTO shopinfo VALUES ('2', '27', '天猫', '../ttsx_pics/1606556971722_ep06.png', '../ttsx_pics/1606556971722_ep06.png', '2', '../ttsx_pics/1606556971722_ep06.png', null, '1');
INSERT INTO shopinfo VALUES ('3', '27', '嗡嗡嗡在', '../ttsx_pics/1607089641702_ep01.png', '../ttsx_pics/1607089641703_ep02.png', '171111', '../ttsx_pics/1606997137871_bg1.jpg', '2020-12-03 20:05:37', '1');
INSERT INTO shopinfo VALUES ('4', '27', '12121', '../ttsx_pics/1606556971722_ep06.png', '../ttsx_pics/1606997467398_ep01.png;../ttsx_pics/1606997467399_ep02.png', '学习学', '../ttsx_pics/1606997467400_bg3.jpg', '2020-12-03 20:11:07', '1');
INSERT INTO shopinfo VALUES ('5', '27', '源辰', '../ttsx_pics/1606556971722_ep06.png', '../ttsx_pics/1606998133538_ep01.png;../ttsx_pics/1606998133541_ep02.png', '999', '../ttsx_pics/1606998133602_bg2.jpg', '2020-12-03 20:22:13', '1');
INSERT INTO shopinfo VALUES ('6', '27', '11', '11', '../ttsx_pics/1606998217007_ep02.png', '11', '../ttsx_pics/1606998217008_bg4.jpg', '2020-12-03 20:23:37', '1');
INSERT INTO shopinfo VALUES ('7', '27', '在这种', '谢谢谢谢', '../ttsx_pics/1606998239157_ep02.png', '啊实打实的', '../ttsx_pics/1606998239157_bg5.jpg', '2020-12-03 20:23:59', '1');
INSERT INTO shopinfo VALUES ('8', '27', '去', 'z', '../ttsx_pics/1606998524764_ep02.png', '1', '../ttsx_pics/1606998524765_bg4.jpg', '2020-12-03 20:28:44', '1');
INSERT INTO shopinfo VALUES ('9', '27', '都可以', '../ttsx_pics/1607087802653_ep05.png;../ttsx_pics/1607087802653_ep02.png;../ttsx_pics/1607087802679_ep01.png;../ttsx_pics/1607087802679_ep06.png', '../ttsx_pics/1607087802687_fire.png', '5555', '../ttsx_pics/1607087802688_bg5.jpg', '2020-12-04 21:16:42', '1');

-- ----------------------------
-- Table structure for `typeinfo`
-- ----------------------------
DROP TABLE IF EXISTS `typeinfo`;
CREATE TABLE `typeinfo` (
  `tid` int(5) NOT NULL AUTO_INCREMENT COMMENT '商品类型编号',
  `tname` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '类型名称',
  `status` int(2) DEFAULT NULL COMMENT '类型状态',
  PRIMARY KEY (`tid`),
  UNIQUE KEY `tname` (`tname`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of typeinfo
-- ----------------------------
INSERT INTO typeinfo VALUES ('1', '水果', '1');
INSERT INTO typeinfo VALUES ('2', '蔬菜', '1');
INSERT INTO typeinfo VALUES ('3', '海鲜水厂', '1');
INSERT INTO typeinfo VALUES ('4', '猪牛羊肉', '1');
INSERT INTO typeinfo VALUES ('5', '蛋类', '1');
INSERT INTO typeinfo VALUES ('6', '速冻食品', '1');
