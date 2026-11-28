-- CreateEnum
CREATE TYPE "Rank" AS ENUM ('S', 'A', 'B', 'C');

-- CreateTable
CREATE TABLE "tasks" (
    "id" TEXT NOT NULL,
    "origin_id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "rank" "Rank" NOT NULL,
    "is_completed" BOOLEAN NOT NULL DEFAULT false,
    "completed_at" TIMESTAMPTZ(3),
    "should_carry_over" BOOLEAN NOT NULL DEFAULT false,
    "target_date" DATE NOT NULL,
    "created_at" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMPTZ(3) NOT NULL,

    CONSTRAINT "tasks_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "tasks_target_date_idx" ON "tasks"("target_date");

-- CreateIndex
CREATE UNIQUE INDEX "tasks_origin_id_target_date_key" ON "tasks"("origin_id", "target_date");
