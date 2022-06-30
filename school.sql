/*
 Navicat Premium Data Transfer

 Source Server         : root
 Source Server Type    : MySQL
 Source Server Version : 50735
 Source Host           : localhost:3306
 Source Schema         : school

 Target Server Type    : MySQL
 Target Server Version : 50735
 File Encoding         : 65001

 Date: 30/06/2022 14:26:36
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admission
-- ----------------------------
DROP TABLE IF EXISTS `admission`;
CREATE TABLE `admission`  (
  `userid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学号/工号',
  `subtime` datetime(0) NOT NULL COMMENT '提交时间',
  `category` int(255) NOT NULL DEFAULT 0 COMMENT '入园类0',
  `admissiontime` datetime(0) NOT NULL COMMENT '入院时间',
  `admissionreason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '入院事由',
  `residentialaddress` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '现居住地',
  `tutorapprovalvoucher` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '导师审批凭证',
  `travelcard` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '行程卡',
  `healthcodegreencode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '健康码绿码',
  `nucleicacidproof` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '入园前连续三天核酸检测阴性证明',
  `approve` int(255) NULL DEFAULT -1 COMMENT '审批 通过1 不通过0 默认-1未审批 -2取消',
  `opinion` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审批意见',
  PRIMARY KEY (`userid`, `subtime`, `category`) USING BTREE,
  INDEX `approvee`(`approve`) USING BTREE,
  INDEX `ea`(`userid`, `subtime`, `category`, `approve`, `opinion`) USING BTREE,
  CONSTRAINT `userid1` FOREIGN KEY (`userid`) REFERENCES `login` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci COMMENT = '入校' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for backtoschool
-- ----------------------------
DROP TABLE IF EXISTS `backtoschool`;
CREATE TABLE `backtoschool`  (
  `userid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学号/工号',
  `subtime` datetime(0) NOT NULL COMMENT '提交时间',
  `category` int(255) NOT NULL DEFAULT 2 COMMENT '返校类2',
  `backtime` datetime(0) NOT NULL COMMENT '返校时间',
  `residentialaddress` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '现居住地',
  `tutorapprovalvoucher` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '导师审批凭证',
  `travelcard` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '行程卡',
  `healthcodegreencode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '健康码绿码',
  `nucleicacidproof` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '入园前连续三天核酸检测阴性证明',
  `approve` int(255) NULL DEFAULT -1 COMMENT '审批 通过1 不通过0 默认-1未审批',
  `opinion` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审批意见',
  PRIMARY KEY (`userid`, `subtime`, `category`) USING BTREE,
  INDEX `approveb`(`approve`) USING BTREE,
  INDEX `eb`(`userid`, `subtime`, `category`, `approve`, `opinion`) USING BTREE,
  CONSTRAINT `userid2` FOREIGN KEY (`userid`) REFERENCES `login` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci COMMENT = '返校' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for examine
-- ----------------------------
DROP TABLE IF EXISTS `examine`;
CREATE TABLE `examine`  (
  `userid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学号/工号',
  `subtime` datetime(0) NOT NULL COMMENT '提交时间',
  `category` int(255) NOT NULL COMMENT '申请类别 入园0 出园1 返校2',
  `approve` int(255) NULL DEFAULT -1 COMMENT '审批 通过1 不通过0 取消-2 未审批-1',
  `opinion` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审批意见',
  PRIMARY KEY (`userid`, `subtime`, `category`) USING BTREE,
  INDEX `approve`(`approve`) USING BTREE,
  INDEX `userid`(`userid`, `subtime`, `category`, `approve`, `opinion`) USING BTREE,
  CONSTRAINT `userid4` FOREIGN KEY (`userid`) REFERENCES `login` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci COMMENT = '审批' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for leaveschool
-- ----------------------------
DROP TABLE IF EXISTS `leaveschool`;
CREATE TABLE `leaveschool`  (
  `userid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学号/工号',
  `subtime` datetime(0) NOT NULL COMMENT '提交时间',
  `category` int(255) NOT NULL DEFAULT 1 COMMENT '出园类1',
  `starttime` datetime(0) NOT NULL COMMENT '开始时间',
  `endtime` datetime(0) NOT NULL COMMENT '结束时间',
  `destination` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '目的地',
  `outreason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '外出事由',
  `letterofcommitment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '本人签字的离园承诺书',
  `tutorapprovalvoucher` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '导师审批凭证',
  `approve` int(255) NULL DEFAULT -1 COMMENT '审批 通过1 不通过0 默认-1未审批',
  `opinion` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审批意见',
  PRIMARY KEY (`userid`, `subtime`, `category`) USING BTREE,
  INDEX `approvel`(`approve`) USING BTREE,
  INDEX `el`(`userid`, `subtime`, `category`, `approve`, `opinion`) USING BTREE,
  CONSTRAINT `userid3` FOREIGN KEY (`userid`) REFERENCES `login` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci COMMENT = '出校' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for login
-- ----------------------------
DROP TABLE IF EXISTS `login`;
CREATE TABLE `login`  (
  `userid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学号/工号',
  `userpasswd` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `userlevel` int(255) NOT NULL COMMENT '身份 学生=0 老师=1 管理员=2',
  PRIMARY KEY (`userid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci COMMENT = '登录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for userinfo
-- ----------------------------
DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo`  (
  `userid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学号/工号',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `userphone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话号码',
  `usergender` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `userroom` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '房间号',
  `userstatus` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份',
  PRIMARY KEY (`userid`) USING BTREE,
  CONSTRAINT `userid0` FOREIGN KEY (`userid`) REFERENCES `login` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Triggers structure for table admission
-- ----------------------------
DROP TRIGGER IF EXISTS `a1`;
delimiter ;;
CREATE TRIGGER `a1` BEFORE INSERT ON `admission` FOR EACH ROW begin
insert into examine(userid,subtime,category,approve) values(new.userid,new.subtime,new.category,new.approve);
end
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table backtoschool
-- ----------------------------
DROP TRIGGER IF EXISTS `b1`;
delimiter ;;
CREATE TRIGGER `b1` BEFORE INSERT ON `backtoschool` FOR EACH ROW begin
insert into examine(userid,subtime,category,approve) values(new.userid,new.subtime,new.category,new.approve);
end
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table examine
-- ----------------------------
DROP TRIGGER IF EXISTS `e1`;
delimiter ;;
CREATE TRIGGER `e1` AFTER UPDATE ON `examine` FOR EACH ROW begin
if new.category=0
then
update admission
set approve=new.approve,opinion=new.opinion
where userid=new.userid and subtime=new.subtime;
elseif new.category=1
then
update leaveschool
set approve=new.approve,opinion=new.opinion
where userid=new.userid and subtime=new.subtime;
elseif new.category=2
then
update backtoschool
set approve=new.approve,opinion=new.opinion
where userid=new.userid and subtime=new.subtime;
end if;
end
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table leaveschool
-- ----------------------------
DROP TRIGGER IF EXISTS `l1`;
delimiter ;;
CREATE TRIGGER `l1` BEFORE INSERT ON `leaveschool` FOR EACH ROW begin
insert into examine(userid,subtime,category,approve) values(new.userid,new.subtime,new.category,new.approve);
end
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table login
-- ----------------------------
DROP TRIGGER IF EXISTS `lu`;
delimiter ;;
CREATE TRIGGER `lu` AFTER INSERT ON `login` FOR EACH ROW begin
insert into userinfo(userid) values(new.userid);
end
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
