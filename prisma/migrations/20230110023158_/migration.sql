/*
  Warnings:

  - Added the required column `pro_title` to the `Problem` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `Problem` ADD COLUMN `pro_title` VARCHAR(191) NOT NULL;
