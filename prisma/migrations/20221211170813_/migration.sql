/*
  Warnings:

  - You are about to drop the column `user_eamil` on the `User` table. All the data in the column will be lost.
  - Added the required column `user_email` to the `User` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `User` DROP COLUMN `user_eamil`,
    ADD COLUMN `user_email` VARCHAR(191) NOT NULL;
