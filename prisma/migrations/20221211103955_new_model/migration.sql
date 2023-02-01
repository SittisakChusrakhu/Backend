/*
  Warnings:

  - You are about to drop the column `admin_email` on the `Admin` table. All the data in the column will be lost.
  - You are about to drop the column `admin_username` on the `Admin` table. All the data in the column will be lost.
  - You are about to drop the column `userId` on the `Admin` table. All the data in the column will be lost.
  - You are about to drop the column `feedbackId` on the `Problem` table. All the data in the column will be lost.
  - You are about to drop the column `studentId` on the `Problem` table. All the data in the column will be lost.
  - You are about to drop the column `stu_avatar` on the `Student` table. All the data in the column will be lost.
  - You are about to drop the column `stu_email` on the `Student` table. All the data in the column will be lost.
  - You are about to drop the column `stu_username` on the `Student` table. All the data in the column will be lost.
  - You are about to drop the column `userId` on the `Student` table. All the data in the column will be lost.
  - You are about to drop the column `roles_id` on the `User` table. All the data in the column will be lost.
  - You are about to drop the `Lecture` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `lect_id` to the `Feedback` table without a default value. This is not possible if the table is not empty.
  - Added the required column `pro_id` to the `Feedback` table without a default value. This is not possible if the table is not empty.
  - Added the required column `pro_id` to the `Student` table without a default value. This is not possible if the table is not empty.
  - Added the required column `role_id` to the `User` table without a default value. This is not possible if the table is not empty.
  - Added the required column `user_avater` to the `User` table without a default value. This is not possible if the table is not empty.
  - Added the required column `user_eamil` to the `User` table without a default value. This is not possible if the table is not empty.
  - Added the required column `admin_id` to the `roles` table without a default value. This is not possible if the table is not empty.
  - Added the required column `lect_id` to the `roles` table without a default value. This is not possible if the table is not empty.
  - Added the required column `stu_id` to the `roles` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `Admin` DROP FOREIGN KEY `Admin_userId_fkey`;

-- DropForeignKey
ALTER TABLE `Lecture` DROP FOREIGN KEY `Lecture_feedbackId_fkey`;

-- DropForeignKey
ALTER TABLE `Lecture` DROP FOREIGN KEY `Lecture_userId_fkey`;

-- DropForeignKey
ALTER TABLE `Problem` DROP FOREIGN KEY `Problem_feedbackId_fkey`;

-- DropForeignKey
ALTER TABLE `Problem` DROP FOREIGN KEY `Problem_studentId_fkey`;

-- DropForeignKey
ALTER TABLE `Student` DROP FOREIGN KEY `Student_userId_fkey`;

-- DropForeignKey
ALTER TABLE `User` DROP FOREIGN KEY `User_roles_id_fkey`;

-- DropIndex
DROP INDEX `User_user_name_key` ON `User`;

-- AlterTable
ALTER TABLE `Admin` DROP COLUMN `admin_email`,
    DROP COLUMN `admin_username`,
    DROP COLUMN `userId`;

-- AlterTable
ALTER TABLE `Feedback` ADD COLUMN `lect_id` INTEGER NOT NULL,
    ADD COLUMN `pro_id` INTEGER NOT NULL;

-- AlterTable
ALTER TABLE `Problem` DROP COLUMN `feedbackId`,
    DROP COLUMN `studentId`;

-- AlterTable
ALTER TABLE `Student` DROP COLUMN `stu_avatar`,
    DROP COLUMN `stu_email`,
    DROP COLUMN `stu_username`,
    DROP COLUMN `userId`,
    ADD COLUMN `pro_id` INTEGER NOT NULL;

-- AlterTable
ALTER TABLE `User` DROP COLUMN `roles_id`,
    ADD COLUMN `role_id` INTEGER NOT NULL,
    ADD COLUMN `user_avater` VARCHAR(191) NOT NULL,
    ADD COLUMN `user_eamil` VARCHAR(191) NOT NULL;

-- AlterTable
ALTER TABLE `roles` ADD COLUMN `admin_id` INTEGER NOT NULL,
    ADD COLUMN `lect_id` INTEGER NOT NULL,
    ADD COLUMN `stu_id` INTEGER NOT NULL;

-- DropTable
DROP TABLE `Lecture`;

-- CreateTable
CREATE TABLE `Lecturer` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `lect_roomnum` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `User` ADD CONSTRAINT `User_role_id_fkey` FOREIGN KEY (`role_id`) REFERENCES `roles`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `roles` ADD CONSTRAINT `roles_stu_id_fkey` FOREIGN KEY (`stu_id`) REFERENCES `Student`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `roles` ADD CONSTRAINT `roles_lect_id_fkey` FOREIGN KEY (`lect_id`) REFERENCES `Lecturer`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `roles` ADD CONSTRAINT `roles_admin_id_fkey` FOREIGN KEY (`admin_id`) REFERENCES `Admin`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Student` ADD CONSTRAINT `Student_pro_id_fkey` FOREIGN KEY (`pro_id`) REFERENCES `Problem`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Feedback` ADD CONSTRAINT `Feedback_pro_id_fkey` FOREIGN KEY (`pro_id`) REFERENCES `Problem`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Feedback` ADD CONSTRAINT `Feedback_lect_id_fkey` FOREIGN KEY (`lect_id`) REFERENCES `Lecturer`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
