/*
 Navicat Premium Data Transfer

 Source Server         : mysql57
 Source Server Type    : MySQL
 Source Server Version : 50717
 Source Host           : localhost:3306
 Source Schema         : musicparadise

 Target Server Type    : MySQL
 Target Server Version : 50717
 File Encoding         : 65001

 Date: 29/10/2019 13:51:26
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for album
-- ----------------------------
DROP TABLE IF EXISTS `album`;
CREATE TABLE `album`  (
  `Aid` bigint(11) NOT NULL AUTO_INCREMENT,
  `album_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Sid` bigint(11) NULL DEFAULT NULL,
  `album_introduce` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`Aid`) USING BTREE,
  INDEX `fk_album_singer`(`Sid`) USING BTREE,
  CONSTRAINT `fk_album_singer` FOREIGN KEY (`Sid`) REFERENCES `singer` (`Sid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of album
-- ----------------------------
INSERT INTO `album` VALUES (1, '《薛之谦》', 2, '这是薛之谦的首张专辑，满载了他的音乐梦想，因此以他的名字“薛之谦”作为专辑的名字。');
INSERT INTO `album` VALUES (2, '《范特西》', 1, '专辑《范特西》，发行于2001年9月14日，由周杰伦担任专辑的监制，全碟10首歌曲均由周杰伦作曲。作词方面，周杰伦负责其中2首，其余作词工作分别由方文山及徐若瑄完成。周杰伦在创作过程中把怀旧、爱情、家庭暴力、武术等各种创作意念放进音乐里。\r\n专辑《范特西》，名称来源是英文“Fantasy”的发音，意为“幻想”。之所以使用《范特西》这个专辑名，因为周杰伦要用音乐给人带来异想天开的想象空间，并且《范特西》这个名字也反映了周杰伦一贯的音乐理念——音乐是幻想的，幻想是快乐的。');
INSERT INTO `album` VALUES (3, '《凡伴》', 3, '生活是平凡的，又是单调的，人生是散淡的，又是艰难的，于是我们常常会乏味和寂寞。生活是缤纷的，又是无奈的，人生是复杂的，又是美好的，于是我们常常会浮躁和失落。很多时候我们常常会幻想有一个跟自己一样平凡的人陪在身旁，明明看似简单的事情却在如今举步维艰，可又有多少人愿意等待，值得等待？\r\n\r\n我只想要平凡纯粹的生活，我愿意等待，哪怕缘分今生没算到你，万人来劝也无悔，我爱你，所以我才需要你！');
INSERT INTO `album` VALUES (4, '《回到原点》', 4, '你离开后，我的夏天就结束了。\r\n\r\n那些炙热的，甜蜜的，疯狂的回忆画面并没有随着你离开而褪色，反而越来越清晰。\r\n\r\n我多想回到原点，回到我们最初遇见的那个夏天，回到那个吹着晚风的天台，回到握紧你指尖的瞬间。\r\n\r\n“把孤独当做晚餐”的97年少年井胧，用《回到原点》继续捕捉那些戳中内心的瞬间，不符合年龄的成熟嗓音，将分离后的情绪诠释得令人心痛。');
INSERT INTO `album` VALUES (5, '《官方音乐》', 41, '纯音乐的世界，心事化作音符，纵情倾诉着守望已久的幸福……岁月悠悠，时光在瞬间流逝而去，清风徐徐，音符在指尖下流淌开来，萦绕不止的是那些绕梁的音韵与不老的旋律。\r\n\r\n纯音乐的国度，思想信马由缰，没有歌声的音乐世界可以安放许多故事，无论阳春白雪，还是下里巴人，抑或喜，抑或悲，都可用其来安放自己，梳弄着琐碎的感动，圆润过往的年华。\r\n\r\n悠扬如诗的乐曲，带着一种不染尘世的纯净气息，来回地撩拨着你的听觉，穿越生命，超越时空，唤起心灵的悸动，似要揪出灵魂深处的那份感动。\r\n\r\n音符自由流淌，或典雅明丽，或华丽多彩，或遥远震颤，或凝重悲怆。闭目聆听，婉转缠绵的二胡，悠扬空旷的马头琴，醇厚幽远的古筝，轻扬灵性的笛子，清旷古远的箫……巧妙地融合在一起，如丝般地划过心头，漾出浅浅的涟漪，抚弄着绵绵的心事，似乎所有的繁华与喧嚣，已如云烟般消散。');

-- ----------------------------
-- Table structure for recommend
-- ----------------------------
DROP TABLE IF EXISTS `recommend`;
CREATE TABLE `recommend`  (
  `Rid` bigint(11) NOT NULL AUTO_INCREMENT,
  `recommend_menu_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Rid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of recommend
-- ----------------------------
INSERT INTO `recommend` VALUES (1, '洗脑神曲');
INSERT INTO `recommend` VALUES (2, '百听不厌');
INSERT INTO `recommend` VALUES (3, '失恋歌曲');
INSERT INTO `recommend` VALUES (4, '程序员歌曲');
INSERT INTO `recommend` VALUES (5, '伤感歌曲');
INSERT INTO `recommend` VALUES (6, '每日推荐');

-- ----------------------------
-- Table structure for singer
-- ----------------------------
DROP TABLE IF EXISTS `singer`;
CREATE TABLE `singer`  (
  `Sid` bigint(11) NOT NULL AUTO_INCREMENT,
  `singer_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` tinyint(3) NULL DEFAULT NULL,
  `birthday` date NULL DEFAULT NULL,
  `hobby` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `photo_url` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Sid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 46 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of singer
-- ----------------------------
INSERT INTO `singer` VALUES (1, '周杰伦', 1, '2010-11-18', '足球', 'photo/u=2463582001,1001557209&fm=26&gp=0.jpg');
INSERT INTO `singer` VALUES (2, '薛之谦', 0, '2010-11-03', '唱歌', 'photo/u=2035984269,1587191387&fm=26&gp=0.jpg');
INSERT INTO `singer` VALUES (3, '王贰浪', 0, '2015-11-03', '吃饭', 'photo/u=3767696658,3049335673&fm=26&gp=0.jpg');
INSERT INTO `singer` VALUES (4, '井胧', 1, '2010-11-06', '吉他', 'photo/ee2f01ably1fvjq9i7b00j22c02c01l2.jpg');
INSERT INTO `singer` VALUES (33, '段丽阳', 0, '1993-09-21', '吉他', 'photo/8435e5dde71190efafe80f7bc71b9d16fdfa6007.jpg');
INSERT INTO `singer` VALUES (34, '曹艺馨', 0, '1997-07-20', '吃炒米饭', 'photo/d62a6059252dd42a08f212320f3b5bb5c8eab8ab.jpg');
INSERT INTO `singer` VALUES (35, '荆州DJ云天', 1, '2011-11-07', '旅游', 'photo/20160303235859204465.jpg');
INSERT INTO `singer` VALUES (36, '宝宝巴士', 1, '2010-11-03', '足球', 'photo/u=1017318978,604238906&fm=26&gp=0.jpg');
INSERT INTO `singer` VALUES (37, '贝瓦儿歌', 1, '1993-09-21', '吉他', 'photo/u=638668445,3159170838&fm=74&app=80&f=JPEG&size=f12190.jpg');
INSERT INTO `singer` VALUES (38, '布仁巴雅尔 _ 乌日娜 _ 英格玛', 0, '1993-09-21', '吃饭', 'photo/u=3886487459,1305833609.jpg');
INSERT INTO `singer` VALUES (39, '儿歌', 1, '2010-11-03', '唱歌', 'photo/u=3848822280,432134656&fm=26&gp=0.jpg');
INSERT INTO `singer` VALUES (40, '樊竹青', 0, '2018-11-03', '球', 'photo/u=3209599491,1962637056&fm=26&gp=0.jpg');
INSERT INTO `singer` VALUES (41, '华语群星', 1, '2010-11-06', '唱歌', 'photo/u=64713435,4240424961&fm=26&gp=0.jpg');
INSERT INTO `singer` VALUES (42, '群星', 1, '2015-11-03', '吃饭', 'photo/u=64713435,4240424961&fm=26&gp=0.jpg');
INSERT INTO `singer` VALUES (43, '杨沛宜', 0, '2015-11-03', '足球', 'photo/timg.jpg');
INSERT INTO `singer` VALUES (44, '张玥', 0, '2015-11-03', '吃饭', 'photo/u=564396001,3006227816&fm=26&gp=0.jpg');
INSERT INTO `singer` VALUES (45, '中央人民广播电台少年广播合唱团', 1, '1997-07-20', '唱歌', 'photo/u=1476146931,112789474&fm=58&w=121&h=140&img.jpg');

-- ----------------------------
-- Table structure for song
-- ----------------------------
DROP TABLE IF EXISTS `song`;
CREATE TABLE `song`  (
  `song_id` bigint(11) NOT NULL AUTO_INCREMENT,
  `song_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Sid` bigint(11) NULL DEFAULT NULL,
  `Tid` bigint(11) NULL DEFAULT NULL,
  `VV` bigint(11) NOT NULL,
  `url` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `lrc_url` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `upload_date` datetime(0) NULL DEFAULT NULL,
  `Rid` bigint(11) NULL DEFAULT NULL,
  PRIMARY KEY (`song_id`) USING BTREE,
  INDEX `fk_song_singer`(`Sid`) USING BTREE,
  INDEX `fk_song_type`(`Tid`) USING BTREE,
  INDEX `fk_song_recommend`(`Rid`) USING BTREE,
  CONSTRAINT `fk_song_recommend` FOREIGN KEY (`Rid`) REFERENCES `recommend` (`Rid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_song_singer` FOREIGN KEY (`Sid`) REFERENCES `singer` (`Sid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_song_type` FOREIGN KEY (`Tid`) REFERENCES `type` (`Tid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 50 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of song
-- ----------------------------
INSERT INTO `song` VALUES (1, '周杰伦- 给我一首歌的时间', 1, 4, 0, 'uploadmusic/周杰伦- 给我一首歌的时间.mp3', NULL, '2019-10-24 12:08:36', 2);
INSERT INTO `song` VALUES (2, '薛之谦 - 那是你离开了北京的生活', 2, 1, 0, 'uploadmusic/薛之谦 - 那是你离开了北京的生活.mp3', 'lrc/薛之谦 - 那是你离开了北京的生活.lrc', '2019-10-24 12:08:49', 5);
INSERT INTO `song` VALUES (3, '薛之谦 - 木偶人', 2, 1, 0, 'uploadmusic/薛之谦 - 木偶人.mp3', NULL, '2019-10-24 12:08:57', 6);
INSERT INTO `song` VALUES (4, '王贰浪 - 爱你', 3, 3, 4, 'uploadmusic/王贰浪 - 爱你.mp3', NULL, '2019-10-24 12:09:31', 2);
INSERT INTO `song` VALUES (5, '把孤独当做晚餐(cover：群星)', 4, 4, 0, 'uploadmusic/把孤独当做晚餐(cover：群星).mp3', NULL, '2019-10-24 12:09:57', NULL);
INSERT INTO `song` VALUES (6, '薛之谦 - 丑八怪', 2, 4, 0, 'uploadmusic/薛之谦 - 丑八怪.mp3', 'lrc/丑八怪.lrc', '2019-10-24 14:31:57', NULL);
INSERT INTO `song` VALUES (7, '薛之谦 - 刚刚好', 2, 4, 0, 'uploadmusic/薛之谦 - 刚刚好.mp3', 'lrc/刚刚好.lrc', '2019-10-24 14:42:07', 6);
INSERT INTO `song` VALUES (8, '薛之谦 - 演员', 2, 4, 0, 'uploadmusic/薛之谦 - 演员.mp3', 'lrc/演员.lrc', '2019-10-24 14:54:27', NULL);
INSERT INTO `song` VALUES (10, '段丽阳 - 爱我你就抱抱我(合唱版)', 33, 3, 2, 'uploadmusic/段丽阳 - 爱我你就抱抱我(合唱版).mp3', 'lrc/爱我你就抱抱我.lrc', '2019-10-24 15:05:33', NULL);
INSERT INTO `song` VALUES (11, '曹艺馨 - 我带上你你带上钱 (DJ何鹏版)', 34, 2, 0, 'uploadmusic/曹艺馨 - 我带上你你带上钱 (DJ何鹏版).mp3', NULL, '2019-10-24 15:15:33', NULL);
INSERT INTO `song` VALUES (12, '荆州DJ云天 - DJ拥抱你离去', 35, 2, 0, 'uploadmusic/荆州DJ云天 - DJ拥抱你离去.mp3', 'lrc/拥抱着你离去.lrc', '2019-10-24 15:20:22', NULL);
INSERT INTO `song` VALUES (13, '薛之谦 - 别', 2, 1, 0, 'uploadmusic/薛之谦 - 别.mp3', NULL, '2019-10-25 22:16:15', 3);
INSERT INTO `song` VALUES (14, '薛之谦 - 骆驼', 2, 1, 0, 'uploadmusic/薛之谦 - 骆驼.mp3', 'lrc/薛之谦 - 骆驼.lrc', '2019-10-25 22:19:14', 1);
INSERT INTO `song` VALUES (15, '宝宝巴士 - 宝贝睡午觉', 36, 3, 2, 'uploadmusic/宝宝巴士 - 宝贝睡午觉.mp3', 'lrc/宝宝巴士 - 宝贝睡午觉.lrc', '2019-10-25 22:55:59', NULL);
INSERT INTO `song` VALUES (16, '贝瓦儿歌 - 采蘑菇的小姑娘', 37, 3, 2, 'uploadmusic/贝瓦儿歌 - 采蘑菇的小姑娘.mp3', 'lrc/贝瓦儿歌 - 采蘑菇的小姑娘.lrc', '2019-10-25 22:56:35', NULL);
INSERT INTO `song` VALUES (17, '布仁巴雅尔 _ 乌日娜 _ 英格玛 - 吉祥三宝 (国语)', 38, 3, 7, 'uploadmusic/布仁巴雅尔 _ 乌日娜 _ 英格玛 - 吉祥三宝 (国语).mp3', 'lrc/布仁巴雅尔 _ 乌日娜 _ 英格玛 - 吉祥三宝 (国语).lrc', '2019-10-25 22:57:25', NULL);
INSERT INTO `song` VALUES (18, '儿歌 - 大头儿子小头爸爸', 39, 3, 5, 'uploadmusic/儿歌 - 大头儿子小头爸爸.mp3', 'lrc/儿歌 - 大头儿子小头爸爸.lrc', '2019-10-25 22:58:10', 2);
INSERT INTO `song` VALUES (19, '儿歌 - 让我们荡起双桨', 39, 3, 1, 'uploadmusic/儿歌 - 让我们荡起双桨.mp3', 'lrc/儿歌 - 让我们荡起双桨.lrc', '2019-10-25 22:58:44', NULL);
INSERT INTO `song` VALUES (20, '儿歌 - 数字歌', 39, 3, 1, 'uploadmusic/儿歌 - 数字歌.mp3', 'lrc/儿歌 - 数字歌.lrc', '2019-10-25 22:59:07', NULL);
INSERT INTO `song` VALUES (21, '儿歌 - 我有一只小毛驴', 39, 3, 1, 'uploadmusic/儿歌 - 我有一只小毛驴.mp3', 'lrc/儿歌 - 我有一只小毛驴.lrc', '2019-10-25 22:59:24', 1);
INSERT INTO `song` VALUES (22, '樊竹青 - 白龙马', 40, 3, 1, 'uploadmusic/樊竹青 - 白龙马.mp3', 'lrc/樊竹青 - 白龙马.lrc', '2019-10-25 23:10:47', NULL);
INSERT INTO `song` VALUES (23, '华语群星 - 爸爸去哪儿', 41, 3, 2, 'uploadmusic/华语群星 - 爸爸去哪儿.mp3', 'lrc/华语群星 - 爸爸去哪儿.lrc', '2019-10-25 23:11:46', NULL);
INSERT INTO `song` VALUES (24, '群星 - 世上只有妈妈好', 42, 3, 1, 'uploadmusic/群星 - 世上只有妈妈好.mp3', 'lrc/群星 - 世上只有妈妈好.lrc', '2019-10-25 23:12:32', NULL);
INSERT INTO `song` VALUES (25, '薛之谦 - 暧昧', 2, 4, 0, 'uploadmusic/薛之谦 - 暧昧.mp3', 'lrc/薛之谦 - 暧昧.lrc', '2019-10-25 23:19:45', 4);
INSERT INTO `song` VALUES (26, '薛之谦 - 病态', 2, 4, 0, 'uploadmusic/薛之谦 - 病态.mp3', 'lrc/薛之谦 - 病态.lrc', '2019-10-25 23:20:23', NULL);
INSERT INTO `song` VALUES (27, '薛之谦 - 尘', 2, 4, 0, 'uploadmusic/薛之谦 - 尘.mp3', 'lrc/薛之谦 - 尘.lrc', '2019-10-25 23:20:44', NULL);
INSERT INTO `song` VALUES (28, '薛之谦 - 动物世界', 2, 4, 0, 'uploadmusic/薛之谦 - 动物世界.mp3', 'lrc/薛之谦 - 动物世界.lrc', '2019-10-25 23:21:24', 4);
INSERT INTO `song` VALUES (29, '薛之谦 - 独角戏 (Live)', 2, 1, 0, 'uploadmusic/薛之谦 - 独角戏 (Live).mp3', 'lrc/薛之谦 - 独角戏 (Live).lrc', '2019-10-25 23:21:46', 1);
INSERT INTO `song` VALUES (30, '薛之谦 - 方圆几里', 2, 1, 0, 'uploadmusic/薛之谦 - 方圆几里.mp3', 'lrc/薛之谦 - 方圆几里.lrc', '2019-10-25 23:22:09', 5);
INSERT INTO `song` VALUES (31, '薛之谦 - 火星人来过 (Live)', 2, 1, 0, 'uploadmusic/薛之谦 - 火星人来过 (Live).mp3', 'lrc/薛之谦 - 火星人来过 (Live).lrc', '2019-10-25 23:23:04', 1);
INSERT INTO `song` VALUES (32, '薛之谦 - 慢半拍', 2, 4, 0, 'uploadmusic/薛之谦 - 慢半拍.mp3', 'lrc/薛之谦 - 慢半拍.lrc', '2019-10-25 23:23:27', NULL);
INSERT INTO `song` VALUES (33, '薛之谦 - 那是你离开了北京的生活', 2, 4, 0, 'uploadmusic/薛之谦 - 那是你离开了北京的生活.mp3', NULL, '2019-10-25 23:23:53', NULL);
INSERT INTO `song` VALUES (34, '薛之谦 - 你过得好吗', 2, 4, 0, 'uploadmusic/薛之谦 - 你过得好吗.mp3', 'lrc/薛之谦 - 你过得好吗.lrc', '2019-10-25 23:24:13', NULL);
INSERT INTO `song` VALUES (35, '薛之谦 - 你还要我怎样', 2, 4, 0, 'uploadmusic/薛之谦 - 你还要我怎样.mp3', 'lrc/薛之谦 - 你还要我怎样.lrc', '2019-10-25 23:24:33', NULL);
INSERT INTO `song` VALUES (36, '薛之谦 - 其实', 2, 1, 0, 'uploadmusic/薛之谦 - 其实.mp3', 'lrc/薛之谦 - 其实.lrc', '2019-10-25 23:24:53', 1);
INSERT INTO `song` VALUES (37, '薛之谦 - 绅士', 2, 1, 0, 'uploadmusic/薛之谦 - 绅士.mp3', 'lrc/薛之谦 - 绅士.lrc', '2019-10-25 23:25:09', 2);
INSERT INTO `song` VALUES (38, '薛之谦 - 我好像在哪见过你', 2, 1, 0, 'uploadmusic/薛之谦 - 我好像在哪见过你.mp3', 'lrc/薛之谦 - 我好像在哪见过你.lrc', '2019-10-25 23:25:25', 6);
INSERT INTO `song` VALUES (39, '薛之谦 - 我想起你了', 2, 1, 0, 'uploadmusic/薛之谦 - 我想起你了.mp3', 'lrc/薛之谦 - 我想起你了.lrc', '2019-10-25 23:25:42', NULL);
INSERT INTO `song` VALUES (40, '薛之谦 - 像风一样', 2, 4, 0, 'uploadmusic/薛之谦 - 像风一样.mp3', 'lrc/薛之谦 - 像风一样.lrc', '2019-10-25 23:26:02', NULL);
INSERT INTO `song` VALUES (41, '薛之谦 - 笑场', 2, 4, 0, 'uploadmusic/薛之谦 - 笑场.mp3', 'lrc/薛之谦 - 笑场.lrc', '2019-10-25 23:26:23', NULL);
INSERT INTO `song` VALUES (42, '薛之谦 - 一半', 2, 4, 0, 'uploadmusic/薛之谦 - 一半.mp3', 'lrc/薛之谦 - 一半.lrc', '2019-10-25 23:26:46', NULL);
INSERT INTO `song` VALUES (43, '薛之谦 - 意外', 2, 4, 0, 'uploadmusic/薛之谦 - 意外.mp3', 'lrc/薛之谦 - 意外.lrc', '2019-10-25 23:27:02', NULL);
INSERT INTO `song` VALUES (44, '薛之谦 _ 黄龄 - 来日方长', 2, 1, 0, 'uploadmusic/薛之谦 _ 黄龄 - 来日方长.mp3', 'lrc/薛之谦 _ 黄龄 - 来日方长.lrc', '2019-10-25 23:32:02', NULL);
INSERT INTO `song` VALUES (45, '薛之谦 _ 毛不易 - 下雨了 (Live)', 2, 1, 0, 'uploadmusic/薛之谦 _ 毛不易 - 下雨了 (Live).mp3', 'lrc/薛之谦 _ 毛不易 - 下雨了 (Live).lrc', '2019-10-25 23:32:18', NULL);
INSERT INTO `song` VALUES (46, '薛之谦 _ 毛不易 - 消愁 (Live)', 2, 1, 0, 'uploadmusic/薛之谦 _ 毛不易 - 消愁 (Live).mp3', 'lrc/薛之谦 _ 毛不易 - 消愁 (Live).lrc', '2019-10-25 23:32:33', NULL);
INSERT INTO `song` VALUES (47, '杨沛宜 - 歌唱祖国', 43, 3, 1, 'uploadmusic/杨沛宜 - 歌唱祖国.mp3', 'lrc/杨沛宜 - 歌唱祖国.lrc', '2019-10-25 23:33:01', NULL);
INSERT INTO `song` VALUES (48, '张玥 - 茉莉花', 44, 3, 1, 'uploadmusic/张玥 - 茉莉花.mp3', 'lrc/张玥 - 茉莉花.lrc', '2019-10-25 23:33:38', NULL);
INSERT INTO `song` VALUES (49, '中央人民广播电台少年广播合唱团 - 我们的田野', 45, 3, 4, 'uploadmusic/中央人民广播电台少年广播合唱团 - 我们的田野.mp3', 'lrc/中央人民广播电台少年广播合唱团 - 我们的田野.lrc', '2019-10-25 23:34:10', NULL);

-- ----------------------------
-- Table structure for type
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type`  (
  `Tid` bigint(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Tid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of type
-- ----------------------------
INSERT INTO `type` VALUES (1, '经典音乐');
INSERT INTO `type` VALUES (2, '摇滚音乐');
INSERT INTO `type` VALUES (3, '儿歌');
INSERT INTO `type` VALUES (4, '流行音乐');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` tinyint(1) NULL DEFAULT NULL,
  `age` bigint(11) NULL DEFAULT NULL,
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `username` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `last_login_time` datetime(0) NULL DEFAULT NULL,
  `vip` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `e_mail` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `state` tinyint(1) NULL DEFAULT NULL,
  `code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (7, 'ADMIN', '刘晓凯', 1, 20, '123456', 'liuxiaokai', '2019-10-29 13:18:55', 'NONVIP', '502520409@qq.com', 1, '2ba60fc81f314a109fc6a2e6ca55ec5c');
INSERT INTO `user` VALUES (22, 'USER', '张三', 1, 22, '123456', 'zhangsan', NULL, NULL, 'www.113720836@qq.com', 0, '3944a19324d547468d0ce0dbfd60f116');
INSERT INTO `user` VALUES (23, 'USER', '刘晓朋', 1, 18, '123456', 'liuxiaopeng', '2019-10-24 16:37:42', NULL, '502520409@qq.com', 1, '339bda83ec8e4b5eb3ba77e1e1632a47');
INSERT INTO `user` VALUES (30, 'USER', '王二麻子', 1, 60, '123456', 'wemz', '2019-10-23 21:28:19', NULL, '502520409@qq.com', 1, 'c358fa3062de45698e7079c986c3f578');
INSERT INTO `user` VALUES (31, 'USER', '毛创', 1, 22, '123456', 'maochuang', '2019-10-29 09:45:10', NULL, '2062205503@qq.com', 1, 'cc275e40fdc74c8ab428c0b707af9d32');

SET FOREIGN_KEY_CHECKS = 1;
