# ERD

![ERD](https://github.com/user-attachments/assets/4862940d-5872-4164-9230-96a39ad10367)

# DSD

![DSD](https://github.com/user-attachments/assets/a69bcb59-d66f-4ac4-8d06-1ba985f1df75)

# ERD Documentation: Library Employee Management System

## Overview

The **Library Employee Management System** ERD was designed to track and manage different types of library employees and their associated tasks, as well as the resources and platforms they interact with. The goal of this system is to provide a comprehensive way to manage various employee roles, social media campaigns, store operations, and security, ensuring all relevant data about each employee is tracked efficiently.

## Entities and Their Purpose

### 1. **Library Employee** (Supertype)

The **Library Employee** entity serves as a supertype for all types of employees working in the library. This supertype captures the common attributes shared by all employees, such as:

- **ID**: Unique identifier for each employee.
- **Name**: Employee's full name.
- **Date of Birth**: Employee's date of birth for demographic tracking.
- **Salary**: The salary of the employee for financial purposes.
- **Expiration of Contract**: Tracks when the employee’s contract ends.

The **Library Employee** entity is generalized because it holds attributes common across all employee roles. This supertype allows us to easily extend the system by adding new employee types without repeating common information.

### 2. **Marketer**

The **Marketer** entity is a subtype of **Library Employee**, capturing the roles and responsibilities of employees working in marketing within the library. It includes specific attributes:

- **Specialization**: Area of expertise in marketing (e.g., digital marketing, content creation).
- **Creative Skill**: Marks any creative skills the marketer might possess (e.g., graphic design, video editing).
- **Certification**: Relevant certifications that the marketer has received, proving their qualification.

This entity was chosen to support use cases where library employees are responsible for marketing campaigns, promotions, and events. Marketing professionals play a crucial role in attracting visitors to library events or services, so tracking their credentials and specialties is necessary.

### 3. **Social Media**

The **Social Media** entity was introduced to represent various platforms that marketers manage. The social media accounts may belong to a single library entity but are managed by different employees:

- **Platform**: Social media platform (e.g., Facebook, Twitter, Instagram).
- **Username**: Username of the account for identification purposes.
- **Distribution Rating**: Rating or performance indicator of how effective the social media platform is at reaching the target audience.

The relationship between **Marketer** and **Social Media** allows the system to track which employees manage which platforms, ensuring accountability for content distribution and audience engagement. The **Target Audience** and **Follower Count** provide additional context to the performance of the library's social media efforts.

### 4. **Librarian**

The **Librarian** entity is another subtype of **Library Employee**. Librarians play a key role in managing library collections, guiding visitors, and maintaining knowledge of library resources. Key attributes for this role are:

- **Section**: Specific library section the librarian oversees (e.g., Fiction, Reference, Children’s Books).
- **Expertise**: Area of specialization within the library (e.g., Literature, History, Science).

This entity was chosen to address the unique needs of managing the library’s physical and digital collections. It helps in tracking librarian tasks and expertise, assisting library managers in making informed staffing decisions.

### 5. **Store Operator**

The **Store Operator** entity is a subtype of **Library Employee** that represents employees responsible for the library’s retail and operational areas. Attributes include:

- **Store Location**: Physical location of the store within the library.
- **Store Type**: Type of store (e.g., bookstore, merchandise, café).

This role is essential for libraries that operate bookstores or merchandise sections, ensuring these areas run smoothly and efficiently. It helps in managing inventory, customer service, and store-related tasks.

### 6. **Desk Personnel**

Desk personnel are responsible for customer service and front-facing tasks within the library. Attributes for this role include:

- **Workstation**: Specific workstation assigned to the employee.
- **Desk Number**: The unique identifier for the desk or station assigned.

This entity tracks where desk personnel are located within the library, which is helpful for both customer service management and operational purposes. It ensures the smooth flow of tasks like greeting visitors and assisting with basic library functions.

### 7. **Security**

The **Security** entity represents the personnel responsible for maintaining safety within the library. Attributes include:

- **Area**: The physical area the security personnel monitors.
- **Clearance Level**: Security level assigned to an employee based on their role (e.g., general security, supervisor).

This entity ensures that the library’s security is adequately staffed and that each personnel's clearance level is tracked for emergency or management purposes.

## Relationships Between Entities

### 1. **Library Employee → Marketer / Librarian / Store Operator / Desk Personnel / Security**

The relationships between the **Library Employee** entity and its subtypes (**Marketer**, **Librarian**, etc.) are defined through specialization. Each employee type has specific attributes and responsibilities but shares common information like name, salary, and contract expiration.

### 2. **Marketer → Social Media**

The **Marketer** entity has a **Manages** relationship with **Social Media**. This captures the notion that marketers are responsible for managing various social media platforms. The attributes in this relationship (like **Follower Count**, **Target Audience**, and **Username**) help assess the effectiveness and reach of the social media campaigns and accounts managed by the marketer.

## Use Cases Covered

- **Employee Management**: The ERD helps manage various employee roles, track their attributes, and assign them specific tasks or sections within the library.
- **Social Media Tracking**: Marketers can be linked to the social media platforms they manage, allowing for performance tracking and content planning.
- **Store Operations**: Operators are assigned to store locations, enabling the efficient management of retail areas within the library.
- **Security Management**: Security personnel are tracked by area and clearance level to ensure safety within the library.

## What’s Not Covered

- **Employee Scheduling**: The ERD does not cover employee scheduling or shift management, which could be important for roles like **Desk Personnel** or **Security**.
- **Event Tracking**: There is no specific entity for event management in this ERD.
- **Library Inventory**: The ERD does not track library inventory (books, resources, etc.), which could be a separate system for managing physical and digital library assets.

## Conclusion

This ERD design addresses the core needs of managing library employees across various roles, their responsibilities, and the platforms or locations they interact with. It ensures clarity in tracking each employee's unique attributes while maintaining a consistent structure for the library's operations. Future improvements could involve adding features like employee schedules, event tracking, or inventory management.

## Data Generation Process

This document explains the process of generating data for the database, including automated scripts for large-scale data generation and manual creation for smaller datasets.

---

### Overview

- **Entity Tables**:  
  Python scripts were used to generate **40,000 rows** for each entity table (e.g., `marketers`).

- **Relation Table**:  
  A script generated **40,000 rows** for the `manages` table, based on data from the entity tables.

- **Social Media Table**:  
  The `social_media` table was manually created with **5 rows** to represent major platforms.

---

### Key Features of the Process

#### 1. **Scalability**

- The Python scripts are capable of handling **large-scale data generation**.
- Row counts can be adjusted easily by modifying script parameters.

#### 2. **Reproducibility**

- Randomized fields were used in the scripts to ensure variety in the generated data.
- Scripts can be modified to use a **fixed seed** (`random.seed()`) for deterministic outputs.

#### 3. **Validation**

- Generated CSV files were carefully inspected for:
  - **Data consistency**: Ensuring no missing or misaligned fields.
  - **Data validity**: Verifying logical relationships between fields.

#### 4. **Use Cases**

- The generated data is ideal for:
  - Testing database performance with large datasets.
  - Querying relationships between entities for analytics.
  - Simulating real-world scenarios in data-driven applications.

## Setting up the database

To create the database, run the following command from the root:
`psql -U postgres -f "sql files/create_database.sql"`

To set up the database schema, run the following command from the root:
`psql -U postgres -d library_employees_db -f "sql files/create_schema.sql"`

To generate the data for the database, navigate to the data generator files, and run data_generator.py, and then run data_generator_manages.py

To insert all of the data into the tables, open up file explorer and find the folder 'csv files'. Right-click on the folder, click on properties, then security, then edit EVERYONE so it can read. Apply and quit, then run the following command from batch files:
`.\run_load_data.bat`

To delete all of the from the table, run the following command from the root:
`psql -U postgres -d library_employees_db -f "sql files/delete_data.sql"`

To delete the entire database, run the following command from the root:
`psql -U postgres -d library_employees_db -f "sql files/delete_database.sql"`

## Dump Process (Backup and Restore)

In order to execute a dump, run the following commands from the root:
`$startTime = Get-Date
pg_dump -U postgres -d library_employees_db --inserts --clean --if-exists --verbose --file=backupSQL.sql *> backupSQL.log 2>&1
$endTime = Get-Date
$duration = $endTime - $startTime
"Backup completed in $($duration.TotalSeconds) seconds" | Out-File -FilePath backupSQL.log -Append`
In order to restore the database, run the following commands from the root:
`$startTime = Get-Date
psql -U postgres -d library_employees_db -f backupSQL.sql *> backupPSQL.log 2>&1
$endTime = Get-Date
$duration = $endTime - $startTime
"Restore completed in $($duration.TotalSeconds) seconds" | Out-File -FilePath backupPSQL.log -Append`

## Running queries

To run the provided queries, run the following command from the root:
`psql -U postgres -d library_employees_db -f ".\sql files\queries.sql" *> Queries.log 2>&1`
Feel free to comment out any number of queries to only run what you'd like.

To run the provided parametrized queries, run the following command from the root:
`psql -U postgres -d library_employees_db -f ".\sql files\params_queries.sql" *> ParamsQueries.log 2>&1`
Feel free to comment out any number of queries to only run what you'd like.

To run the provided join queries, run the following command from the root:
`psql -U postgres -d library_employees_db -f ".\sql files\join_queries.sql" *> join_queries.log 2>&1`
Feel free to comment out any number of queries to only run what you'd like.

In order to time a SQL query, copy the query of choice into time_query.sql following the instructions provided, and run the following command from the root:
`psql -U postgres -d library_employees_db -f ".\sql files\time_query.sql" *> TimedQueryLog.log 2>&1`

### Explanation of given queries

**Query #1:**

**Explanation:** This query retrieves the top 100 employees from the LibraryEmployee table, sorted by their salaries in descending order. It displays each employee's name, date of birth, and salary.

**Use Case:** This is useful for identifying the highest-paid employees, which can help in analyzing salary distribution, performance rewards, or budget allocation.

**Query #2:**

**Explanation:** This query calculates the average, minimum, and maximum salary of employees in the LibraryEmployee table.

**Use Case:** Provides insights into salary distribution within the organization. It helps in understanding pay scale trends and ensuring equitable pay structures.

**Query #3:**

**Explanation:** This query retrieves all librarians with more than 10 years of experience, showing their names, expertise, and years of experience.

**Use Case:** Useful for identifying experienced librarians who could be considered for leadership roles, mentorship programs, or specialized tasks.

**Query #4:**

**Explanation:** This query lists social media platforms with a distribution rating of 4 or higher, along with the marketer’s username and follower count managing them.

**Use Case:** Helps identify highly effective marketers and platforms that could be leveraged for campaigns or outreach programs.

**Query #5:**

**Explanation:** This query increases the salary of employees whose contracts expire after January 1, 2028, and who earn less than 30,000, by 10%.

**Use Case:** Addresses low compensation for long-term employees, helping retain talent and improving job satisfaction.

**Query #6:**

**Explanation:** This query ensures that all security personnel working in the "Archive" area have a clearance level of at least 5. If their level is below 5, it is updated.

**Use Case:** Ensures compliance with security protocols, particularly in sensitive areas requiring higher clearance levels.

**Query #7:**

**Explanation:** This query deletes records of marketers who are not managing any social media platforms, as they have no corresponding entry in the Manages table.

**Use Case:** Cleans up redundant records, ensuring that only active marketers managing platforms remain in the database.

**Query #8:**

**Explanation:** This query deletes all employees from the LibraryEmployee table whose salaries are less than 30,000.

**Use Case:** This might reflect a scenario where the organization is restructuring, removing low-paid or part-time positions, or automating tasks.

**Query #9:**

**Explanation:** This query retrieves all employees who earn more than 90,000 and whose contracts expire before January 1, 2027. The results are sorted by salary in descending order.

**Use Case:** Useful for identifying highly paid employees with contracts nearing expiration, enabling management to prioritize contract renewals, succession planning, or compensation reviews.

**Query #10:**

**Explanation:** This query lists marketers managing a specific social media platform (e.g., platform x), displaying their specialization, follower count, and target audience. Results are sorted by follower count in descending order.

**Use Case:** Useful for identifying the most influential marketers managing a particular platform to focus promotional efforts or assign critical marketing campaigns.

**Query #11:**

**Explanation:** This query increases the years of experience of librarians in the "Children" section by 30%. It returns their IDs, section, and updated years of experience after the change.

**Use Case:** Ensures that librarians in a specific department receive recognition for additional tenure or specialized training. Although the query mentions updating "salaries," it appears to be incrementing years of experience instead. If this is intentional, it might reflect a scenario where experience levels are recalibrated for promotions or benefit calculations.

**Query #12:**

**Explanation:** This query removes records of desk personnel assigned to "Workstation-97" on the 4th floor from the DeskPersonnel table. It returns their IDs, workstation details, desk numbers, and floor.

**Use Case:** Useful during organizational restructuring, where specific workstations or locations are being decommissioned, or roles are being reassigned.

**Query #13:**

**Explanation:** This query retrieves the names of all librarians working in the "Children" section, along with their years of experience and salaries. The data is joined from the LibraryEmployee and Librarian tables.

**Use Case:** Useful for identifying librarians with specialized experience in the "Children" section and their corresponding pay levels for budget or resource allocation.

**Query #14:**

**Explanation:** This query retrieves the names, roles, and clearance levels of all security personnel working in the "Archive" area, along with their corresponding salaries. It uses a join between the LibraryEmployee and Security tables.

**Use Case:** Ensures that sensitive areas like the "Archive" are staffed with adequately compensated and qualified personnel, with clearance levels that meet protocol requirements.

**Query #15:**

**Explanation:** This query lists the usernames of marketers managing social media platforms with a DistributionRating of 4 or higher, along with their specialization and follower count. It uses a join between the Marketer, Manages, and SocialMedia tables.

**Use Case:** Helps in identifying effective marketers and high-performing platforms to strategize marketing campaigns and resource allocation.

## Indexing

In order to create indices, run the following file from the root:
`psql -U postgres -d library_employees_db -f ".\sql files\constraints.sql"`

In order to remove the indices, run the following file from the root:
`psql -U postgres -d library_employees_db -f ".\sql files\drop_index.sql"`

**Indexing example with Query #1:**
| Attempt | No Indexing | Indexing | Time Save |
|-------------|--------------------|-------------------|------------------|
| Attempt 1 | 00:00:00.017159 | 00:00:00.001664 | 00:00:00.015495 |
| Attempt 2 | 00:00:00.003359 | 00:00:00.001642 | 00:00:00.001717 |
| Attempt 3 | 00:00:00.006182 | 00:00:00.004304 | 00:00:00.001878 |
| **Average** | **00:00:00.008233** | **00:00:00.002537** | **00:00:00.005696** |

## Views

Views offer a way to tailor to different user sub-groups. Keep in the mind that a view is a cursor that points to the respective records in the base tables. Any manipulations will affect the original tables they draw records from.

In order to create the provided views, run the following command from the root:
`psql -U postgres -d library_employees_db -f ".\sql files\create_views.sql" *> create_views.log 2>&1`

In order to run the provided select, insert, update, and delete queries for the created views, the run the following command form the root:
`psql -U postgres -d library_employees_db -f ".\sql files\view_queries.sql" *> view_queries.log 2>&1`

## Explanation of Operations:

### LibrarianExpertise

- **INSERT**: Adds a librarian with their expertise and employee data.
- **UPDATE**: Modifies a librarian's expertise field.
- **DELETE**: Removes a librarian and their associated employee record.

### SecurityClearance

- **INSERT**: Adds a security personnel with clearance details.
- **UPDATE**: Changes the clearance level for a specific personnel.
- **DELETE**: Removes a security record and its associated employee.

### MarketerPerformance

- **INSERT**: Adds a marketer, assigns them to a platform, and includes details about their audience.
- **UPDATE**: Adjusts follower count for a marketer.
- **DELETE**: Removes a marketer and their related platform assignments.

### EmployeeContractDetails

- **INSERT**: Adds a new employee with salary and contract details.
- **UPDATE**: Extends the expiration date of an employee's contract.
- **DELETE**: Removes an employee record.
