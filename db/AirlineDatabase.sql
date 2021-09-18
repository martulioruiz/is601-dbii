BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "COUNTRY" (
	"id"	INTEGER NOT NULL,
	"name"	VARCHAR(50) NOT NULL UNIQUE,
	"code"	TEXT NOT NULL UNIQUE,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "ACTIVITY" (
	"id"	INTEGER NOT NULL,
	"name"	TEXT NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "ROLE" (
	"id"	INTEGER NOT NULL,
	"name"	TEXT NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "PERSON" (
	"id"	INTEGER NOT NULL,
	"secretId"	VARCHAR(12) UNIQUE,
	"passportNumber"	TEXT NOT NULL UNIQUE,
	"firstName"	TEXT NOT NULL,
	"middleName"	TEXT NOT NULL,
	"fisrtSurname"	TEXT NOT NULL,
	"secondSurname"	TEXT NOT NULL,
	"role_FK"	INTEGER NOT NULL,
	"country_FK"	INTEGER NOT NULL,
	FOREIGN KEY("role_FK") REFERENCES "ROLE"("id"),
	FOREIGN KEY("country_FK") REFERENCES "COUNTRY"("id"),
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "PHONE" (
	"id"	INTEGER NOT NULL,
	"number"	TEXT NOT NULL,
	"person_FK"	INTEGER NOT NULL,
	"country_FK"	INTEGER NOT NULL,
	FOREIGN KEY("person_FK") REFERENCES "PERSON"("id"),
	FOREIGN KEY("country_FK") REFERENCES "COUNTRY"("id"),
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "CONTROL_LOG" (
	"id"	INTEGER NOT NULL,
	"dueDateTime"	TEXT NOT NULL,
	"person_FK"	INTEGER NOT NULL,
	"activity_FK"	INTEGER NOT NULL,
	FOREIGN KEY("activity_FK") REFERENCES "ACTIVITY"("id"),
	FOREIGN KEY("person_FK") REFERENCES "PERSON"("id"),
	PRIMARY KEY("id" AUTOINCREMENT)
);
COMMIT;
