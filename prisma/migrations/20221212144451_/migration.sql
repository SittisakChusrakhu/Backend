/*
  Warnings:

  - You are about to drop the column `avater` on the `Admin` table. All the data in the column will be lost.
  - You are about to drop the column `avater` on the `Lecturer` table. All the data in the column will be lost.
  - You are about to drop the column `avater` on the `Student` table. All the data in the column will be lost.
  - Added the required column `avatar` to the `Admin` table without a default value. This is not possible if the table is not empty.
  - Added the required column `avatar` to the `Lecturer` table without a default value. This is not possible if the table is not empty.
  - Added the required column `avatar` to the `Student` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `Admin` DROP COLUMN `avater`,
    ADD COLUMN `avatar` VARCHAR(191) NOT NULL;

-- AlterTable
ALTER TABLE `Lecturer` DROP COLUMN `avater`,
    ADD COLUMN `avatar` VARCHAR(191) NOT NULL;

-- AlterTable
ALTER TABLE `Student` DROP COLUMN `avater`,
    ADD COLUMN `avatar` VARCHAR(191) NOT NULL;
