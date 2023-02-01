-- DropForeignKey
ALTER TABLE `Feedback` DROP FOREIGN KEY `Feedback_lect_id_fkey`;

-- DropForeignKey
ALTER TABLE `Problem` DROP FOREIGN KEY `Problem_sid_fkey`;

-- AlterTable
ALTER TABLE `Feedback` ADD COLUMN `lecturerId` INTEGER NULL;

-- AlterTable
ALTER TABLE `Problem` ADD COLUMN `studentId` INTEGER NULL;

-- AddForeignKey
ALTER TABLE `Problem` ADD CONSTRAINT `Problem_sid_fkey` FOREIGN KEY (`sid`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Problem` ADD CONSTRAINT `Problem_studentId_fkey` FOREIGN KEY (`studentId`) REFERENCES `Student`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Feedback` ADD CONSTRAINT `Feedback_lect_id_fkey` FOREIGN KEY (`lect_id`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Feedback` ADD CONSTRAINT `Feedback_lecturerId_fkey` FOREIGN KEY (`lecturerId`) REFERENCES `Lecturer`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;
