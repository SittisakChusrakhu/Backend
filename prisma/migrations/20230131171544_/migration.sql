/*
  Warnings:

  - You are about to drop the column `pro_id` on the `Student` table. All the data in the column will be lost.
  - You are about to drop the column `stu_id` on the `Student` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[stuid]` on the table `Student` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `stu_id` to the `Feedback` table without a default value. This is not possible if the table is not empty.
  - Added the required column `stu_id` to the `Problem` table without a default value. This is not possible if the table is not empty.
  - Added the required column `stuid` to the `Student` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `Student` DROP FOREIGN KEY `Student_pro_id_fkey`;

-- DropIndex
DROP INDEX `Student_stu_id_key` ON `Student`;

-- AlterTable
ALTER TABLE `Feedback` ADD COLUMN `stu_id` INTEGER NOT NULL;

-- AlterTable
ALTER TABLE `Problem` ADD COLUMN `stu_id` INTEGER NOT NULL;

-- AlterTable
ALTER TABLE `Student` DROP COLUMN `pro_id`,
    DROP COLUMN `stu_id`,
    ADD COLUMN `stuid` VARCHAR(191) NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX `Student_stuid_key` ON `Student`(`stuid`);

-- AddForeignKey
ALTER TABLE `Problem` ADD CONSTRAINT `Problem_stu_id_fkey` FOREIGN KEY (`stu_id`) REFERENCES `Student`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Feedback` ADD CONSTRAINT `Feedback_stu_id_fkey` FOREIGN KEY (`stu_id`) REFERENCES `Student`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
