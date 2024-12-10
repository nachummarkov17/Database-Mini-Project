import csv
import os
import random
from datetime import datetime, timedelta

from faker import Faker

# Initialize Faker
fake = Faker()
fake.unique.clear()  # Clear previous state of unique constraints


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
        "StoreName": fake.unique.company().replace(",", "-").replace("- ", "-"),
        "StoreLocation": random.choice(["A", "B", "C", "D", "E", "F"]),
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


# Global set to track unique workstation, desk number, and floor combinations
unique_desk_combinations = set()


def generate_desk_personnel(id_counter):
    global unique_desk_combinations
    while True:
        # Generate random values
        workstation = f"Workstation-{random.randint(1, 100)}"
        desk_number = f"Desk-{random.randint(1, 150)}"
        floor = random.randint(1, 5)
        # Create the tuple
        unique_tuple = (workstation, desk_number, floor)
        # Check if the tuple is unique
        if unique_tuple not in unique_desk_combinations:
            unique_desk_combinations.add(unique_tuple)  # Add to the set
            return {
                "ID": id_counter,
                "Workstation": workstation,
                "DeskNumber": desk_number,
                "Floor": floor,
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
    # Define the desired directory path for saving the files
    base_directory = os.path.join(os.getcwd(), "csv files")

    # Ensure the directory exists
    os.makedirs(base_directory, exist_ok=True)

    # Change the current directory to the new base directory
    os.chdir(base_directory)

    # Define file paths using the new base directory
    library_employee_file = "library_employees.csv"
    store_operator_file = "store_operators.csv"
    librarian_file = "librarians.csv"
    security_file = "security.csv"
    desk_personnel_file = "desk_personnel.csv"
    marketer_file = "marketers.csv"

    # Open files for writing using CSV writer
    with open(library_employee_file, "w", newline="") as le_file, open(
        store_operator_file, "w", newline=""
    ) as so_file, open(librarian_file, "w", newline="") as lib_file, open(
        security_file, "w", newline=""
    ) as sec_file, open(
        desk_personnel_file, "w", newline=""
    ) as dp_file, open(
        marketer_file, "w", newline=""
    ) as mar_file:

        # Set up CSV writers to automatically handle commas in values
        le_writer = csv.writer(le_file, quotechar='"', quoting=csv.QUOTE_MINIMAL)
        so_writer = csv.writer(so_file, quotechar='"', quoting=csv.QUOTE_MINIMAL)
        lib_writer = csv.writer(lib_file, quotechar='"', quoting=csv.QUOTE_MINIMAL)
        sec_writer = csv.writer(sec_file, quotechar='"', quoting=csv.QUOTE_MINIMAL)
        dp_writer = csv.writer(dp_file, quotechar='"', quoting=csv.QUOTE_MINIMAL)
        mar_writer = csv.writer(mar_file, quotechar='"', quoting=csv.QUOTE_MINIMAL)

        # Write headers
        le_writer.writerow(
            ["ID", "Name", "DateOfBirth", "Salary", "ExpirationOfContract"]
        )
        so_writer.writerow(["ID", "StoreType", "StoreName", "StoreLocation"])
        lib_writer.writerow(["ID", "Section", "Expertise", "YearsOfExperience"])
        sec_writer.writerow(["ID", "Area", "Role", "ClearanceLevel"])
        dp_writer.writerow(["ID", "Workstation", "DeskNumber", "Floor"])
        mar_writer.writerow(["ID", "Specialisation", "Certification", "CreativeSkill"])

        id_counter = 1
        for _ in range(200000):  # Generate 200,000 records
            # Generate a library employee
            employee = generate_library_employee(id_counter)
            le_writer.writerow(
                [
                    employee["ID"],
                    employee["Name"],
                    employee["DateOfBirth"],
                    employee["Salary"],
                    employee["ExpirationOfContract"],
                ]
            )

            # Randomly assign the employee to one of the subtypes
            subtype = random.choice(
                ["StoreOperator", "Librarian", "Security", "DeskPersonnel", "Marketer"]
            )

            if subtype == "StoreOperator":
                so = generate_store_operator(id_counter)
                so_writer.writerow(
                    [so["ID"], so["StoreType"], so["StoreName"], so["StoreLocation"]]
                )
            elif subtype == "Librarian":
                lib = generate_librarian(id_counter)
                lib_writer.writerow(
                    [
                        lib["ID"],
                        lib["Section"],
                        lib["Expertise"],
                        lib["YearsOfExperience"],
                    ]
                )
            elif subtype == "Security":
                sec = generate_security(id_counter)
                sec_writer.writerow(
                    [sec["ID"], sec["Area"], sec["Role"], sec["ClearanceLevel"]]
                )
            elif subtype == "DeskPersonnel":
                dp = generate_desk_personnel(id_counter)
                dp_writer.writerow(
                    [dp["ID"], dp["Workstation"], dp["DeskNumber"], dp["Floor"]]
                )
            elif subtype == "Marketer":
                mar = generate_marketer(id_counter)
                mar_writer.writerow(
                    [
                        mar["ID"],
                        mar["Specialisation"],
                        mar["Certification"],
                        mar["CreativeSkill"],
                    ]
                )

            id_counter += 1

    print("Data generation complete!")


# Run the data generator
if __name__ == "__main__":
    generate_data()
