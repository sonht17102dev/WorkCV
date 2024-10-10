DROP DATABASE  IF EXISTS `spring_workcv`;

CREATE DATABASE  `spring_workcv`;

use `spring_workcv`;

ALTER DATABASE spring_workcv CHARACTER SET 'utf8mb4';


SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(255)  NULL,
  `description` TEXT  NULL,
  `email` varchar(100) DEFAULT NULL,
  `full_name` nvarchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `cv_id` int(11) DEFAULT NULL,
  `is_verified` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_ROLE` FOREIGN KEY (`role_id`) 
  REFERENCES `role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION 
) ENGINE=InnoDB AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `cv`;
CREATE TABLE `cv` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `number_choose` int(11) DEFAULT NULL,
  `recruitment_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1;

DROP TABLE IF EXISTS `company`;
CREATE TABLE `company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `description` TEXT DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `name_company` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,  
  `user_id` int(11) DEFAULT NULL,

  PRIMARY KEY (`id`),
  CONSTRAINT `FK_USER` FOREIGN KEY (`user_id`) 
  REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1;



DROP TABLE IF EXISTS `recruitment`;
CREATE TABLE `recruitment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `created_at` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `experience` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `ranked` varchar(255) DEFAULT NULL,
  `salary` varchar(255) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `view` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `deadline` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_COMPANY` FOREIGN KEY (`company_id`) 
  REFERENCES `company` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_RECRUITMENT_CATEGORY` FOREIGN KEY (`category_id`) 
  REFERENCES `category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION 
) ENGINE=InnoDB AUTO_INCREMENT=1;

DROP TABLE IF EXISTS `applypost`;
CREATE TABLE `applypost` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` varchar(255) DEFAULT NULL,
  `recruitment_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name_cv` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,  
  `text` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_USER_APPLYPOST` FOREIGN KEY (`user_id`) 
  REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_RECRUITMENT` FOREIGN KEY (`recruitment_id`) 
  REFERENCES `recruitment` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1;

DROP TABLE IF EXISTS `save_job`;
CREATE TABLE `save_job` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `recruitment_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_USER_SAVEJOB` FOREIGN KEY (`user_id`) 
  REFERENCES `user` (`id`) 
  ON DELETE NO ACTION ON UPDATE NO ACTION,
  
  CONSTRAINT `FK_RECRUITMENT_SAVEJOB` FOREIGN KEY (`recruitment_id`) 
  REFERENCES `recruitment` (`id`) 
  ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `follow_company`;
CREATE TABLE `follow_company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_USER_FOLLOW` FOREIGN KEY (`user_id`) 
  REFERENCES `user` (`id`) 
  ON DELETE NO ACTION ON UPDATE NO ACTION,
  
  CONSTRAINT `FK_COMPANY_FOLLOW` FOREIGN KEY (`company_id`) 
  REFERENCES `company` (`id`) 
  ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET FOREIGN_KEY_CHECKS = 1;

-- add data samples
INSERT INTO role (role_name) VALUES ('user'),('recruiter');

-- add data samples
INSERT INTO user (address, description, email, full_name, image, password, phone_number, status, role_id, cv_id, is_verified) VALUES
('Thành phố HCM', 'mô tả 1', 'test@gmail.com', 'Hương Phạm', 'person_1.jpg', 'Zxc!1234','1234567890', 'active', 1, 1, 1),
('Thành phố Hà Nội', 'mô tả 2', 'test1@gmail.com', 'FPT Software', 'person_2.jpg', 'Zxc!1234','1234567890', 'active', 2, 2, 1),
('Thành phố Đà Nẵng', 'mô tả 3', 'test2@gmail.com', 'Nam Nguyễn', 'person_3.jpg', 'Zxc!1234','1234567890', 'active', 1, 3, 1),
('Thành phố Hà Nội', 'mô tả 4', 'test3@gmail.com', 'Viettel digital', 'person_3.jpg', 'Zxc!1234','1234567890', 'active', 2, 4, 1),
('Thành phố HCM', 'mô tả 5', 'test4@gmail.com', 'Minh Nguyễn', 'person_4.jpg', 'Zxc!1234','1234567890', 'active', 1, 5, 1);

INSERT INTO cv (file_name) VALUES 
('1636909614848chotot.pdf'),
('1636909614848chotot.pdf'),
('1636909614848chotot.pdf'),
('1636909614848chotot.pdf'),
('1636909614848chotot.pdf');

INSERT INTO company (address, description, email, logo, name_company, phone_number, status, user_id) VALUES
('Đà Nẵng', 'Tham gia dự án Logistic ứng viên nhận SIGNING BONUS iphone 12 pro-max', 'tuyendungnhansu@gmail.com',
'FPT_logo.jpg', 'FPT Software', '0394073712', 'active', 2),
('Hà Nội', 'Tổng Công ty Dịch vụ số Viettel (Viettel Digital) – Tổng Công ty thành viên thứ 8 của Tập đoàn Công nghiệp – Viễn thông Quân đội.', 
'tuyendungvietteldigital@gmail.com',
'Viettel_logo.png', 
'Viettel Digital', '0989888888', 'active', 4);

INSERT INTO category (name, number_choose) VALUES
('NODEJS', 4), ('PHP', 2), ('JAVA', 2), ('ASP.NET', 1), ('.NET', 1), ('REACT', 1);

INSERT INTO recruitment 
(`address`, `created_at`, `description`, `experience`, `quantity`, `ranked`, `salary`, 
`status`, `title`, `type`, `view`, `category_id`, `company_id`, `deadline`) 
VALUES
('Đà Nẵng', '2024-09-16', '.NET > 2 năm kinh nghiệm', '2 năm', 12, 1, '12 triệu', 'active', 'Tuyển lập trình viên .NET',
'fulltime', 0, 5, 1, '2024-10-30'),
('Hà Nội', '2024-09-19', 'JAVA > 5 năm kinh nghiệm', '5 năm', 5, 2, '30 triệu', 'active', 'Tuyển JAVA DEVELOPER 5 năm exp',
'fulltime', 0, 3, 2, '2024-10-30');

INSERT INTO applypost (created_at, recruitment_id, user_id, name_cv, status, text) VALUES 
('2024-09-16', 1, 1, '1636909614848chotot.pdf', 0, 'Giới thiệu 1'),
('2024-09-16', 1, 3, '1636909614848chotot.pdf', 0, 'Giới thiệu 2'),
('2024-09-19', 2, 5, '1636909614848chotot.pdf', 0, 'Giới thiệu 3'); 

INSERT INTO save_job (recruitment_id, user_id) VALUES 
(1, 1),
(2, 1),
(2, 3); 

INSERT INTO follow_company (company_id, user_id) VALUES 
(1, 1),
(2, 1),
(2, 3); 