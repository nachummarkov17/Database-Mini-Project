import random
from datetime import datetime, timedelta

from faker import Faker

# Initialize Faker
fake = Faker()


# Helper function to generate a random date without time zone conflicts
def random_date(start, end):
    # Convert strings to datetime.date objects
    start_date = datetime.strptime(start, "%Y-%m-%d")
    end_date = datetime.strptime(end, "%Y-%m-%d")
    # Generate a random date between start_date and end_date
    delta = end_date - start_date
    random_days = random.randint(0, delta.days)
    return (start_date + timedelta(days=random_days)).date()


# Function to generate a Library Employee record
def generate_library_employee(id_counter):
    return {
        "ID": id_counter,
        "Name": fake.name(),
        "DateOfBirth": random_date("1960-01-01", "2000-01-01"),
        "Salary": random.randint(20000, 100000),
        "ExpirationOfContract": random_date("2026-01-01", "2030-01-01"),
    }


# Generate Store Operator
def generate_store_operator(id_counter):
    return {
        "ID": id_counter,
        "StoreType": random.choice(["Bookstore", "Retail", "Library Supply"]),
        "StoreName": fake.company(),
        "StoreLocation": random.choice("ABCDEF"),
    }


# Generate Librarian
def generate_librarian(id_counter):
    return {
        "ID": id_counter,
        "Section": random.choice(["Science", "Arts", "History", "Children"]),
        "Expertise": random.choice(["Cataloging", "Customer Support", "Acquisition"]),
        "YearsOfExperience": random.randint(1, 40),
    }


# Generate Security
def generate_security(id_counter):
    return {
        "ID": id_counter,
        "Area": random.choice(["Entrance", "Reading Room", "Archives"]),
        "Role": random.choice(["Guard", "Supervisor"]),
        "ClearanceLevel": random.randint(1, 5),
    }


# Generate Desk Personnel
def generate_desk_personnel(id_counter):
    return {
        "ID": id_counter,
        "Workstation": f"Workstation-{random.randint(1, 50)}",
        "DeskNumber": f"Desk-{random.randint(1, 100)}",
        "Floor": random.randint(1, 5),
    }


# Generate Marketer
def generate_marketer(id_counter):
    return {
        "ID": id_counter,
        "Specialisation": random.choice(
            ["Digital Marketing", "Public Relations", "Content Creation"]
        ),
        "Certification": random.choice(
            ["Google Certified", "HubSpot Certified", "None"]
        ),
        "CreativeSkill": random.choice(
            ["Writing", "Graphic Design", "Video Production"]
        ),
    }


# Main function to generate data
def generate_data():
    library_employee_file = "library_employees.csv"
    store_operator_file = "store_operators.csv"
    librarian_file = "librarians.csv"
    security_file = "security.csv"
    desk_personnel_file = "desk_personnel.csv"
    marketer_file = "marketers.csv"

    # Open files for writing
    with open(library_employee_file, "w") as le_file, open(
        store_operator_file, "w"
    ) as so_file, open(librarian_file, "w") as lib_file, open(
        security_file, "w"
    ) as sec_file, open(
        desk_personnel_file, "w"
    ) as dp_file, open(
        marketer_file, "w"
    ) as mar_file:

        # Headers
        le_file.write("ID,Name,DateOfBirth,Salary,ExpirationOfContract\n")
        so_file.write("ID,StoreType,StoreName,StoreLocation\n")
        lib_file.write("ID,Section,Expertise,YearsOfExperience\n")
        sec_file.write("ID,Area,Role,ClearanceLevel\n")
        dp_file.write("ID,Workstation,DeskNumber,Floor\n")
        mar_file.write("ID,Specialisation,Certification,CreativeSkill\n")

        id_counter = 1
        for _ in range(200000):  # Generate 200,000 records
            # Generate a library employee
            employee = generate_library_employee(id_counter)
            le_file.write(
                f"{employee['ID']},{employee['Name']},{employee['DateOfBirth']},"
                f"{employee['Salary']},{employee['ExpirationOfContract']}\n"
            )

            # Randomly assign the employee to one of the subtypes
            subtype = random.choice(
                ["StoreOperator", "Librarian", "Security", "DeskPersonnel", "Marketer"]
            )

            if subtype == "StoreOperator":
                so = generate_store_operator(id_counter)
                so_file.write(
                    f"{so['ID']},{so['StoreType']},{so['StoreName']},{so['StoreLocation']}\n"
                )
            elif subtype == "Librarian":
                lib = generate_librarian(id_counter)
                lib_file.write(
                    f"{lib['ID']},{lib['Section']},{lib['Expertise']},{lib['YearsOfExperience']}\n"
                )
            elif subtype == "Security":
                sec = generate_security(id_counter)
                sec_file.write(
                    f"{sec['ID']},{sec['Area']},{sec['Role']},{sec['ClearanceLevel']}\n"
                )
            elif subtype == "DeskPersonnel":
                dp = generate_desk_personnel(id_counter)
                dp_file.write(
                    f"{dp['ID']},{dp['Workstation']},{dp['DeskNumber']},{dp['Floor']}\n"
                )
            elif subtype == "Marketer":
                mar = generate_marketer(id_counter)
                mar_file.write(
                    f"{mar['ID']},{mar['Specialisation']},{mar['Certification']},{mar['CreativeSkill']}\n"
                )

            id_counter += 1

    print("Data generation complete!")


# Run the data generator
if __name__ == "__main__":
    generate_data()
