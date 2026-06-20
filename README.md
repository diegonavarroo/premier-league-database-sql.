# ⚽ Premier League Database Project

## Project Overview
This project consists of the design and implementation of a relational database using **PostgreSQL** to manage data based on the English Premier League. It includes information about teams, players, matches, stadiums, injuries, and coach statistics.

**Technologies used:** PostgreSQL, SQL (DDL, DML, TCL), pgAdmin, Entity-Relationship Modeling.

##  Repository Structure
- `/docs/`: Contains the Entity-Relationship (ER) / UML Diagram.
- `/scripts/01_DDL/`: Scripts for creating tables and defining data integrity (Primary Keys, Foreign Keys, Checks).
- `/scripts/02_DML/`: Scripts for inserting, updating, and deleting dummy data.
- `/scripts/03_Consultas/`: Standard queries and advanced `JOIN` operations.
- `/scripts/04_Objetos_Avanzados/`: Advanced database concepts like Views, Indexes, CTEs, and Stored Procedures.

## How to run
To replicate this database locally:
1. Open PostgreSQL (e.g., via pgAdmin).
2. Create a new database.
3. Run the scripts in the `/scripts/01_DDL/` folder first to build the schema.
4. Run the scripts in `/scripts/02_DML/` to populate the database with initial data.
5. Execute the remaining scripts to test views, functions, and queries.

##  Key Features & Learning Outcomes
- **Database Normalization:** Designed following best practices to reduce data redundancy.
- **Data Integrity:** Applied `CHECK` constraints, `NOT NULL`, and strict foreign key relationships.
- **Advanced SQL:** Implemented Common Table Expressions (CTEs), multi-table JOINs, and aggregation functions to analyze player performance and stadium attendance.

---
*Created by [Tu Nombre] and [Nombre de tu compañero] as part of the Database Systems coursework.*
