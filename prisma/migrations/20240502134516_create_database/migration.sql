-- CreateTable
CREATE TABLE `User` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `email` VARCHAR(191) NOT NULL,
    `password` VARCHAR(255) NOT NULL,

    UNIQUE INDEX `User_email_key`(`email`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Proje` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `proje_name` VARCHAR(255) NOT NULL,
    `user_id` INTEGER NOT NULL,

    UNIQUE INDEX `Proje_user_id_key`(`user_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Task` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `task_name` VARCHAR(255) NOT NULL,
    `proje_id` INTEGER NOT NULL,
    `is_completed` BOOLEAN NOT NULL DEFAULT false,
    `order` INTEGER NOT NULL,

    UNIQUE INDEX `Task_order_key`(`order`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Proje` ADD CONSTRAINT `Proje_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Task` ADD CONSTRAINT `Task_proje_id_fkey` FOREIGN KEY (`proje_id`) REFERENCES `Proje`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
