/*
  Warnings:

  - You are about to drop the column `admin_id` on the `roles` table. All the data in the column will be lost.
  - You are about to drop the column `lect_id` on the `roles` table. All the data in the column will be lost.
  - You are about to drop the column `stu_id` on the `roles` table. All the data in the column will be lost.
  - Added the required column `user_id` to the `Admin` table without a default value. This is not possible if the table is not empty.
  - Added the required column `user_id` to the `Lecturer` table without a default value. This is not possible if the table is not empty.
  - Added the required column `user_id` to the `Student` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `roles` DROP FOREIGN KEY `roles_admin_id_fkey`;

-- DropForeignKey
ALTER TABLE `roles` DROP FOREIGN KEY `roles_lect_id_fkey`;

-- DropForeignKey
ALTER TABLE `roles` DROP FOREIGN KEY `roles_stu_id_fkey`;

-- DropIndex
DROP INDEX `roles_role_name_key` ON `roles`;

-- AlterTable
ALTER TABLE `Admin` ADD COLUMN `user_id` INTEGER NOT NULL;

-- AlterTable
ALTER TABLE `Lecturer` ADD COLUMN `user_id` INTEGER NOT NULL;

-- AlterTable
ALTER TABLE `Student` ADD COLUMN `user_id` INTEGER NOT NULL;

-- AlterTable
ALTER TABLE `roles` DROP COLUMN `admin_id`,
    DROP COLUMN `lect_id`,
    DROP COLUMN `stu_id`;

-- AddForeignKey
ALTER TABLE `Student` ADD CONSTRAINT `Student_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Lecturer` ADD CONSTRAINT `Lecturer_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Admin` ADD CONSTRAINT `Admin_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
