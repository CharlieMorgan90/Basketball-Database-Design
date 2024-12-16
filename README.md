# Basketball-Database-Design
Designed and implemented a basketball database system to track players, teams, games, and historical statistics. Includes ER diagrams, relational schema, and SQL code to create the database.

## Features
- **ER Diagram**: Visual representation of entities, relationships, and attributes.
- **Relational Schema**: Normalized database schema design.
- **SQL Scripts**:
  - Creation of tables, sequences, indexes.
  - Example data insertion.
  - Example data queries/results.


## ER Diagram
Below is the ER diagram for the database:

![ER Diagram](ERD.png)



## Relational Schema
The database schema normalizes the relationships between entities to ensure efficiency and integrity.

![Relational Schema](relational_schema.png)


## SQL Scripts
The project includes the following SQL files:
- **SQL_Creation_Script.sql**: Script to create all tables and relationships.
- **sample_data_insertion.sql**: Script to insert sample data (optional).
- **queries_and_results.sql**: Example queries to extract useful insights.

---

## Example Queries
Here are some example SQL queries to demonstrate database functionality:

1. **Retrieve Player Season Stats**:
   ```sql
   SELECT PlayerName, SeasonID, PointsPerGame, AssistsPerGame
   FROM PLAYER
   JOIN PLAYER_SEASON_STATS ON PLAYER.PlayerID = PLAYER_SEASON_STATS.PlayerID;
