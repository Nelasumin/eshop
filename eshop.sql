/*
MySQL Data Transfer
Source Host: localhost
Source Database: eshop
Target Host: localhost
Target Database: eshop
Date: 2017/6/30 15:47:31
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for t_category
-- ----------------------------
DROP TABLE IF EXISTS `t_category`;
CREATE TABLE `t_category` (
  `cate_id` int(11) NOT NULL AUTO_INCREMENT,
  `cate_name` varchar(100) NOT NULL,
  `cate_pic` varchar(50) DEFAULT NULL,
  `parentid` int(11) DEFAULT NULL,
  `cate_desc` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`cate_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_goods
-- ----------------------------
DROP TABLE IF EXISTS `t_goods`;
CREATE TABLE `t_goods` (
  `goods_id` int(11) NOT NULL AUTO_INCREMENT,
  `cate_id` int(11) NOT NULL,
  `goods_name` varchar(50) NOT NULL,
  `goods_disc` text NOT NULL,
  `goods_price` float NOT NULL,
  `goods_discount` float DEFAULT NULL,
  `goods_stock` int(11) NOT NULL,
  `goods_origin` varchar(50) DEFAULT NULL,
  `goods_material` varchar(200) DEFAULT NULL,
  `goods_postalfee` float DEFAULT NULL,
  `goods_date` date DEFAULT NULL,
  `goods_sales` int(11) DEFAULT NULL,
  `goods_pic` varchar(50) DEFAULT NULL,
  `istoday` tinyint(1) DEFAULT '0' COMMENT '是否为今日推荐商品，1：是  0：否',
  PRIMARY KEY (`goods_id`),
  KEY `cate_id` (`cate_id`),
  CONSTRAINT `cate_id` FOREIGN KEY (`cate_id`) REFERENCES `t_category` (`cate_id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_goodsdetail
-- ----------------------------
DROP TABLE IF EXISTS `t_goodsdetail`;
CREATE TABLE `t_goodsdetail` (
  `content_id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL DEFAULT '0',
  `content` varchar(100) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`content_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_goodsdetailtype
-- ----------------------------
DROP TABLE IF EXISTS `t_goodsdetailtype`;
CREATE TABLE `t_goodsdetailtype` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_pic
-- ----------------------------
DROP TABLE IF EXISTS `t_pic`;
CREATE TABLE `t_pic` (
  `pic_id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL,
  `pic_url` varchar(50) NOT NULL,
  PRIMARY KEY (`pic_id`),
  KEY `go_id` (`goods_id`),
  CONSTRAINT `go_id` FOREIGN KEY (`goods_id`) REFERENCES `t_goods` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(20) DEFAULT NULL,
  `user_pass` varchar(20) DEFAULT NULL,
  `user_age` tinyint(20) DEFAULT NULL,
  `user_sex` tinyint(4) DEFAULT NULL,
  `user_email` varchar(50) DEFAULT NULL,
  `user_rank` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_name` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `t_category` VALUES ('1', '女装', '/images/cate/1.png', '16', null);
INSERT INTO `t_category` VALUES ('2', '男装', '/images/cate/2.png', '16', null);
INSERT INTO `t_category` VALUES ('3', '女士内衣', '/images/cate/3.png', '16', null);
INSERT INTO `t_category` VALUES ('4', '男士内衣', '/images/cate/4.png', '16', null);
INSERT INTO `t_category` VALUES ('5', '女鞋', '/images/cate/5.png', '17', null);
INSERT INTO `t_category` VALUES ('6', '男鞋', '/images/cate/6.png', '17', null);
INSERT INTO `t_category` VALUES ('7', '孕妇装', '/images/cate/7.png', '16', null);
INSERT INTO `t_category` VALUES ('8', '儿童装', '/images/cate/8.png', '16', null);
INSERT INTO `t_category` VALUES ('9', '婴幼儿装', '/images/cate/9.png', '16', null);
INSERT INTO `t_category` VALUES ('10', '配饰', '/images/cate/10.png', '16', null);
INSERT INTO `t_category` VALUES ('11', '箱包', '/images/cate/11.png', '17', null);
INSERT INTO `t_category` VALUES ('13', '食品', '/images/cate/1454665448253.jpg', null, '来来来，吃吃吃！');
INSERT INTO `t_category` VALUES ('15', '坚果', '/images/cate/1454722861160.jpg', '13', '');
INSERT INTO `t_category` VALUES ('16', '服装', '/images/cate/1.png', null, '穿的美美的，找回自信的你！');
INSERT INTO `t_category` VALUES ('17', '箱包靴鞋', '/images/cate/1.png', null, '有我陪伴，走遍天下。');
INSERT INTO `t_category` VALUES ('18', '甜点', '/images/cate/10.png', '13', '');
INSERT INTO `t_category` VALUES ('19', '海味', '/images/cate/10.png', '13', '');
INSERT INTO `t_goods` VALUES ('1', '1', '女装 军旅式短茄克1', '施有强水洗加工的军旅式外套。富有张力的面料，洋溢着十足的军旅气息。带盖口袋的金属圆形纽扣、兜帽口的锯齿形压线，彰显经典的军旅外套细节。大兜帽的样式，能适度修饰脸型。短款的设计，可与宽腿裤等宽松的下装搭配打造具有平衡感的造型。', '399', '233', '0', '上海', '棉56% 聚酯纤维30%', '12', '2016-01-01', '30', '/images/goods/tj_1.jpg', '1');
INSERT INTO `t_goods` VALUES ('2', '1', '女装 军旅式短茄克2', '施有强水洗加工的军旅式外套。富有张力的面料，洋溢着十足的军旅气息。带盖口袋的金属圆形纽扣、兜帽口的锯齿形压线，彰显经典的军旅外套细节。大兜帽的样式，能适度修饰脸型。短款的设计，可与宽腿裤等宽松的下装搭配打造具有平衡感的造型。', '399', '243', '0', '上海', '棉56% 聚酯纤维30%', '10', '2016-01-29', '100', '/images/goods/1_2.png', '0');
INSERT INTO `t_goods` VALUES ('3', '1', '女装 军旅式短茄克3', '施有强水洗加工的军旅式外套。富有张力的面料，洋溢着十足的军旅气息。带盖口袋的金属圆形纽扣、兜帽口的锯齿形压线，彰显经典的军旅外套细节。大兜帽的样式，能适度修饰脸型。短款的设计，可与宽腿裤等宽松的下装搭配打造具有平衡感的造型。', '399', '32', '0', '上海', '棉56% 聚酯纤维30%', '12', '2016-01-30', '80', '/images/goods/tj_3.png', '1');
INSERT INTO `t_goods` VALUES ('4', '1', '女装 军旅式短茄克4', '施有强水洗加工的军旅式外套。富有张力的面料，洋溢着十足的军旅气息。带盖口袋的金属圆形纽扣、兜帽口的锯齿形压线，彰显经典的军旅外套细节。大兜帽的样式，能适度修饰脸型。短款的设计，可与宽腿裤等宽松的下装搭配打造具有平衡感的造型。', '399', '235', '0', '上海', '棉56% 聚酯纤维30%', '12', '2016-01-30', '2', '/images/goods/1_1.jpg', '0');
INSERT INTO `t_goods` VALUES ('5', '5', '女装 军旅式短茄克5', '施有强水洗加工的军旅式外套。富有张力的面料，洋溢着十足的军旅气息。带盖口袋的金属圆形纽扣、兜帽口的锯齿形压线，彰显经典的军旅外套细节。大兜帽的样式，能适度修饰脸型。短款的设计，可与宽腿裤等宽松的下装搭配打造具有平衡感的造型。', '399', '233', '0', '上海', '棉56% 聚酯纤维30%', '12', '2016-01-30', '0', '/images/goods/tj_5.png', '1');
INSERT INTO `t_goods` VALUES ('6', '1', '女装 军旅式短茄克6', '施有强水洗加工的军旅式外套。富有张力的面料，洋溢着十足的军旅气息。带盖口袋的金属圆形纽扣、兜帽口的锯齿形压线，彰显经典的军旅外套细节。大兜帽的样式，能适度修饰脸型。短款的设计，可与宽腿裤等宽松的下装搭配打造具有平衡感的造型。', '399', '122', '0', '上海', '棉56% 聚酯纤维30%', '12', '2016-01-30', '0', '/images/goods/1_3.png', '0');
INSERT INTO `t_goods` VALUES ('7', '1', '女装 军旅式短茄克7', '施有强水洗加工的军旅式外套。富有张力的面料，洋溢着十足的军旅气息。带盖口袋的金属圆形纽扣、兜帽口的锯齿形压线，彰显经典的军旅外套细节。大兜帽的样式，能适度修饰脸型。短款的设计，可与宽腿裤等宽松的下装搭配打造具有平衡感的造型。', '399', '134', '0', '上海', '棉56% 聚酯纤维30%', '12', '2016-01-30', '0', '/images/goods/1_1.jpg', '0');
INSERT INTO `t_goods` VALUES ('8', '1', '女装 军旅式短茄克8', '施有强水洗加工的军旅式外套。富有张力的面料，洋溢着十足的军旅气息。带盖口袋的金属圆形纽扣、兜帽口的锯齿形压线，彰显经典的军旅外套细节。大兜帽的样式，能适度修饰脸型。短款的设计，可与宽腿裤等宽松的下装搭配打造具有平衡感的造型。', '399', '134', '0', '上海', '棉56% 聚酯纤维30%', '12', '2016-01-30', '0', '/images/goods/1_2.png', '0');
INSERT INTO `t_goods` VALUES ('9', '1', '女装 军旅式短茄克9', '施有强水洗加工的军旅式外套。富有张力的面料，洋溢着十足的军旅气息。带盖口袋的金属圆形纽扣、兜帽口的锯齿形压线，彰显经典的军旅外套细节。大兜帽的样式，能适度修饰脸型。短款的设计，可与宽腿裤等宽松的下装搭配打造具有平衡感的造型。', '399', '177', '0', '上海', '棉56% 聚酯纤维30%', '12', '2016-01-30', '0', '/images/goods/1_3.png', '0');
INSERT INTO `t_goods` VALUES ('10', '1', '女装 军旅式短茄克10', '施有强水洗加工的军旅式外套。富有张力的面料，洋溢着十足的军旅气息。带盖口袋的金属圆形纽扣、兜帽口的锯齿形压线，彰显经典的军旅外套细节。大兜帽的样式，能适度修饰脸型。短款的设计，可与宽腿裤等宽松的下装搭配打造具有平衡感的造型。', '399', '177', '0', '上海', '棉56% 聚酯纤维30%', '12', '2016-01-30', '0', '/images/goods/1_3.png', '0');
INSERT INTO `t_goods` VALUES ('11', '1', '女装 军旅式短茄克11', '施有强水洗加工的军旅式外套。富有张力的面料，洋溢着十足的军旅气息。带盖口袋的金属圆形纽扣、兜帽口的锯齿形压线，彰显经典的军旅外套细节。大兜帽的样式，能适度修饰脸型。短款的设计，可与宽腿裤等宽松的下装搭配打造具有平衡感的造型。', '399', '177', '0', '上海', '棉56% 聚酯纤维30%', '12', '2016-01-30', '0', '/images/goods/1_1.jpg', '0');
INSERT INTO `t_goods` VALUES ('12', '1', '女装 军旅式短茄克12', '施有强水洗加工的军旅式外套。富有张力的面料，洋溢着十足的军旅气息。带盖口袋的金属圆形纽扣、兜帽口的锯齿形压线，彰显经典的军旅外套细节。大兜帽的样式，能适度修饰脸型。短款的设计，可与宽腿裤等宽松的下装搭配打造具有平衡感的造型。', '399', '177', '0', '上海', '棉56% 聚酯纤维30%', '12', '2016-01-30', '0', '/images/goods/1_1.jpg', '0');
INSERT INTO `t_goods` VALUES ('13', '1', '女装 军旅式短茄克13', '施有强水洗加工的军旅式外套。富有张力的面料，洋溢着十足的军旅气息。带盖口袋的金属圆形纽扣、兜帽口的锯齿形压线，彰显经典的军旅外套细节。大兜帽的样式，能适度修饰脸型。短款的设计，可与宽腿裤等宽松的下装搭配打造具有平衡感的造型。', '200', '177', '0', '上海', '棉56% 聚酯纤维30%', '12', '2016-01-30', '0', '/images/goods/1_1.jpg', '0');
INSERT INTO `t_goods` VALUES ('14', '1', '女装 军旅式短茄克14', '施有强水洗加工的军旅式外套。富有张力的面料，洋溢着十足的军旅气息。带盖口袋的金属圆形纽扣、兜帽口的锯齿形压线，彰显经典的军旅外套细节。大兜帽的样式，能适度修饰脸型。短款的设计，可与宽腿裤等宽松的下装搭配打造具有平衡感的造型。', '199', '177', '0', '上海', '棉56% 聚酯纤维30%', '12', '2016-01-30', '0', '/images/goods/1_2.png', '0');
INSERT INTO `t_goods` VALUES ('15', '1', '女装 军旅式短茄克15', '施有强水洗加工的军旅式外套。富有张力的面料，洋溢着十足的军旅气息。带盖口袋的金属圆形纽扣、兜帽口的锯齿形压线，彰显经典的军旅外套细节。大兜帽的样式，能适度修饰脸型。短款的设计，可与宽腿裤等宽松的下装搭配打造具有平衡感的造型。', '222', '133', '0', '上海', '棉56% 聚酯纤维30%', '12', '2016-01-30', '0', '/images/goods/1_1.jpg', '0');
INSERT INTO `t_goods` VALUES ('16', '1', '女装 军旅式短茄克16', '施有强水洗加工的军旅式外套。富有张力的面料，洋溢着十足的军旅气息。带盖口袋的金属圆形纽扣、兜帽口的锯齿形压线，彰显经典的军旅外套细节。大兜帽的样式，能适度修饰脸型。短款的设计，可与宽腿裤等宽松的下装搭配打造具有平衡感的造型。', '355', '211', '0', '上海', '棉56% 聚酯纤维30%', '12', '2016-01-30', '0', '/images/goods/1_1.jpg', '0');
INSERT INTO `t_goods` VALUES ('17', '1', '女装 军旅式短茄克17', '施有强水洗加工的军旅式外套。富有张力的面料，洋溢着十足的军旅气息。带盖口袋的金属圆形纽扣、兜帽口的锯齿形压线，彰显经典的军旅外套细节。大兜帽的样式，能适度修饰脸型。短款的设计，可与宽腿裤等宽松的下装搭配打造具有平衡感的造型。', '123', '23', '0', '上海', '棉56% 聚酯纤维30%', '12', '2016-01-30', '0', '/images/goods/1_3.png', '0');
INSERT INTO `t_goods` VALUES ('18', '6', '女装 军旅式短茄克18', '施有强水洗加工的军旅式外套。富有张力的面料，洋溢着十足的军旅气息。带盖口袋的金属圆形纽扣、兜帽口的锯齿形压线，彰显经典的军旅外套细节。大兜帽的样式，能适度修饰脸型。短款的设计，可与宽腿裤等宽松的下装搭配打造具有平衡感的造型。', '35', '17', '0', '上海', '棉56% 聚酯纤维30%', '12', '2016-01-28', '0', '/images/goods/5.png', '0');
INSERT INTO `t_goods` VALUES ('19', '6', '女装 军旅式短茄克19', '施有强水洗加工的军旅式外套。富有张力的面料，洋溢着十足的军旅气息。带盖口袋的金属圆形纽扣、兜帽口的锯齿形压线，彰显经典的军旅外套细节。大兜帽的样式，能适度修饰脸型。短款的设计，可与宽腿裤等宽松的下装搭配打造具有平衡感的造型。', '68', '23', '0', '上海', '棉56% 聚酯纤维30%', '12', '2016-01-28', '0', '/images/goods/6.png', '0');
INSERT INTO `t_goods` VALUES ('20', '5', '女装 军旅式短茄克20', '施有强水洗加工的军旅式外套。富有张力的面料，洋溢着十足的军旅气息。带盖口袋的金属圆形纽扣、兜帽口的锯齿形压线，彰显经典的军旅外套细节。大兜帽的样式，能适度修饰脸型。短款的设计，可与宽腿裤等宽松的下装搭配打造具有平衡感的造型。', '399', '177', '0', '上海', '棉56% 聚酯纤维30%', '12', '2016-01-28', '0', '/images/goods/5.png', '0');
INSERT INTO `t_goods` VALUES ('21', '5', '女装 军旅式短茄克21', '施有强水洗加工的军旅式外套。富有张力的面料，洋溢着十足的军旅气息。带盖口袋的金属圆形纽扣、兜帽口的锯齿形压线，彰显经典的军旅外套细节。大兜帽的样式，能适度修饰脸型。短款的设计，可与宽腿裤等宽松的下装搭配打造具有平衡感的造型。', '399', '177', '0', '上海', '棉56% 聚酯纤维30%', '12', '2016-01-28', '0', '/images/goods/6.png', '0');
INSERT INTO `t_goods` VALUES ('22', '11', '男装 军旅式短茄克22', '施有强水洗加工的军旅式外套。富有张力的面料，洋溢着十足的军旅气息。带盖口袋的金属圆形纽扣、兜帽口的锯齿形压线，彰显经典的军旅外套细节。大兜帽的样式，能适度修饰脸型。短款的设计，可与宽腿裤等宽松的下装搭配打造具有平衡感的造型。', '399', '177', '0', '上海', '棉56% 聚酯纤维30%', '12', '2016-01-28', '0', '/images/goods/11.png', '0');
INSERT INTO `t_goods` VALUES ('23', '2', '男装 军旅式短茄克23', '施有强水洗加工的军旅式外套。富有张力的面料，洋溢着十足的军旅气息。带盖口袋的金属圆形纽扣、兜帽口的锯齿形压线，彰显经典的军旅外套细节。大兜帽的样式，能适度修饰脸型。短款的设计，可与宽腿裤等宽松的下装搭配打造具有平衡感的造型。', '233', '177', '0', '上海', '棉56% 聚酯纤维30%', '12', '2016-01-28', '0', '/images/goods/1_1.jpg', '0');
INSERT INTO `t_goods` VALUES ('24', '2', '男装 军旅式短茄克24', '施有强水洗加工的军旅式外套。富有张力的面料，洋溢着十足的军旅气息。带盖口袋的金属圆形纽扣、兜帽口的锯齿形压线，彰显经典的军旅外套细节。大兜帽的样式，能适度修饰脸型。短款的设计，可与宽腿裤等宽松的下装搭配打造具有平衡感的造型。', '399', '177', '0', '上海', '棉56% 聚酯纤维30%', '12', '2016-01-28', '0', '/images/goods/1_1.jpg', '0');
INSERT INTO `t_goods` VALUES ('25', '2', '男装 军旅式短茄克25', '施有强水洗加工的军旅式外套。富有张力的面料，洋溢着十足的军旅气息。带盖口袋的金属圆形纽扣、兜帽口的锯齿形压线，彰显经典的军旅外套细节。大兜帽的样式，能适度修饰脸型。短款的设计，可与宽腿裤等宽松的下装搭配打造具有平衡感的造型。', '399', '177', '0', '上海', '棉56% 聚酯纤维30%', '12', '2016-01-28', '0', '/images/goods/1_1.jpg', '0');
INSERT INTO `t_goods` VALUES ('26', '2', '男装 军旅式短茄克26', '施有强水洗加工的军旅式外套。富有张力的面料，洋溢着十足的军旅气息。带盖口袋的金属圆形纽扣、兜帽口的锯齿形压线，彰显经典的军旅外套细节。大兜帽的样式，能适度修饰脸型。短款的设计，可与宽腿裤等宽松的下装搭配打造具有平衡感的造型。', '399', '177', '0', '上海', '棉56% 聚酯纤维30%', '12', '2016-01-28', '0', '/images/goods/1_2.png', '0');
INSERT INTO `t_goods` VALUES ('27', '2', '男装 军旅式短茄克27', '施有强水洗加工的军旅式外套。富有张力的面料，洋溢着十足的军旅气息。带盖口袋的金属圆形纽扣、兜帽口的锯齿形压线，彰显经典的军旅外套细节。大兜帽的样式，能适度修饰脸型。短款的设计，可与宽腿裤等宽松的下装搭配打造具有平衡感的造型。', '399', '177', '0', '上海', '棉56% 聚酯纤维30%', '12', '2016-01-28', '0', '/images/goods/1_2.png', '0');
INSERT INTO `t_goods` VALUES ('28', '2', '男装 军旅式短茄克28', '施有强水洗加工的军旅式外套。富有张力的面料，洋溢着十足的军旅气息。带盖口袋的金属圆形纽扣、兜帽口的锯齿形压线，彰显经典的军旅外套细节。大兜帽的样式，能适度修饰脸型。短款的设计，可与宽腿裤等宽松的下装搭配打造具有平衡感的造型。', '399', '177', '0', '上海', '棉56% 聚酯纤维30%', '12', '2016-01-28', '0', '/images/goods/1_3.png', '0');
INSERT INTO `t_goods` VALUES ('29', '2', '男装 军旅式短茄克29', '施有强水洗加工的军旅式外套。富有张力的面料，洋溢着十足的军旅气息。带盖口袋的金属圆形纽扣、兜帽口的锯齿形压线，彰显经典的军旅外套细节。大兜帽的样式，能适度修饰脸型。短款的设计，可与宽腿裤等宽松的下装搭配打造具有平衡感的造型。', '399', '177', '0', '上海', '棉56% 聚酯纤维30%', '12', '2016-01-28', '0', '/images/goods/1_3.png', '0');
INSERT INTO `t_goods` VALUES ('30', '2', '男装 军旅式短茄克30', '施有强水洗加工的军旅式外套。富有张力的面料，洋溢着十足的军旅气息。带盖口袋的金属圆形纽扣、兜帽口的锯齿形压线，彰显经典的军旅外套细节。大兜帽的样式，能适度修饰脸型。短款的设计，可与宽腿裤等宽松的下装搭配打造具有平衡感的造型。', '399', '177', '0', '上海', '棉56% 聚酯纤维30%', '12', '2016-01-28', '0', '/images/goods/1_3.png', '0');
INSERT INTO `t_goods` VALUES ('31', '2', '男装 军旅式短茄克31', '施有强水洗加工的军旅式外套。富有张力的面料，洋溢着十足的军旅气息。带盖口袋的金属圆形纽扣、兜帽口的锯齿形压线，彰显经典的军旅外套细节。大兜帽的样式，能适度修饰脸型。短款的设计，可与宽腿裤等宽松的下装搭配打造具有平衡感的造型。', '399', '177', '0', '上海', '棉56% 聚酯纤维30%', '12', '2016-01-28', '0', '/images/goods/1_2.png', '0');
INSERT INTO `t_goods` VALUES ('32', '2', '男装 军旅式短茄克32', '施有强水洗加工的军旅式外套。富有张力的面料，洋溢着十足的军旅气息。带盖口袋的金属圆形纽扣、兜帽口的锯齿形压线，彰显经典的军旅外套细节。大兜帽的样式，能适度修饰脸型。短款的设计，可与宽腿裤等宽松的下装搭配打造具有平衡感的造型。', '399', '177', '0', '上海', '棉56% 聚酯纤维30%', '12', '2016-01-28', '0', '/images/goods/1_1.jpg', '0');
INSERT INTO `t_goods` VALUES ('33', '2', '男装 军旅式短茄克33', '施有强水洗加工的军旅式外套。富有张力的面料，洋溢着十足的军旅气息。带盖口袋的金属圆形纽扣、兜帽口的锯齿形压线，彰显经典的军旅外套细节。大兜帽的样式，能适度修饰脸型。短款的设计，可与宽腿裤等宽松的下装搭配打造具有平衡感的造型。', '399', '177', '0', '上海', '棉56% 聚酯纤维30%', '12', '2016-01-28', '0', '/images/goods/1_1.jpg', '0');
INSERT INTO `t_goods` VALUES ('34', '2', '男装 军旅式短茄克34', '施有强水洗加工的军旅式外套。富有张力的面料，洋溢着十足的军旅气息。带盖口袋的金属圆形纽扣、兜帽口的锯齿形压线，彰显经典的军旅外套细节。大兜帽的样式，能适度修饰脸型。短款的设计，可与宽腿裤等宽松的下装搭配打造具有平衡感的造型。', '399', '177', '0', '上海', '棉56% 聚酯纤维30%', '12', '2016-01-28', '0', '/images/goods/1_2.png', '0');
INSERT INTO `t_goods` VALUES ('35', '15', '榛子', '美味可口', '50', '177', '0', '上海', '棉56% 聚酯纤维30%', '12', '2016-01-28', '0', '/images/goods/tj_2.jpg', '1');
INSERT INTO `t_goods` VALUES ('36', '1', '女士内衣 新型收拢运动内衣', '纯棉超聚拢运动内衣，轻便贴身，显曲线，吸汗，穿着舒适', '123', '100', '456', '北京', '纯棉', '12', '2016-01-23', '0', '/images/goods/1_1.jpg', '0');
INSERT INTO `t_goods` VALUES ('42', '19', '开口松子', '测试', '33', '222', '1557', '测试', '测试', '11', '2016-02-12', '40', '/images/goods/tj_4.png', '1');
INSERT INTO `t_goods` VALUES ('44', '15', '松子', '囤货过冬', '30', '100', '1000', '北京', '', null, '2017-06-06', '2', '/images/goods/15_1.jpg', '0');
INSERT INTO `t_goods` VALUES ('46', '15', '坚果1', '好吃', '45', '234', '1111', null, null, '12', null, '39', '/images/goods/15_1.jpg', '0');
INSERT INTO `t_goods` VALUES ('47', '15', '坚果2', '好吃！！', '30', '233', '0', '北京', null, '12', '2017-06-06', '12', '/images/goods/15_3.jpg', '0');
INSERT INTO `t_goods` VALUES ('48', '15', '坚果3', '非常好吃', '99', '1000', '0', '北京', null, '12', '2017-06-06', '10', '/images/goods/15_4.jpg', '0');
INSERT INTO `t_goodsdetail` VALUES ('1', '1', '红色', '1');
INSERT INTO `t_goodsdetail` VALUES ('2', '1', '黑色', '1');
INSERT INTO `t_goodsdetail` VALUES ('3', '1', '蓝色', '1');
INSERT INTO `t_goodsdetail` VALUES ('4', '47', '奶油', '3');
INSERT INTO `t_goodsdetail` VALUES ('5', '47', '原味', '3');
INSERT INTO `t_goodsdetail` VALUES ('6', '42', '原味', '3');
INSERT INTO `t_goodsdetail` VALUES ('7', '42', '椒盐味', '3');
INSERT INTO `t_goodsdetail` VALUES ('8', '1', '女士S', '5');
INSERT INTO `t_goodsdetail` VALUES ('9', '1', '女士M', '5');
INSERT INTO `t_goodsdetail` VALUES ('10', '1', '女士L', '5');
INSERT INTO `t_goodsdetail` VALUES ('11', '1', '女士LX', '5');
INSERT INTO `t_goodsdetailtype` VALUES ('1', '颜色');
INSERT INTO `t_goodsdetailtype` VALUES ('2', '规格');
INSERT INTO `t_goodsdetailtype` VALUES ('3', '口味');
INSERT INTO `t_goodsdetailtype` VALUES ('4', '包装');
INSERT INTO `t_goodsdetailtype` VALUES ('5', '尺寸');
INSERT INTO `t_pic` VALUES ('25', '20', '/images/goods/1_1.jpg');
INSERT INTO `t_pic` VALUES ('38', '1', '/images/goods/2_1.jpg');
INSERT INTO `t_pic` VALUES ('39', '1', '/images/goods/2_2.jpg');
INSERT INTO `t_pic` VALUES ('40', '1', '/images/goods/2_3.jpg');
INSERT INTO `t_pic` VALUES ('41', '1', '/images/goods/2_4.jpg');
INSERT INTO `t_pic` VALUES ('42', '1', '/images/goods/2_5.jpg');
INSERT INTO `t_pic` VALUES ('43', '1', '/images/goods/2_6.jpg');
INSERT INTO `t_pic` VALUES ('44', '2', '/images/goods/2_1.jpg');
INSERT INTO `t_pic` VALUES ('45', '3', '/images/goods/2_1.jpg');
INSERT INTO `t_pic` VALUES ('46', '4', '/images/goods/2_1.jpg');
INSERT INTO `t_pic` VALUES ('47', '5', '/images/goods/2_1.jpg');
INSERT INTO `t_pic` VALUES ('48', '6', '/images/goods/2_1.jpg');
INSERT INTO `t_pic` VALUES ('49', '7', '/images/goods/2_1.jpg');
INSERT INTO `t_pic` VALUES ('50', '8', '/images/goods/2_1.jpg');
INSERT INTO `t_pic` VALUES ('51', '9', '/images/goods/2_1.jpg');
INSERT INTO `t_pic` VALUES ('52', '10', '/images/goods/2_1.jpg');
INSERT INTO `t_pic` VALUES ('53', '11', '/images/goods/2_1.jpg');
INSERT INTO `t_pic` VALUES ('54', '12', '/images/goods/2_1.jpg');
INSERT INTO `t_pic` VALUES ('55', '13', '/images/goods/2_1.jpg');
INSERT INTO `t_pic` VALUES ('56', '14', '/images/goods/2_1.jpg');
INSERT INTO `t_pic` VALUES ('57', '15', '/images/goods/2_1.jpg');
INSERT INTO `t_pic` VALUES ('58', '16', '/images/goods/2_1.jpg');
INSERT INTO `t_pic` VALUES ('59', '17', '/images/goods/2_1.jpg');
INSERT INTO `t_pic` VALUES ('60', '18', '/images/goods/2_1.jpg');
INSERT INTO `t_pic` VALUES ('61', '19', '/images/goods/2_1.jpg');
INSERT INTO `t_pic` VALUES ('62', '20', '/images/goods/2_1.jpg');
INSERT INTO `t_pic` VALUES ('63', '21', '/images/goods/2_1.jpg');
INSERT INTO `t_pic` VALUES ('64', '22', '/images/goods/2_1.jpg');
INSERT INTO `t_pic` VALUES ('65', '23', '/images/goods/2_1.jpg');
INSERT INTO `t_pic` VALUES ('66', '24', '/images/goods/2_1.jpg');
INSERT INTO `t_pic` VALUES ('67', '25', '/images/goods/2_1.jpg');
INSERT INTO `t_pic` VALUES ('68', '26', '/images/goods/2_1.jpg');
INSERT INTO `t_pic` VALUES ('69', '27', '/images/goods/2_1.jpg');
INSERT INTO `t_pic` VALUES ('70', '28', '/images/goods/2_1.jpg');
INSERT INTO `t_pic` VALUES ('71', '29', '/images/goods/2_1.jpg');
INSERT INTO `t_pic` VALUES ('72', '31', '/images/goods/2_1.jpg');
INSERT INTO `t_pic` VALUES ('73', '32', '/images/goods/2_1.jpg');
INSERT INTO `t_pic` VALUES ('74', '33', '/images/goods/2_1.jpg');
INSERT INTO `t_pic` VALUES ('75', '34', '/images/goods/2_1.jpg');
INSERT INTO `t_pic` VALUES ('76', '35', '/images/goods/2_1.jpg');
INSERT INTO `t_pic` VALUES ('77', '36', '/images/goods/2_1.jpg');
INSERT INTO `t_pic` VALUES ('78', '36', '/images/goods/2_2.jpg');
INSERT INTO `t_pic` VALUES ('79', '2', '/images/goods/2_2.jpg');
INSERT INTO `t_pic` VALUES ('80', '3', '/images/goods/2_3.jpg');
INSERT INTO `t_pic` VALUES ('81', '4', '/images/goods/2_4.jpg');
INSERT INTO `t_pic` VALUES ('82', '5', '/images/goods/2_2.jpg');
INSERT INTO `t_pic` VALUES ('83', '6', '/images/goods/2_3.jpg');
INSERT INTO `t_pic` VALUES ('84', '7', '/images/goods/2_4.jpg');
INSERT INTO `t_pic` VALUES ('85', '8', '/images/goods/2_2.jpg');
INSERT INTO `t_pic` VALUES ('86', '9', '/images/goods/2_3.jpg');
INSERT INTO `t_pic` VALUES ('87', '10', '/images/goods/2_2.jpg');
INSERT INTO `t_pic` VALUES ('88', '11', '/images/goods/2_2.jpg');
INSERT INTO `t_pic` VALUES ('89', '12', '/images/goods/2_2.jpg');
INSERT INTO `t_pic` VALUES ('90', '13', '/images/goods/2_3.jpg');
INSERT INTO `t_pic` VALUES ('91', '14', '/images/goods/2_3.jpg');
INSERT INTO `t_pic` VALUES ('92', '15', '/images/goods/2_4.jpg');
INSERT INTO `t_pic` VALUES ('93', '16', '/images/goods/2_3.jpg');
INSERT INTO `t_pic` VALUES ('94', '17', '/images/goods/2_2.jpg');
INSERT INTO `t_pic` VALUES ('95', '18', '/images/goods/2_3.jpg');
INSERT INTO `t_pic` VALUES ('96', '19', '/images/goods/2_2.jpg');
INSERT INTO `t_pic` VALUES ('97', '20', '/images/goods/2_3.jpg');
INSERT INTO `t_pic` VALUES ('98', '21', '/images/goods/2_3.jpg');
INSERT INTO `t_pic` VALUES ('99', '22', '/images/goods/2_2.jpg');
INSERT INTO `t_pic` VALUES ('100', '23', '/images/goods/2_4.jpg');
INSERT INTO `t_pic` VALUES ('101', '24', '/images/goods/2_2.jpg');
INSERT INTO `t_pic` VALUES ('102', '25', '/images/goods/2_2.jpg');
INSERT INTO `t_pic` VALUES ('103', '26', '/images/goods/2_3.jpg');
INSERT INTO `t_pic` VALUES ('104', '27', '/images/goods/2_3.jpg');
INSERT INTO `t_pic` VALUES ('105', '28', '/images/goods/2_2.jpg');
INSERT INTO `t_pic` VALUES ('106', '29', '/images/goods/2_2.jpg');
INSERT INTO `t_pic` VALUES ('107', '31', '/images/goods/2_3.jpg');
INSERT INTO `t_pic` VALUES ('108', '32', '/images/goods/2_3.jpg');
INSERT INTO `t_pic` VALUES ('109', '33', '/images/goods/2_3.jpg');
INSERT INTO `t_pic` VALUES ('110', '34', '/images/goods/2_2.jpg');
INSERT INTO `t_pic` VALUES ('111', '35', '/images/goods/2_3.jpg');
INSERT INTO `t_pic` VALUES ('112', '36', '/images/goods/2_4.jpg');
INSERT INTO `t_pic` VALUES ('113', '36', '/images/goods/2_2.jpg');
INSERT INTO `t_pic` VALUES ('114', '42', '/images/goods/pics/14552392714730.jpg');
INSERT INTO `t_pic` VALUES ('115', '42', '/images/goods/pics/14552392714911.jpg');
INSERT INTO `t_user` VALUES ('1', 'user', '123', '22', '1', null, '0');
INSERT INTO `t_user` VALUES ('2', 'jiuqiyuliang', '111', '23', '0', null, '0');
INSERT INTO `t_user` VALUES ('3', 'admin@163.com', '123456', '22', '0', 'admin@163.com', '1');
INSERT INTO `t_user` VALUES ('4', 'admin', '111', '21', '1', null, '1');
INSERT INTO `t_user` VALUES ('5', '11', '11', '11', '1', null, '0');
INSERT INTO `t_user` VALUES ('6', '22', '22', '22', '1', null, '0');
INSERT INTO `t_user` VALUES ('7', '33', '33', '33', '0', null, '0');
INSERT INTO `t_user` VALUES ('8', '44', '44', '44', '1', null, '0');
INSERT INTO `t_user` VALUES ('9', '55', '55', '55', '0', null, '0');
INSERT INTO `t_user` VALUES ('10', '66', '66', '66', '1', null, '0');
INSERT INTO `t_user` VALUES ('11', '77', '77', '77', '1', null, '0');
INSERT INTO `t_user` VALUES ('12', '88', '88', '88', '1', null, '0');
INSERT INTO `t_user` VALUES ('13', '99', '99', '99', '0', null, '0');
INSERT INTO `t_user` VALUES ('14', '00', '00', '0', '0', null, '0');
INSERT INTO `t_user` VALUES ('15', 'aa', 'aa', '11', '1', null, '0');
INSERT INTO `t_user` VALUES ('16', '123', '123', '11', '0', null, '0');
INSERT INTO `t_user` VALUES ('17', '1234', '123', '111', '1', '1@1.1', '0');
INSERT INTO `t_user` VALUES ('18', '12345', '123', '111', '1', '1@1.1', '0');
INSERT INTO `t_user` VALUES ('19', '123456', '123', '111', '1', '1@1.1', '0');
INSERT INTO `t_user` VALUES ('21', 'abc', '123456', '11', '1', '2@2.2', '0');
INSERT INTO `t_user` VALUES ('22', '张三', '123', '11', '1', '1@1.1', '0');
INSERT INTO `t_user` VALUES ('23', '张三1', '123', '11', '1', '1@1.1', '0');
INSERT INTO `t_user` VALUES ('24', '张三2', '123', '11', '1', '1@1.1', '0');
INSERT INTO `t_user` VALUES ('26', 'aaa', 'aaa', '11', '1', null, '0');
INSERT INTO `t_user` VALUES ('27', 'bbb', 'bbb', '11', '1', null, '0');
INSERT INTO `t_user` VALUES ('29', 'ccc', 'ccc', '11', '1', null, '0');
INSERT INTO `t_user` VALUES ('30', 'ddd', '1', '55', '1', null, '0');
INSERT INTO `t_user` VALUES ('31', 'aa55', '11', '11', '1', '11', '0');
INSERT INTO `t_user` VALUES ('32', 'qq', 'qq', '11', '1', 'qq', null);
INSERT INTO `t_user` VALUES ('34', 'qqssfsfs', 'qq', '11', '1', 'qq', null);
