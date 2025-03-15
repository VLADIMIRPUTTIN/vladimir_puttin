/*
  Warnings:

  - You are about to drop the column `accountCode` on the `modules` table. All the data in the column will be lost.
  - Added the required column `accountId` to the `Modules` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `modules` DROP FOREIGN KEY `Modules_accountCode_fkey`;

-- DropIndex
DROP INDEX `Modules_accountCode_fkey` ON `modules`;

-- AlterTable
ALTER TABLE `modules` DROP COLUMN `accountCode`,
    ADD COLUMN `accountId` VARCHAR(191) NOT NULL;

-- AddForeignKey
ALTER TABLE `Modules` ADD CONSTRAINT `Modules_accountId_fkey` FOREIGN KEY (`accountId`) REFERENCES `Account`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
