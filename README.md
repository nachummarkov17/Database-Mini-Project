# ERD
![ERD](https://github.com/user-attachments/assets/e966406d-1092-4789-96f8-d31d94637732)


# Library Employee ERD Documentation

## **Overview**
This design models the different employee roles within a library and represents their specific responsibilities and attributes. The **Library Employee** supertype is used to centralize shared attributes, while the subtypes focus on the unique aspects of each role.

---

## **Entities and Attributes**

### **Library Employee (Supertype)**
Represents general information shared by all employees:
- **Attributes**:
  - `ID`: Unique identifier for each employee.
  - `Name`: Full name of the employee.
  - `Date of Birth`: Employee's birthdate.
  - `Salary`: Monthly or yearly salary.
  - `Expiration of Contract`: End date of the employee's contract.

### **Subtypes and Specific Attributes**

1. **Librarians**
   - **Subtype-Specific Attribute**: 
     - `Section`: The library section they manage (e.g., Fiction, Reference, Periodicals).

2. **Marketers**
   - **Subtype-Specific Attribute**: 
     - `Specialization`: Focus area such as digital marketing, event planning, or public relations.

3. **Artists**
   - **Subtype-Specific Attribute**:
     - `Project Name`: The preservation or artistic project they are working on.

4. **Desk Personnel**
   - **Subtype-Specific Attribute**:
     - `Workstation`: Their physical location in the library (e.g., Main Desk, Help Desk).

5. **Store Operators**
   - **Subtype-Specific Attribute**:
     - `Store Type`: The type of items they manage (e.g., Books, Merchandise, Stationery).

6. **Security**
   - **Subtype-Specific Attributes**:
     - `Role`: Their responsibility (e.g., gatekeeper, surveillance).
     - `Area`: The section of the library they are assigned to.

---

## **Design Principles**

1. **Normalization**
   - Common data (e.g., `Name`, `Salary`) is stored in the supertype to reduce redundancy.
   - Role-specific data is captured in the subtypes to improve data integrity and clarity.

2. **Disjointness**
   - The "d" symbol in the ERD represents disjointness, ensuring an employee can belong to only one subtype at a time. This avoids overlap between roles.

3. **Use Cases and Target Users**
   - **Librarians**: Manage book collections and assist patrons with inquiries.
   - **Marketers**: Promote library activities and engage with the public.
   - **Artists**: Contribute to preservation projects or create artistic displays.
   - **Desk Personnel**: Handle visitor interactions and ensure smooth front desk operations.
   - **Store Operators**: Manage the library's retail store and merchandise.
   - **Security**: Maintain the safety of patrons, staff, and collections.

---

## **What Parts of the Process Are Not Covered**

1. **Projects or Events**
   - The design does not include specific library events or campaigns that employees might be involved in. Adding an **Event** or **Project** entity could provide more depth.

2. **Teamwork or Collaboration**
   - Team structures or collaborations between employees are not represented. This could be useful for projects or shift management.

3. **Visitor Interaction**
   - The design does not include patrons or how they interact with employees. Adding a **Visitor** entity could model interactions like inquiries, book loans, or purchases.

4. **Shift Schedules**
   - While implied in certain attributes, shift schedules are not explicitly represented. A separate **Shift Schedule** entity could help track work hours and assignments.

---

## **Conclusion**
This design effectively models the roles and responsibilities of library employees using a normalized structure. It can be extended to include additional processes like visitor interactions, events, and scheduling to provide a more comprehensive view of library operations.

