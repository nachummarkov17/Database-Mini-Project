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
