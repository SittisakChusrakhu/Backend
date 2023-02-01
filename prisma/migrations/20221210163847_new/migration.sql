/*
  Warnings:

  - You are about to drop the column `username` on the `User` table. All the data in the column will be lost.
  - You are about to drop the column `loginid` on the `roles` table. All the data in the column will be lost.
  - You are about to drop the `Login` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `user_name` to the `User` table without a default value. This is not possible if the table is not empty.
  - Added the required column `user_password` to the `User` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `roles` DROP FOREIGN KEY `roles_loginid_fkey`;

-- AlterTable
ALTER TABLE `User` DROP COLUMN `username`,
    ADD COLUMN `user_name` VARCHAR(191) NOT NULL,
    ADD COLUMN `user_password` VARCHAR(191) NOT NULL;

-- AlterTable
ALTER TABLE `roles` DROP COLUMN `loginid`;

-- DropTable
DROP TABLE `Login`;
