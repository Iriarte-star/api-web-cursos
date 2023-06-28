--------------------Tablas-------------------------
CREATE TABLE "Users" (
  "ID" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY NOT NULL,
  "Name" varchar NOT NULL,
  "Email" varchar UNIQUE NOT NULL,
  "Password" varchar NOT NULL,
  "Age" int NOT NULL,
  "RoleID" int NOT NULL
);

CREATE TABLE "Courses" (
  "ID" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY NOT NULL,
  "Title" varchar NOT NULL,
  "Description" varchar NOT NULL,
  "Level" varchar NOT NULL,
  "TeacherID" int NOT NULL,
  "CategoryID" int NOT NULL
);

CREATE TABLE "CourseVideo" (
  "ID" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY NOT NULL,
  "Title" varchar NOT NULL,
  "Url" varchar NOT NULL,
  "CourseID" int NOT NULL
);

CREATE TABLE "Categories" (
  "ID" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY NOT NULL,
  "Name" varchar NOT NULL
);

CREATE TABLE "Roles" (
  "ID" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY NOT NULL,
  "Name" varchar NOT NULL
);
---------------------------Referencias---------------------------
ALTER TABLE "Users" ADD FOREIGN KEY ("RoleID") REFERENCES "Roles" ("ID");

ALTER TABLE "Courses" ADD FOREIGN KEY ("TeacherID") REFERENCES "Users" ("ID");

ALTER TABLE "Courses" ADD FOREIGN KEY ("CategoryID") REFERENCES "Categories" ("ID");

ALTER TABLE "CourseVideo" ADD FOREIGN KEY ("CourseID") REFERENCES "Courses" ("ID");

------------------------------Insertar---------------------

INSERT INTO users (name, lastname, email, password) VALUES ('John', 'Doe', 'johndoe@example.com', 'password123');

INSERT INTO users (name, lastname, email, password) VALUES ('Jane', 'Smith', 'janesmith@example.com', 'pass456');

-------------------------------------------------------------
INSERT INTO "Categories" ("Name") VALUES ('Programming');
INSERT INTO "Categories" ("Name") VALUES ('Design');

---------------------------------------------------------
INSERT INTO "CourseVideo" ("Title", "Url", "CourseID") VALUES ('Introduction to SQL', 'https://example.com/sql-intro', 1);

INSERT INTO "CourseVideo" ("Title", "Url", "CourseID") VALUES ('Advanced SQL Queries', 'https://example.com/sql-advanced', 1);

-----------------------------------------------------------
INSERT INTO "Courses" ("Title", "Description", "Level", "TeacherID", "CategoryID")
VALUES ('Curso de SQL', 'Descripción del curso de SQL', 'Intermedio', 1, 1);
INSERT INTO "Courses" ("Title", "Description", "Level", "TeacherID", "CategoryID")
VALUES ('Curso de Python', 'Descripción del curso de Python', 'Intermedio', 2, 2);

-----------------------------------------------------------
INSERT INTO "Roles" ("Name") VALUES ('student');
INSERT INTO "Roles" ("Name") VALUES ('admin');
