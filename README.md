#### ERD
![ERD](https://github.com/user-attachments/assets/e966406d-1092-4789-96f8-d31d94637732)
Documentation of the Design
Why These Entities Were Chosen
The goal of the design is to model the different employee roles within a library and represent their specific responsibilities and attributes. The Library Employee supertype is used to avoid data redundancy and encapsulate common attributes shared by all employees, while the subtypes focus on distinct roles.

Library Employee (Supertype):

Represents the general information shared by all employees, such as ID, Name, Date of Birth, Salary, and Expiration of Contract.
This ensures that the core details of employees are centralized and managed efficiently.
Librarians:

Chosen to represent employees who manage and maintain book collections.
Subtype-Specific Attribute: Section denotes the area of responsibility within the library (e.g., Fiction, Reference, Periodicals).
Marketers:

Represent employees who promote library services and events.
Subtype-Specific Attribute: Specialization highlights their area of focus, such as digital marketing, event planning, or public relations.
Artists:

Represent creative contributors involved in preservation or artistic projects.
Subtype-Specific Attribute: Project Name specifies the preservation project or artwork they are working on.
Desk Personnel:

Represent employees who handle inquiries, reservations, and patron services at the library desk.
Subtype-Specific Attribute: Workstation identifies their physical location (e.g., Main Desk, Help Desk).
Store Operators:

Represent employees who manage the library's retail store, selling books, merchandise, or stationery.
Subtype-Specific Attribute: Store Type indicates whether the operator is managing books, merchandise, or other items.
Security:

Represent employees responsible for maintaining safety and ensuring access control.
Subtype-Specific Attributes:
Role indicates their responsibility (e.g., gatekeeper, surveillance).
Area specifies the section of the library they are assigned to.
How These Entities Were Chosen
Normalization:

The design follows normalization principles by storing common data (e.g., Name, Salary) in the supertype and role-specific data in the subtypes.
This reduces redundancy and improves data integrity.
Disjointness:

The "d" symbol represents disjointness, meaning an employee can belong to only one subtype at a time. This ensures clarity in defining employee roles and avoids overlap.
Use Cases and Target Users:

Librarians: Manage collections and assist patrons with book-related inquiries.
Marketers: Create campaigns to promote library activities and increase engagement.
Artists: Contribute to preservation projects or design artistic displays.
Desk Personnel: Handle face-to-face interactions with visitors and ensure smooth operations.
Store Operators: Run the library store and manage retail transactions.
Security: Ensure the safety of patrons and staff, as well as the security of the library's collections.
What Parts of the Process Are Not Covered
Projects or Events:

The design does not model specific library events or campaigns that employees might be involved in. Adding a separate Event or Project entity could provide more depth.
Teamwork or Collaboration:

The model does not include team structures or collaboration between employees, which could be useful for projects or shifts.
Visitor Interaction:

There’s no representation of patrons or how they interact with employees. Adding a Visitor entity could model interactions like inquiries, book loans, or purchases.
Shift Schedules:

While attributes like Shift Start/End could be implied, they are not explicitly represented. A separate Shift Schedule entity could track work hours and assignments.
Conclusion
This design effectively models the roles and responsibilities of library employees using a normalized structure. It can be extended to include additional processes like visitor interactions, events, and scheduling to provide a more comprehensive view of library operations. 
