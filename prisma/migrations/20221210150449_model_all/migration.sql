/*
  Warnings:

  - You are about to drop the `User_Lecturer` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `User_Student` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `admin` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
DROP TABLE `User_Lecturer`;

-- DropTable
DROP TABLE `User_Student`;

-- DropTable
DROP TABLE `admin`;

-- CreateTable
CREATE TABLE `Login` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `login_username` VARCHAR(191) NOT NULL,
    `login_password` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `roles` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `role_name` VARCHAR(191) NOT NULL,
    `role_desc` VARCHAR(191) NOT NULL,
    `login_id` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `User` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `username` VARCHAR(191) NOT NULL,
    `roles_id` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Student` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `stu_username` VARCHAR(191) NOT NULL,
    `stu_email` VARCHAR(191) NOT NULL,
    `stu_major` VARCHAR(191) NOT NULL,
    `stu_grade` VARCHAR(191) NOT NULL,
    `stu_faculty` VARCHAR(191) NOT NULL,
    `stu_avatar` VARCHAR(191) NOT NULL,
    `userId` INTEGER NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Lecture` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `lect_username` VARCHAR(191) NOT NULL,
    `lect_email` VARCHAR(191) NOT NULL,
    `lect_avater` VARCHAR(191) NOT NULL,
    `lect_roomnum` VARCHAR(191) NOT NULL,
    `userId` INTEGER NULL,
    `feedbackId` INTEGER NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Admin` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `admin_username` VARCHAR(191) NOT NULL,
    `admin_email` VARCHAR(191) NOT NULL,
    `userId` INTEGER NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Problem` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `pro_type` VARCHAR(191) NOT NULL,
    `pro_desc` VARCHAR(191) NOT NULL,
    `pro_image` VARCHAR(191) NOT NULL,
    `studentId` INTEGER NULL,
    `feedbackId` INTEGER NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Feedback` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `feed_massage` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `roles` ADD CONSTRAINT `roles_login_id_fkey` FOREIGN KEY (`login_id`) REFERENCES `Login`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `User` ADD CONSTRAINT `User_roles_id_fkey` FOREIGN KEY (`roles_id`) REFERENCES `roles`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Student` ADD CONSTRAINT `Student_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Lecture` ADD CONSTRAINT `Lecture_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Lecture` ADD CONSTRAINT `Lecture_feedbackId_fkey` FOREIGN KEY (`feedbackId`) REFERENCES `Feedback`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Admin` ADD CONSTRAINT `Admin_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Problem` ADD CONSTRAINT `Problem_studentId_fkey` FOREIGN KEY (`studentId`) REFERENCES `Student`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Problem` ADD CONSTRAINT `Problem_feedbackId_fkey` FOREIGN KEY (`feedbackId`) REFERENCES `Feedback`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;
