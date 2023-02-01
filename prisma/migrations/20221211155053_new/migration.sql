/*
  Warnings:

  - You are about to drop the column `user_avater` on the `User` table. All the data in the column will be lost.
  - Added the required column `avater` to the `Admin` table without a default value. This is not possible if the table is not empty.
  - Added the required column `avater` to the `Lecturer` table without a default value. This is not possible if the table is not empty.
  - Added the required column `avater` to the `Student` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `Admin` ADD COLUMN `avater` VARCHAR(191) NOT NULL;

-- AlterTable
ALTER TABLE `Lecturer` ADD COLUMN `avater` VARCHAR(191) NOT NULL;

-- AlterTable
ALTER TABLE `Student` ADD COLUMN `avater` VARCHAR(191) NOT NULL;

-- AlterTable
ALTER TABLE `User` DROP COLUMN `user_avater`;
