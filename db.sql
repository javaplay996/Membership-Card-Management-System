/*
SQLyog Ultimate v11.3 (64 bit)
MySQL - 5.7.32-log : Database - huiyuanguanlixitong
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`huiyuanguanlixitong` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `huiyuanguanlixitong`;

/*Table structure for table `config` */

DROP TABLE IF EXISTS `config`;

CREATE TABLE `config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='配置文件';

/*Data for the table `config` */

/*Table structure for table `dictionary` */

DROP TABLE IF EXISTS `dictionary`;

CREATE TABLE `dictionary` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dic_code` varchar(200) DEFAULT NULL COMMENT '字段',
  `dic_name` varchar(200) DEFAULT NULL COMMENT '字段名',
  `code_index` int(11) DEFAULT NULL COMMENT '编码',
  `index_name` varchar(200) DEFAULT NULL COMMENT '编码名字  Search111 ',
  `super_id` int(11) DEFAULT NULL COMMENT '父字段id',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='字典表';

/*Data for the table `dictionary` */

insert  into `dictionary`(`id`,`dic_code`,`dic_name`,`code_index`,`index_name`,`super_id`,`create_time`) values (1,'sex_types','性别类型名称',1,'男',NULL,'2021-04-20 13:20:59'),(2,'sex_types','性别类型名称',2,'女',NULL,'2021-04-20 13:20:59'),(3,'shangjia_types','商家名称',1,'日用品店',NULL,'2021-04-20 13:20:59'),(4,'shangjia_types','商家名称',2,'大型商超',NULL,'2021-04-20 13:20:59'),(5,'shangjia_types','商家名称',3,'拉面馆',NULL,'2021-04-20 13:20:59'),(6,'shangjia_types','商家名称',4,'小美理发店',NULL,'2021-04-20 13:20:59'),(7,'goods_types','商品种类名称',1,'种类1',NULL,'2021-04-20 13:20:59'),(8,'goods_types','商品种类名称',2,'种类2',NULL,'2021-04-20 13:20:59'),(9,'goods_types','商品种类名称',3,'种类3',NULL,'2021-04-20 13:20:59'),(10,'shangjia_types','商家名称',5,'店铺5',NULL,'2021-04-20 19:35:53');

/*Table structure for table `goods` */

DROP TABLE IF EXISTS `goods`;

CREATE TABLE `goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `goods_name` varchar(200) DEFAULT NULL COMMENT '商品名字 Search111 ',
  `goods_types` int(11) DEFAULT NULL COMMENT '商品种类  Search111 ',
  `goods_number` int(11) DEFAULT NULL COMMENT '商品数量  Search111 ',
  `goods_photo` varchar(200) DEFAULT NULL COMMENT '商品图片',
  `danwei` varchar(200) DEFAULT NULL COMMENT '单位',
  `danjia` decimal(10,2) DEFAULT NULL COMMENT '单价 Search111 ',
  `goods_content` text COMMENT '商品详情',
  `shangjia_types` int(11) DEFAULT NULL COMMENT '商家 Search111 ',
  `flag` int(11) DEFAULT NULL COMMENT '是否删除',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='商品';

/*Data for the table `goods` */

insert  into `goods`(`id`,`goods_name`,`goods_types`,`goods_number`,`goods_photo`,`danwei`,`danjia`,`goods_content`,`shangjia_types`,`flag`,`create_time`) values (1,'橘子',1,100,'http://localhost:8080/huiyuanguanlixitong/file/download?fileName=1618901858087.jpg','个','10.00','橘子的详情\r\n',3,1,'2021-04-20 14:57:56'),(2,'日用店苹果',2,94,'http://localhost:8080/huiyuanguanlixitong/file/download?fileName=1618902486949.jpg','个','10.00','苹果的详情\r\n',1,1,'2021-04-20 15:08:22'),(3,'日用店大枣',3,92,'http://localhost:8080/huiyuanguanlixitong/file/download?fileName=1618902517407.jpg','个','11.00','日用店大枣的相亲\r\n',1,1,'2021-04-20 15:08:56'),(4,'理发店的水蜜桃',3,88,'http://localhost:8080/huiyuanguanlixitong/file/download?fileName=1618918421336.jpg','个','15.60','水蜜桃的详情\r\n',4,1,'2021-04-20 19:34:10'),(5,'小美理发店的鱼',2,92,'http://localhost:8080/huiyuanguanlixitong/file/download?fileName=1618918634404.jpg','个','19.60','鱼的详情\r\n',4,1,'2021-04-20 19:37:44');

/*Table structure for table `goods_order` */

DROP TABLE IF EXISTS `goods_order`;

CREATE TABLE `goods_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `goods_order_name` varchar(200) DEFAULT NULL COMMENT '订单名  Search111 ',
  `caozuo_name` varchar(200) DEFAULT NULL COMMENT '操作人姓名  Search111 ',
  `caozuo_table` varchar(200) DEFAULT NULL COMMENT '操作人所在表名',
  `huiyuan_id` int(11) DEFAULT NULL COMMENT '会员id',
  `original_money` decimal(10,2) DEFAULT NULL COMMENT '原总价',
  `discount_money` decimal(10,2) DEFAULT NULL COMMENT '折后价 Search111 ',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '订单添加时间  Search111 ',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='购买订单';

/*Data for the table `goods_order` */

insert  into `goods_order`(`id`,`goods_order_name`,`caozuo_name`,`caozuo_table`,`huiyuan_id`,`original_money`,`discount_money`,`insert_time`,`create_time`) values (1,'第一次购买订单','a22','shangjiaguanli',2,'31.00','29.45','2021-04-20 18:58:08','2021-04-20 18:58:08'),(2,'第二单','a22','shangjiaguanli',2,'22.00','20.90','2021-04-20 19:21:55','2021-04-20 19:21:55'),(3,'张二的第二次购买','a22','shangjiaguanli',3,'62.00','58.90','2021-04-20 19:27:29','2021-04-20 19:27:29'),(4,'张二的第二次购买','a3','yonghu',3,'33.00','31.35','2021-04-20 19:29:20','2021-04-20 19:29:20'),(5,'理发店第一单','a33','shangjiaguanli',5,'101.60','96.52','2021-04-20 19:43:26','2021-04-20 19:43:26'),(6,'第二单','a2','yonghu',4,'121.20','115.14','2021-04-20 19:45:29','2021-04-20 19:45:29'),(7,'1','a2','yonghu',4,'121.20','115.14','2021-04-20 19:46:28','2021-04-20 19:46:28');

/*Table structure for table `goods_order_list` */

DROP TABLE IF EXISTS `goods_order_list`;

CREATE TABLE `goods_order_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `goods_order_id` int(11) DEFAULT NULL COMMENT '订单',
  `goods_id` int(11) DEFAULT NULL COMMENT '商品',
  `goods_order_list_number` int(11) DEFAULT NULL COMMENT '数量  Search111 ',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='购买订单详情';

/*Data for the table `goods_order_list` */

insert  into `goods_order_list`(`id`,`goods_order_id`,`goods_id`,`goods_order_list_number`,`create_time`) values (1,1,2,2,'2021-04-20 18:58:08'),(2,1,3,1,'2021-04-20 18:58:08'),(3,2,3,2,'2021-04-20 19:21:55'),(4,3,2,4,'2021-04-20 19:27:29'),(5,3,3,2,'2021-04-20 19:27:29'),(6,4,3,3,'2021-04-20 19:29:20'),(7,5,4,4,'2021-04-20 19:43:26'),(8,5,5,2,'2021-04-20 19:43:26'),(9,6,4,4,'2021-04-20 19:45:29'),(10,6,5,3,'2021-04-20 19:45:29'),(11,7,4,4,'2021-04-20 19:46:28'),(12,7,5,3,'2021-04-20 19:46:28');

/*Table structure for table `huiyuan` */

DROP TABLE IF EXISTS `huiyuan`;

CREATE TABLE `huiyuan` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(255) DEFAULT NULL COMMENT '账户',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `huiyuan_name` varchar(200) DEFAULT NULL COMMENT '姓名 Search111 ',
  `huiyuan_phone` varchar(200) DEFAULT NULL COMMENT '手机号 Search111 ',
  `huiyuan_id_number` varchar(200) DEFAULT NULL COMMENT '身份证号 Search111 ',
  `new_money` decimal(10,4) DEFAULT NULL COMMENT '余额',
  `jifen` decimal(10,4) DEFAULT NULL COMMENT '积分',
  `sex_types` int(11) DEFAULT NULL COMMENT '性别',
  `huiyuan_photo` varchar(200) DEFAULT NULL COMMENT '头像',
  `shangjia_types` int(11) DEFAULT NULL COMMENT '商家 Search111 ',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='会员';

/*Data for the table `huiyuan` */

insert  into `huiyuan`(`id`,`username`,`password`,`huiyuan_name`,`huiyuan_phone`,`huiyuan_id_number`,`new_money`,`jifen`,`sex_types`,`huiyuan_photo`,`shangjia_types`,`create_time`) values (1,'a11','123456','a11','17703786931','410224199610232001','100.0000','0.0000',2,'http://localhost:8080/huiyuanguanlixitong/file/download?fileName=1618901814546.jpg',3,'2021-04-20 14:56:55'),(2,'a1','123456','张一','17703786931','410224199610232001','0.0000','0.0000',2,'http://localhost:8080/huiyuanguanlixitong/file/download?fileName=1618902426755.jpg',1,'2021-04-20 15:07:07'),(3,'a2','123456','张二','17703786932','410224199610232002',NULL,'90.2500',2,'http://localhost:8080/huiyuanguanlixitong/file/download?fileName=1618918012435.jpg',1,'2021-04-20 19:26:53'),(4,'a3','123456','真三','17703786933','410224199610232003',NULL,'20.2800',2,'http://localhost:8080/huiyuanguanlixitong/file/download?fileName=1618918370318.jpg',4,'2021-04-20 19:32:51'),(5,'a4','123456','张四4444','17703786934','410224199610232004',NULL,'16.5200',2,'http://localhost:8080/huiyuanguanlixitong/file/download?fileName=1618918393863.jpg',4,'2021-04-20 19:33:15');

/*Table structure for table `jifengoods` */

DROP TABLE IF EXISTS `jifengoods`;

CREATE TABLE `jifengoods` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `jifengoods_name` varchar(200) DEFAULT NULL COMMENT '商品名字 Search111 ',
  `goods_types` int(11) DEFAULT NULL COMMENT '商品种类  Search111 ',
  `jifengoods_number` int(11) DEFAULT NULL COMMENT '商品数量  Search111 ',
  `jifengoods_photo` varchar(200) DEFAULT NULL COMMENT '商品图片',
  `danwei` varchar(200) DEFAULT NULL COMMENT '单位',
  `danjia` decimal(10,2) DEFAULT NULL COMMENT '价值 Search111 ',
  `suoxujifen` decimal(10,4) DEFAULT NULL COMMENT '所需积分 Search111 ',
  `jifengoods_content` text COMMENT '商品详情',
  `shangjia_types` int(11) DEFAULT NULL COMMENT '商家 Search111 ',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='积分商品';

/*Data for the table `jifengoods` */

insert  into `jifengoods`(`id`,`jifengoods_name`,`goods_types`,`jifengoods_number`,`jifengoods_photo`,`danwei`,`danjia`,`suoxujifen`,`jifengoods_content`,`shangjia_types`,`create_time`) values (1,'店铺5的鱼',3,100,'http://localhost:8080/huiyuanguanlixitong/file/download?fileName=1618985361180.jpg','条','10.00','1000.0000','店铺5的鱼的详情\r\n',5,'2021-04-21 14:09:57'),(2,'理发店的鱼积分',2,100,'http://localhost:8080/huiyuanguanlixitong/file/download?fileName=1618985411444.jpg','个','11.00','20.0000','理发店的鱼积分的详情\r\n',4,'2021-04-21 14:11:14'),(3,'理发店的大枣',3,98,'http://localhost:8080/huiyuanguanlixitong/file/download?fileName=1618989791389.jpg','斤','100.00','105.0000','大枣是好大枣\r\n',4,'2021-04-21 15:23:46'),(4,'理发店的油',2,99,'http://localhost:8080/huiyuanguanlixitong/file/download?fileName=1618992847003.jpg','个','100.00','80.0000','油的详情\r\n',4,'2021-04-21 16:18:05');

/*Table structure for table `jifengoods_order` */

DROP TABLE IF EXISTS `jifengoods_order`;

CREATE TABLE `jifengoods_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `huiyuan_id` int(11) DEFAULT NULL COMMENT '会员id',
  `jifengoods_id` int(11) DEFAULT NULL COMMENT '商品',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '兑换时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='积分商品';

/*Data for the table `jifengoods_order` */

insert  into `jifengoods_order`(`id`,`huiyuan_id`,`jifengoods_id`,`insert_time`,`create_time`) values (1,4,3,'2021-04-21 15:44:59','2021-04-21 15:44:59'),(2,4,3,'2021-04-21 15:48:08','2021-04-21 15:48:08'),(3,5,4,'2021-04-21 16:20:15','2021-04-21 16:20:15');

/*Table structure for table `liuyan` */

DROP TABLE IF EXISTS `liuyan`;

CREATE TABLE `liuyan` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `huiyuan_id` int(11) DEFAULT NULL COMMENT '会员id',
  `liuyan_content` text COMMENT '留言内容',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '留言时间',
  `reply_content` text COMMENT '回复内容',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '回复时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='留言';

/*Data for the table `liuyan` */

insert  into `liuyan`(`id`,`huiyuan_id`,`liuyan_content`,`insert_time`,`reply_content`,`update_time`,`create_time`) values (1,4,'留言1\r\n','2021-04-21 15:50:19','‍留言1的回复1\r\n','2021-04-21 16:18:45','2021-04-21 15:50:19'),(2,4,'留言2\r\n','2021-04-21 15:59:16','回复1\r\n','2021-04-21 16:10:50','2021-04-21 15:59:16'),(3,5,'张四的留言1\r\n','2021-04-21 16:20:42','商家管理员和销售 能回复 能删除留言\r\n','2021-04-21 16:23:33','2021-04-21 16:20:42');

/*Table structure for table `shangjiaguanli` */

DROP TABLE IF EXISTS `shangjiaguanli`;

CREATE TABLE `shangjiaguanli` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(200) DEFAULT NULL COMMENT '商家管理员账户',
  `password` varchar(200) DEFAULT NULL COMMENT '商家管理员密码',
  `shangjiaguanli_name` varchar(200) DEFAULT NULL COMMENT '姓名 Search111 ',
  `shangjiaguanli_phone` varchar(200) DEFAULT NULL COMMENT '手机号 Search111 ',
  `shangjiaguanli_id_number` varchar(200) DEFAULT NULL COMMENT '身份证号 Search111 ',
  `shangjiaguanli_photo` varchar(200) DEFAULT NULL COMMENT '头像',
  `sex_types` int(11) DEFAULT NULL COMMENT '性别',
  `shangjia_types` int(11) DEFAULT NULL COMMENT '商家 Search111 ',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='商家管理员';

/*Data for the table `shangjiaguanli` */

insert  into `shangjiaguanli`(`id`,`username`,`password`,`shangjiaguanli_name`,`shangjiaguanli_phone`,`shangjiaguanli_id_number`,`shangjiaguanli_photo`,`sex_types`,`shangjia_types`,`create_time`) values (1,'a11','123456','张1','17703786911','410224199610232011','http://localhost:8080/huiyuanguanlixitong/file/download?fileName=1618897518132.jpg',2,4,'2021-04-20 13:45:23'),(2,'a22','123456','张22','17703786922','410224199610232022','http://localhost:8080/huiyuanguanlixitong/file/download?fileName=1618897552010.jpg',1,1,'2021-04-20 13:45:56'),(3,'a33','123456','张三33','17703786933','410224199610232033','http://localhost:8080/huiyuanguanlixitong/file/download?fileName=1618918296638.jpg',2,4,'2021-04-20 19:31:39');

/*Table structure for table `token` */

DROP TABLE IF EXISTS `token`;

CREATE TABLE `token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `tablename` varchar(100) DEFAULT NULL COMMENT '表名',
  `role` varchar(100) DEFAULT NULL COMMENT '角色',
  `token` varchar(200) NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `expiratedtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='token表';

/*Data for the table `token` */

insert  into `token`(`id`,`userid`,`username`,`tablename`,`role`,`token`,`addtime`,`expiratedtime`) values (1,6,'admin','users','管理员','zxw155wchk5mni97e5hqv0oty94ipsto','2021-04-20 13:42:25','2021-04-21 17:12:58'),(2,2,'a22','shangjiaguanli','商家管理员','mb3he10e1dq6f2kerxsae8ci93tpfygf','2021-04-20 14:58:21','2021-04-20 20:21:08'),(3,3,'a3','yonghu','用户','620iyz5fi1dswnm96oxavlmznfqwdv5c','2021-04-20 19:28:42','2021-04-20 20:28:42'),(4,3,'a33','shangjiaguanli','商家管理员','dwkspwijy2ufncxlll39gw8vdjt5uckr','2021-04-20 19:36:13','2021-04-21 16:22:50'),(5,2,'a2','yonghu','用户','7172bhork777ibredtkjuvwky7stugag','2021-04-20 19:44:34','2021-04-20 20:44:35'),(6,1,'a1','yonghu','用户','26j4c7ye2ql962cvjsw9paokj0onhixv','2021-04-21 15:43:19','2021-04-21 17:21:07'),(7,4,'a3','huiyuan','会员','rh95s69hmgz8lsr6k1m77sknfdhclfez','2021-04-21 15:44:47','2021-04-21 16:58:59'),(8,5,'a4','huiyuan','会员','hio512tgj30y3ldd1mexvdnf835oh95w','2021-04-21 15:51:58','2021-04-21 17:19:13'),(9,1,'a11','shangjiaguanli','商家管理员','efnyep9bn64fe6ri8lwvcd14yfhselyd','2021-04-21 15:59:33','2021-04-21 17:20:56');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `role` varchar(100) DEFAULT '管理员' COMMENT '角色',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='管理员表';

/*Data for the table `users` */

insert  into `users`(`id`,`username`,`password`,`role`,`addtime`) values (6,'admin','123456','管理员','2021-01-29 14:51:13');

/*Table structure for table `yonghu` */

DROP TABLE IF EXISTS `yonghu`;

CREATE TABLE `yonghu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(200) DEFAULT NULL COMMENT '账户',
  `password` varchar(200) DEFAULT NULL COMMENT '密码',
  `yonghu_name` varchar(200) DEFAULT NULL COMMENT '姓名 Search111 ',
  `yonghu_phone` varchar(200) DEFAULT NULL COMMENT '手机号 Search111 ',
  `yonghu_id_number` varchar(200) DEFAULT NULL COMMENT '身份证号 Search111 ',
  `sex_types` int(11) DEFAULT NULL COMMENT '性别',
  `yonghu_photo` varchar(200) DEFAULT NULL COMMENT '头像',
  `shangjia_types` int(11) DEFAULT NULL COMMENT '商家 Search111 ',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='销售';

/*Data for the table `yonghu` */

insert  into `yonghu`(`id`,`username`,`password`,`yonghu_name`,`yonghu_phone`,`yonghu_id_number`,`sex_types`,`yonghu_photo`,`shangjia_types`,`create_time`) values (1,'a1','123456','张1','17703786901','410224199610232001',2,'http://localhost:8080/huiyuanguanlixitong/file/download?fileName=1618897620684.jpg',4,'2021-04-20 13:47:04'),(2,'a2','123456','张2','17703786902','410224199610232002',2,'http://localhost:8080/huiyuanguanlixitong/file/download?fileName=1618897645953.jpg',4,'2021-04-20 13:47:27'),(3,'a3','123456','张三','17703786903','410224199610232003',1,'http://localhost:8080/huiyuanguanlixitong/file/download?fileName=1618897670817.jpg',1,'2021-04-20 13:47:58'),(4,'a4','123456','张4','17703786904','410224199610232004',2,'http://localhost:8080/huiyuanguanlixitong/file/download?fileName=1618902323045.jpg',1,'2021-04-20 15:06:00');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
