/*
  Warnings:

  - Added the required column `lect_id` to the `Problem` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `Problem` ADD COLUMN `lect_id` INTEGER NOT NULL;

-- AddForeignKey
ALTER TABLE `Problem` ADD CONSTRAINT `Problem_lect_id_fkey` FOREIGN KEY (`lect_id`) REFERENCES `Lecturer`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
