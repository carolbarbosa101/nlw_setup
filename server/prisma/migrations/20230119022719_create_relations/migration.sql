/*
  Warnings:

  - Added the required column `habitId` to the `Habit_week_days` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_days_habits" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "day_id" TEXT NOT NULL,
    "habit_id" TEXT NOT NULL,
    CONSTRAINT "days_habits_day_id_fkey" FOREIGN KEY ("day_id") REFERENCES "days" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "days_habits_habit_id_fkey" FOREIGN KEY ("habit_id") REFERENCES "habits" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_days_habits" ("day_id", "habit_id", "id") SELECT "day_id", "habit_id", "id" FROM "days_habits";
DROP TABLE "days_habits";
ALTER TABLE "new_days_habits" RENAME TO "days_habits";
CREATE UNIQUE INDEX "days_habits_day_id_habit_id_key" ON "days_habits"("day_id", "habit_id");
CREATE TABLE "new_Habit_week_days" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "habit_id" TEXT NOT NULL,
    "week_day" INTEGER NOT NULL,
    "habitId" TEXT NOT NULL,
    CONSTRAINT "Habit_week_days_habit_id_fkey" FOREIGN KEY ("habit_id") REFERENCES "habits" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Habit_week_days" ("habit_id", "id", "week_day") SELECT "habit_id", "id", "week_day" FROM "Habit_week_days";
DROP TABLE "Habit_week_days";
ALTER TABLE "new_Habit_week_days" RENAME TO "Habit_week_days";
CREATE UNIQUE INDEX "Habit_week_days_habit_id_week_day_key" ON "Habit_week_days"("habit_id", "week_day");
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
