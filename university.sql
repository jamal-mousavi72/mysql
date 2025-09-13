/*
 Navicat Premium Dump SQL

 Source Server         : myProjects
 Source Server Type    : MySQL
 Source Server Version : 100432 (10.4.32-MariaDB)
 Source Host           : localhost:3306
 Source Schema         : univercity

 Target Server Type    : MySQL
 Target Server Version : 100432 (10.4.32-MariaDB)
 File Encoding         : 65001

 Date: 13/09/2025 08:47:19
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for coures
-- ----------------------------
DROP TABLE IF EXISTS `coures`;
CREATE TABLE `coures`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_persian_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = utf8 COLLATE = utf8_persian_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of coures
-- ----------------------------
INSERT INTO `coures` VALUES (1, 'PHP');
INSERT INTO `coures` VALUES (2, 'Java');
INSERT INTO `coures` VALUES (3, 'Python');
INSERT INTO `coures` VALUES (4, 'HTML5');
INSERT INTO `coures` VALUES (5, 'CSS3');
INSERT INTO `coures` VALUES (6, 'SQL');
INSERT INTO `coures` VALUES (7, 'NoSQL');
INSERT INTO `coures` VALUES (8, 'NewSQL');
INSERT INTO `coures` VALUES (9, 'Math');

-- ----------------------------
-- Table structure for professores
-- ----------------------------
DROP TABLE IF EXISTS `professores`;
CREATE TABLE `professores`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_persian_ci NULL DEFAULT NULL,
  `last_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_persian_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_persian_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of professores
-- ----------------------------
INSERT INTO `professores` VALUES (1, 'Payam', 'Ahmadi');
INSERT INTO `professores` VALUES (2, 'Ali', 'Alvandi');
INSERT INTO `professores` VALUES (3, 'Hadi', 'Kazemi');
INSERT INTO `professores` VALUES (4, 'Sara', 'Bahari');
INSERT INTO `professores` VALUES (5, 'Hassan', 'Nouri');

-- ----------------------------
-- Table structure for student_course
-- ----------------------------
DROP TABLE IF EXISTS `student_course`;
CREATE TABLE `student_course`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `student_id` int UNSIGNED NULL DEFAULT NULL COMMENT 'اشاره به شناسه جدول دانشجو',
  `course_id` int UNSIGNED NULL DEFAULT NULL COMMENT 'اشاره به شناسه جدول درس',
  `professor_id` int UNSIGNED NULL DEFAULT NULL COMMENT 'اشاره به جدول استادان',
  `term` varchar(10) CHARACTER SET utf8 COLLATE utf8_persian_ci NULL DEFAULT NULL COMMENT 'ترم',
  `grade` float NULL DEFAULT NULL COMMENT 'نمره',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_student_id`(`student_id` ASC) USING BTREE,
  INDEX `FK_course_id`(`course_id` ASC) USING BTREE,
  INDEX `FK_professor_id`(`professor_id` ASC) USING BTREE,
  CONSTRAINT `FK_course_id` FOREIGN KEY (`course_id`) REFERENCES `coures` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_professor_id` FOREIGN KEY (`professor_id`) REFERENCES `professores` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_student_id` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_persian_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of student_course
-- ----------------------------
INSERT INTO `student_course` VALUES (1, 1, 1, 1, '1400', 18);
INSERT INTO `student_course` VALUES (2, 1, 2, 4, '1400', 18);
INSERT INTO `student_course` VALUES (3, 2, 1, 4, '1400', 12.25);
INSERT INTO `student_course` VALUES (4, 3, 5, 4, '1400', 20);
INSERT INTO `student_course` VALUES (5, 4, 6, 4, '1400', 15);
INSERT INTO `student_course` VALUES (6, 5, 2, 4, '1400', 15.5);
INSERT INTO `student_course` VALUES (7, 1, 3, 4, '1400', 17.25);
INSERT INTO `student_course` VALUES (8, 2, 6, 4, '1400', 13.75);

-- ----------------------------
-- Table structure for students
-- ----------------------------
DROP TABLE IF EXISTS `students`;
CREATE TABLE `students`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_persian_ci NULL DEFAULT NULL,
  `last_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_persian_ci NULL DEFAULT NULL,
  `age` smallint NULL DEFAULT NULL,
  `gender` enum('Male','Female') CHARACTER SET utf8 COLLATE utf8_persian_ci NULL DEFAULT NULL,
  `Blood_Type` enum('A','B','AB','O') CHARACTER SET utf8 COLLATE utf8_persian_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_persian_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of students
-- ----------------------------
INSERT INTO `students` VALUES (1, 'Ali', 'Karimi', 35, 'Male', 'A');
INSERT INTO `students` VALUES (2, 'Reza', 'Bahari', 20, 'Male', 'B');
INSERT INTO `students` VALUES (3, 'AliReza', 'Nouri', 35, 'Male', 'AB');
INSERT INTO `students` VALUES (4, 'Ahmad', 'Bagheri', 21, 'Male', 'O');
INSERT INTO `students` VALUES (5, 'AhmadReza', 'Sabouri', 23, 'Male', 'O');
INSERT INTO `students` VALUES (6, 'Sara', 'Rad', 35, 'Female', 'O');
INSERT INTO `students` VALUES (7, 'Maryam', 'Kermani', 22, 'Female', 'A');

SET FOREIGN_KEY_CHECKS = 1;
