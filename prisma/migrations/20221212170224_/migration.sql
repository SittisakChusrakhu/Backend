/*
  Warnings:

  - A unique constraint covering the columns `[stu_id]` on the table `Student` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[user_email]` on the table `User` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `stu_id` to the `Student` table without a default value. This is not possible if the table is not empty.

*/
-- DropIndex
DROP INDEX `User_user_name_key` ON `User`;

-- AlterTable
ALTER TABLE `Student` ADD COLUMN `stu_id` INTEGER NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX `Student_stu_id_key` ON `Student`(`stu_id`);

-- CreateIndex
CREATE UNIQUE INDEX `User_user_email_key` ON `User`(`user_email`);
