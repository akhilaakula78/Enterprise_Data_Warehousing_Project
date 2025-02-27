# Enterprise Data Warehousing Assignments

This repository contains three assignments for the BCIS 5610.001 Enterprise Data Warehousing course.

## Assignments Overview

### **Assignment 1: ER Model for Upwork**
**Objective:**
- Develop an Entity-Relationship (ER) model for Upwork.
- Implement the ER model in MySQL Workbench using forward engineering.
- Populate each table with at least five records.

**Scope:**
- Clients can post projects with detailed specifications.
- Freelancers can bid on projects with an estimated cost and timeline.
- Clients select a freelancer and provide a review upon project completion.
- System keeps track of all project bids and reviews.

**Deliverables:**
- MySQL script file (.sql) containing the database model.
- MS Word document with ERD screenshots and physical table results.

---

### **Assignment 2: Convert Relational Database to a Dimensional Model**
**Objective:**
- Convert the relational database (ER model) into a dimensional model.
- Identify and create dimensions and fact tables.
- Implement the model in MySQL.

**Scope:**
- Dimensions: Clients, Freelancers, Projects, and Time.
- Fact tables: Transaction records and reviews.

**Deliverables:**
- MySQL script file (.sql) with the dimensional model.
- Screenshots of the dimensional model diagram.
- MS Word document containing physical table structures.

---

### **Assignment 3: Create a QlikView Dashboard**
**Objective:**
- Develop a QlikView dashboard using the dimensional model.
- Generate insights into client-freelancer interactions, bids, and project reviews.

**Scope:**
- Data cleansing and transformation in QlikView.
- Resolving circular references and synthetic keys.
- Creating visualization dashboards with different sheets (Client Insights, Freelancer Insights, etc.).

**Deliverables:**
- QlikView project file (.qvw) with a functional dashboard.
- Screenshots of data models and visualization dashboards.
- MS Word document detailing implementation steps.

---

## Repository Structure
```
Enterprise_Data_Warehousing/
│-- ERD_Assignment/
│   ├── ERD_SqlScript.sql
│   ├── ERD_Model_Diagram.jpg
│   ├── ERD_Report.pdf
│-- Dimensional_Model_Assignment/
│   ├── DM_SqlScript.sql
│   ├── DDM_Model_Diagram.png
│   ├── DM_Report.pdf
│-- QlikView_Assignment/
│   ├── QlikView_Project.qvw
│   ├── QlikView_Report.pdf
│-- README.md
```
