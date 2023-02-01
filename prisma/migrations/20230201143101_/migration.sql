/*
  Warnings:

  - You are about to drop the column `lecturerId` on the `Feedback` table. All the data in the column will be lost.
  - You are about to drop the column `studentId` on the `Problem` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE `Feedback` DROP FOREIGN KEY `Feedback_lect_id_fkey`;

-- DropForeignKey
ALTER TABLE `Feedback` DROP FOREIGN KEY `Feedback_lecturerId_fkey`;

-- DropForeignKey
ALTER TABLE `Problem` DROP FOREIGN KEY `Problem_sid_fkey`;

-- DropForeignKey
ALTER TABLE `Problem` DROP FOREIGN KEY `Problem_studentId_fkey`;

-- AlterTable
ALTER TABLE `Feedback` DROP COLUMN `lecturerId`,
    ADD COLUMN `userId` INTEGER NULL;

-- AlterTable
ALTER TABLE `Problem` DROP COLUMN `studentId`,
    ADD COLUMN `userId` INTEGER NULL;

-- AddForeignKey
ALTER TABLE `Problem` ADD CONSTRAINT `Problem_sid_fkey` FOREIGN KEY (`sid`) REFERENCES `Student`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Problem` ADD CONSTRAINT `Problem_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Feedback` ADD CONSTRAINT `Feedback_lect_id_fkey` FOREIGN KEY (`lect_id`) REFERENCES `Lecturer`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Feedback` ADD CONSTRAINT `Feedback_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;
