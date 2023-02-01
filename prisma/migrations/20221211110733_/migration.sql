/*
  Warnings:

  - A unique constraint covering the columns `[role_name]` on the table `roles` will be added. If there are existing duplicate values, this will fail.

*/
-- DropIndex
DROP INDEX `Student_id_key` ON `Student`;

-- CreateIndex
CREATE UNIQUE INDEX `roles_role_name_key` ON `roles`(`role_name`);
