# Bears In Canada Project (SQL & ERWIN)

# Overview

I have just won the contract to design and implement a prototype database for the Bears In Canada Project - BIC project. I have been selected as the DA (Data Architect) for this project. The motivation for this project is to keep a record of what is going on in various research studies involving bears where samples are located by telemetry, hair snags, and scat located by specially trained canines (dogs). The project utilizes SQL to store, manipulate, and retrieve data, with a focus on tracking animal studies, sample classifications, and participant involvement. The project includes a detailed database schema, data insertion, and querying to extract meaningful insights. 

The motivation for the project is declining populations of bears. The project is about tracking the location and health of bears in or near a national park in Canada. 
## **Tracking is done by three different methods:**
- `Telemetry`: Tracking (after a bear has been captured and a tracking device has been attached)
- `Hair Snags`: Found on bushes and trees in the area
- `Scats (Animal Feces)`: Located by specially trained dogs. 
DNA data from hair and scat samples can be used to determine the sex of the bear and some health data. The seat samples provide individualized data on the physiological health of that animal.

There are many regions in which studies are being conducted. Three regions are to be part of the test data: North Region (NR), Central Region (CR) and South Region (SR) (see diagram).
Regions are divided into cells (which are numbered) and a x, y position location within a cell.

## Key Features

- **Data Management**: The system tracks animal studies, including study names, animal species, sample collection, and the regions where studies were conducted.
- **Participant Involvement**: Participants, including lab technicians and managers, are linked to specific samples and their analyses.
- **Sample Classification**: Samples are classified into categories like scat, telemetry, and hair, with each having specific data associated with them.
- **Querying and Reporting**: Various SQL queries were written to extract valuable insights, such as identifying animals within specific regions, finding the largest physiological health value observed for a species, and listing participants who analyzed telemetry samples.

## Database Schema

The database schema consists of several key tables that represent different entities in the system. These include:

- **Study**: Contains details about each study, including the study ID, name, and region.
- **Animal**: Tracks animals involved in the study, including species code, sex, and their associated study.
- **Sample**: Records samples taken from animals, including sample number, location, date, and classification.
- **Participant**: Tracks the participants involved in the study, including their ID, name, and role (e.g., lab technician, manager).
- **Scat, Hair_Telem**: Represents specific sample classifications like scat, hair, and telemetry.

## SQL Queries

Here is an example of the SQL queries used in the project with many others in the report:

### 1. **Find the largest physiological health value observed for a black bear**
```sql
SELECT MAX(PHTValue) AS LargestPHTValue
FROM Sample
JOIN Animal ON Sample.AnimalNumber = Animal.AnimalNumber
WHERE Animal.SpeciesCode = 'B' 
```

# Logical and Physical Data Models

### Logical Data Model (LDM)
![image alt](https://github.com/6ikh/Bears-In-Canada-Project/blob/f6930835c351681eac39ee960a0a63643f0b8d34/LDM%20BIC38.png)
The Logical Data Model (LDM) provides an abstract, high-level representation of the database structure, focusing on the organization of data and relationships between entities without being tied to a specific database technology.

- **Key Features**:
  - **Entities and Relationships**:
    - Core entities include `Participant`, `Study`, `Sample`, `Animal`, `Species`, and `Region`.
    - Relationships define how entities interact, such as:
      - `Participant` linked to specialized roles like `Dogs`, `Lab_Tech`, `Manager`, and `Director`.
      - `Sample` categorized into `Hair_Telem` and `Scat` classifications to distinguish different data types.
  - **Focus on Data Integrity**:
    - Primary and foreign keys are abstractly defined to ensure unique identification of data and consistent relationships.

- **Use in the Project**:
  - The LDM served as the foundation for database design, guiding the structure and relationships needed to answer biological research questions and ensuring logical consistency.

---

### Physical Data Model (PDM)
![image alt](https://github.com/6ikh/Bears-In-Canada-Project/blob/f6930835c351681eac39ee960a0a63643f0b8d34/PDM%20BIC38.png)
The Physical Data Model (PDM) translates the abstract LDM into a detailed, implementable design within a specific database management system (DBMS). It includes details like data types, constraints, and indexing.

- **Key Features**:
  - **Database Implementation**:
    - Entities and relationships from the LDM are implemented as tables with specific columns and constraints.
    - For example:
      - `Sample` includes fields such as `SampleNumber`, `AnimalNumber`, `StudyID`, `SampleDate`, and `Location`.
      - `Participant` is split into specialized roles like `Dogs`, `Lab_Tech`, `Manager`, and `Director`, each with relevant attributes.
  - **Constraints and Keys**:
    - Primary keys (e.g., `SampleNumber`) and foreign keys (e.g., linking `Sample` to `Study` and `Animal`) enforce data integrity.
    - Constraints like `NOT NULL` and `UNIQUE` ensure data quality.
  - **Optimizations for Queries**:
    - Indexing and storage considerations improve query performance for tasks like identifying telemetry samples or samples in specific regions.

- **Use in the Project**:
  - The PDM was used to implement the database in Microsoft SQL Server, supporting complex SQL queries and data analysis.
  - Examples include analyzing telemetry samples, identifying scat samples, and linking participants to studies.

---

### Relation to the Project
- The **Logical Data Model (LDM)** provided a conceptual framework to ensure the database design aligned with the project's requirements, such as tracking wildlife studies, participants, and samples.
- The **Physical Data Model (PDM)** translated this abstract design into a working database, enabling data storage, retrieval, and analysis.
- Together, these models ensured the database was both logically sound and practically efficient, supporting tasks like querying telemetry samples, analyzing scat data, and linking participants to studies.


# Reflection

## What I Learned

This project helped me develop a deeper understanding of database design, management, and querying, specifically in the context of real-world data. I learned how to:

- **Design a relational database schema**: I created a normalized database schema that efficiently organizes data across multiple tables, ensuring relationships between entities like studies, animals, samples, and participants are well-defined.
- **Write complex SQL queries**: I gained experience in writing complex SQL queries that join multiple tables, filter data, and perform aggregations to extract meaningful insights from the data.
- **Handle real-world data relationships**: I worked with a variety of relationships, such as one-to-many (e.g., studies to samples), many-to-many (e.g., participants to samples), and foreign key constraints, ensuring data integrity.
- **Troubleshoot and debug SQL errors**: I encountered and resolved various SQL errors related to foreign key constraints, column mismatches, and data inconsistencies, which improved my problem-solving skills.
- **Understand data analysis in biological studies**: By working with wildlife study data, I gained insight into how data can be analyzed to answer biological questions, such as identifying patterns in animal behavior, health, and sample classification.

## Skills/Features Used

Throughout the project, I applied a variety of skills and features that areimportant for working with databases and analyzing data:

- **SQL (Structured Query Language)**:
  - **Data Definition**: Created tables with appropriate data types and constraints (e.g., primary keys, foreign keys).
  - **Data Manipulation**: Inserted, updated, and deleted data while ensuring referential integrity.
  - **Data Querying**: Wrote complex SELECT queries with multiple JOINs, WHERE clauses, GROUP BY, and aggregate functions (e.g., MAX, COUNT).
  - **Subqueries and Aggregations**: Used subqueries to filter and aggregate data based on specific conditions.

- **Database Design**:
  - **Normalization**: Applied normalization techniques to avoid data redundancy and ensure efficient data storage.
  - **Relationships**: Defined relationships between entities (e.g., Study, Animal, Sample) using foreign keys.

- **Data Integrity**:
  - **Foreign Key Constraints**: Ensured that data relationships were maintained correctly, preventing orphaned records and ensuring consistency.

- **Problem Solving**:
  - **Error Debugging**: Diagnosed and fixed issues related to data integrity, missing references, and query performance.
  - **Optimizing Queries**: Worked on improving query performance by using appropriate indexing and efficient join operations.

## Technologies Used

- **SQL**: For data storage, manipulation, and querying.
- **ERwin**: For data modeling and schema design.
- **SQL Server Management Studio / Azure Data Studio**: The database system used for managing the data.
- **GitHub**: For version control and project management.

