/*
  Warnings:

  - A unique constraint covering the columns `[user_id]` on the table `Task` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `user_id` to the `Task` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `task` ADD COLUMN `user_id` INTEGER NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX `Task_user_id_key` ON `Task`(`user_id`);

-- AddForeignKey
ALTER TABLE `Task` ADD CONSTRAINT `Task_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
