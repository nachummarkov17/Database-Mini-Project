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

## Dump Process (Backup and Restore)

In order to execute a dump, run the following commands from the root:
`
$startTime = Get-Date
pg_dump -U postgres -d library_employees_db --inserts --clean --if-exists --verbose --file=backupSQL.sql *> backupSQL.log 2>&1
$endTime = Get-Date
$duration = $endTime - $startTime

"Backup completed in $($duration.TotalSeconds) seconds" | Out-File -FilePath backupSQL.log -Append
`

In order to restore the database, run the following commands from the root:
`
$startTime = Get-Date
psql -U postgres -d library_employees_db -f backupSQL.sql *> backupPSQL.log 2>&1
$endTime = Get-Date
$duration = $endTime - $startTime

"Restore completed in $($duration.TotalSeconds) seconds" | Out-File -FilePath backupPSQL.log -Append
`

## Backup and Restore Logging

This project includes database backup and restore functionality. Timing and logging details are included for transparency and debugging purposes.

### Files:

1. **`backupSQL.sql`**:

   - A SQL dump of the `library_employees_db` database.
   - Created using `pg_dump` with `--inserts`, `--clean`, and `--if-exists` options for better reproducibility.

2. **`backupSQL.log`**:

   - Logs the verbose output of the `pg_dump` command.
   - Includes the duration taken to complete the backup.

3. **`backupPSQL.log`**:
   - Logs the verbose output of the `psql` restore command.
   - Includes the duration taken to complete the restore.

### Timing Details

- Timing statistics are captured using PowerShell's `Get-Date` and logged at the end of each `.log` file.
- Backup duration is appended to `backupSQL.log`.
- Restore duration is appended to `backupPSQL.log`.

### Git-LFS Integration

Large files such as `.sql` and `.log` files are tracked using Git-LFS to prevent bloating the repository size. If you clone this repository, ensure you have Git-LFS installed:

```
git lfs install
git lfs pull
```

## Setting up the database

To create the database, run the following command from the root:
`psql -U postgres -f "sql files/create_database.sql"`

To set up the database schema, run the following command from the root:
`psql -U postgres -d library_employees_db -f "sql files/create_schema.sql"`

To generate the data for the database, navigate to the data generator files, and run data_generator.py, and then run data_generator_manages.py

To insert all of the data into the tables, make sure to set the csv file folder to read for EVEREYONE, then run the following command from batch files:
`.\run_load_data.bat`

To delete all of the from the table, run the following command from the root:
`psql -U postgres -d library_employees_db -f "sql files/delete_data.sql"`

To delete the entire database, run the following command from the root:
`psql -U postgres -d library_employees_db -f "sql files/delete_database.sql"`
