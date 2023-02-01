/*
  Warnings:

  - You are about to drop the column `stu_id` on the `Problem` table. All the data in the column will be lost.
  - You are about to drop the column `stuid` on the `Student` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[stu_id]` on the table `Student` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `sid` to the `Problem` table without a default value. This is not possible if the table is not empty.
  - Added the required column `stu_id` to the `Student` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `Problem` DROP FOREIGN KEY `Problem_stu_id_fkey`;

-- DropIndex
DROP INDEX `Student_stuid_key` ON `Student`;

-- AlterTable
ALTER TABLE `Problem` DROP COLUMN `stu_id`,
    ADD COLUMN `sid` INTEGER NOT NULL;

-- AlterTable
ALTER TABLE `Student` DROP COLUMN `stuid`,
    ADD COLUMN `stu_id` VARCHAR(191) NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX `Student_stu_id_key` ON `Student`(`stu_id`);

-- AddForeignKey
ALTER TABLE `Problem` ADD CONSTRAINT `Problem_sid_fkey` FOREIGN KEY (`sid`) REFERENCES `Student`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
