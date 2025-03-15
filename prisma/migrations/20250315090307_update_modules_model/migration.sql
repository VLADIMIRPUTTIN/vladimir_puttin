/*
  Warnings:

  - You are about to drop the column `accountId` on the `modules` table. All the data in the column will be lost.
  - Added the required column `accountCode` to the `Modules` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `modules` DROP FOREIGN KEY `Modules_accountId_fkey`;

-- DropIndex
DROP INDEX `Modules_accountId_fkey` ON `modules`;

-- AlterTable
ALTER TABLE `modules` DROP COLUMN `accountId`,
    ADD COLUMN `accountCode` VARCHAR(191) NOT NULL;

-- AddForeignKey
ALTER TABLE `Modules` ADD CONSTRAINT `Modules_accountCode_fkey` FOREIGN KEY (`accountCode`) REFERENCES `Account`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
