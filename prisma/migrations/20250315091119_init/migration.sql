/*
  Warnings:

  - The primary key for the `profile` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the `modules` table. If the table is not empty, all the data it contains will be lost.
  - A unique constraint covering the columns `[userId]` on the table `Profile` will be added. If there are existing duplicate values, this will fail.
  - The required column `id` was added to the `Profile` table with a prisma-level default value. This is not possible if the table is not empty. Please add this column as optional, then populate it before making it required.

*/
-- DropForeignKey
ALTER TABLE `modules` DROP FOREIGN KEY `Modules_accountCode_fkey`;

-- DropForeignKey
ALTER TABLE `profile` DROP FOREIGN KEY `Profile_userId_fkey`;

-- AlterTable
ALTER TABLE `profile` DROP PRIMARY KEY,
    ADD COLUMN `id` VARCHAR(191) NOT NULL,
    ADD PRIMARY KEY (`id`);

-- DropTable
DROP TABLE `modules`;

-- CreateTable
CREATE TABLE `Module` (
    `recID` VARCHAR(191) NOT NULL,
    `accountCode` VARCHAR(191) NOT NULL,
    `moduleCode` VARCHAR(191) NOT NULL,
    `moduleDetails` VARCHAR(191) NULL,
    `moduleDesc` VARCHAR(191) NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updateAt` DATETIME(3) NOT NULL,

    PRIMARY KEY (`recID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateIndex
CREATE UNIQUE INDEX `Profile_userId_key` ON `Profile`(`userId`);

-- AddForeignKey
ALTER TABLE `Profile` ADD CONSTRAINT `Profile_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `Account`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Module` ADD CONSTRAINT `Module_accountCode_fkey` FOREIGN KEY (`accountCode`) REFERENCES `Account`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
