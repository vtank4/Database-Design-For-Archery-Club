# Archery Club Database Project Report

## Project Overview
This project involves the design and implementation of a database system for an archery club. The primary goal is to manage and analyze the scores of archers across various competitions and rounds. The database stores detailed information about each archer, their scores, and the competitions they participate in. One important notice is that all this project doesnt use any real data, just some stimulator data to test the database.

## Key Components
1. **Database Schema**: The database schema includes tables such as `Archer`, `EndScoreTable`, `Competition`, and `RoundShoot`. These tables are designed to store relevant data about archers, their scores, and competition details.

2. **Data Insertion**: SQL scripts are used to insert data into the database. For example, `enddata.txt` contains multiple `INSERT` statements to populate the `EndScoreTable` with scores for different rounds.

3. **Data Generation Scripts**: Python scripts like `archer_gen.py` and `end_gen_hobart_pearth.py` are used to generate SQL commands for inserting data into the database. These scripts ensure that the data is generated programmatically and consistently.

4. **Data Analysis**: SQL queries in `Query_For_Report.sql` are used to analyze the data. These queries calculate total scores, filter scores by specific criteria, and group data for reporting purposes.

5. **Visualization**: The project includes a Tableau workbook (`Book1.twb`) that visualizes the data. The workbook contains worksheets and dashboards that display various metrics such as total scores by gender, equipment preferences, and the relationship between total score and age.

## Achievements
- Successfully designed and implemented a relational database schema for the archery club.
- Generated and inserted sample data into the database using Python scripts.
- Created complex SQL queries to analyze and report on the data.
- Developed visualizations in Tableau to provide insights into the data.

## Future Work
- Enhance the database schema to include more detailed information about competitions and rounds.
- Implement additional data validation and integrity checks.
- Expand the data analysis capabilities with more advanced SQL queries and visualizations.
- Integrate the database with a web application for easier data entry and management.

## Conclusion
This project demonstrates the effective use of database design, data generation, and data analysis techniques to manage and analyze archery club data. The combination of SQL and Tableau provides a powerful toolset for gaining insights into the performance of archers and the overall operations of the club.
