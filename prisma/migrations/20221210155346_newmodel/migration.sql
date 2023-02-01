/*
  Warnings:

  - You are about to drop the column `login_id` on the `roles` table. All the data in the column will be lost.
  - Added the required column `loginid` to the `roles` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `roles` DROP FOREIGN KEY `roles_login_id_fkey`;

-- AlterTable
ALTER TABLE `roles` DROP COLUMN `login_id`,
    ADD COLUMN `loginid` INTEGER NOT NULL;

-- AddForeignKey
ALTER TABLE `roles` ADD CONSTRAINT `roles_loginid_fkey` FOREIGN KEY (`loginid`) REFERENCES `Login`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
