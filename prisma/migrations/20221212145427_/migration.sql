-- DropForeignKey
ALTER TABLE `Student` DROP FOREIGN KEY `Student_pro_id_fkey`;

-- AlterTable
ALTER TABLE `Student` MODIFY `pro_id` INTEGER NULL;

-- AddForeignKey
ALTER TABLE `Student` ADD CONSTRAINT `Student_pro_id_fkey` FOREIGN KEY (`pro_id`) REFERENCES `Problem`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;
