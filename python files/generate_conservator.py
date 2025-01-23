# Order: Conservator, Book, Archives, Disposal, Shelves, Upkeep, Archival Assignment

import csv
import random
from datetime import date, timedelta

import data_generator
from faker import Faker

fake = Faker()

with open("./csv files/library_employees.csv", "a", newline="") as le_file, open(
    "./csv files/conservators.csv", "w", newline=""
) as c_file:
    le_writer = csv.writer(le_file)
    c_writer = csv.writer(c_file, quotechar='"', quoting=csv.QUOTE_MINIMAL)
    c_writer.writerow(["ID", "Duty"])

    Dutys = ["Archivist", "Restorationist", "Disposal Worker"]

    employee_data = []
    for employee_id in range(200001, 200031):
        employee = data_generator.generate_library_employee(employee_id)
        le_writer.writerow(
            [
                employee["ID"],
                employee["Name"],
                employee["DateOfBirth"],
                employee["Salary"],
                employee["ExpirationOfContract"],
            ]
        )
        Duty = random.choice(Dutys)
        c_writer.writerow([employee["ID"], Duty])


rarity_levels = ["Common", "Rare", "Very Rare", "Legendary"]
genres = [
    "Fiction",
    "Non-fiction",
    "Biography",
    "Mystery",
    "Fantasy",
    "Science Fiction",
    "Romance",
    "Horror",
]


def generate_book_title():
    options = [
        fake.sentence(nb_words=5).rstrip(".").title(),
        f"The {fake.word().title()} Of {fake.city()}",
        fake.catch_phrase().title(),
        " ".join(fake.words(nb=3)).title(),
        fake.job().title(),
        f"{fake.word().title()} And The {fake.word().title()}",
        fake.sentence(nb_words=3).rstrip(".").title(),
        f"The {fake.word().title()} Of {fake.city()}",
        fake.catch_phrase().title(),
        " ".join(fake.words(nb=2)).title(),
        fake.job().title(),
        f"{fake.word().title()} And The {fake.word().title()}",
    ]
    return random.choice(options)


book_ids = set()
while len(book_ids) < 200000:
    book_ids.add(str(random.randint(1000000000, 9999999999)))

book_data = []
for book_id in book_ids:
    title = fake.catch_phrase().title()
    author = fake.name()
    rarity = random.choice(rarity_levels)
    genre = random.choice(genres)

    book_data.append([book_id, title, author, rarity, genre])

with open("./csv files/books.csv", "w", newline="") as file:
    writer = csv.writer(file)
    writer.writerow(["Book_ID", "Title", "Author", "Rarity", "Genre"])
    writer.writerows(book_data)


archive_numbers = list(range(1, 51))
book_types = [
    "Governmental",
    "Law",
    "Academic",
    "Historical Document",
    "Scroll",
    "General Purpose",
]
capacity_values = [i * 1000 for i in range(10, 21)]

archive_data = []
for archive_number in archive_numbers:
    book_type = random.choice(book_types)
    capacity = random.choice(capacity_values)
    archive_data.append([archive_number, book_type, capacity])

with open("./csv files/archives.csv", "w", newline="") as file:
    writer = csv.writer(file)
    writer.writerow(["Archive_Number", "Book_Type", "Capacity"])
    writer.writerows(archive_data)


books, disposal_workers = [], []
with open("./csv files/books.csv", "r") as books_file:
    reader = csv.DictReader(books_file)
    for row in reader:
        books.append({"Book_ID": int(row["Book_ID"]), "Title": row["Title"]})
with open("./csv files/conservators.csv", "r") as employees_file:
    reader = csv.DictReader(employees_file)
    for row in reader:
        if row["Duty"] == "Disposal Worker":
            disposal_workers.append(int(row["ID"]))

materials = ["Paper", "Leather", "Synthetic", "Metal"]
methods = [
    "Incineration",
    "Recycling",
    "Donation",
    "Burial",
    "Shredding",
    "Repurposing",
]

disposal_ids = set()
while len(disposal_ids) < 20000:
    disposal_ids.add(random.randint(1000000, 9999999))

disposal_data = []
used_books = set()
for disposal_id in disposal_ids:
    book = random.choice(books)
    while book["Book_ID"] in used_books:
        book = random.choice(books)
    used_books.add(book["Book_ID"])
    employee_id = random.choice(disposal_workers)
    method = random.choice(methods)
    material = random.choice(materials)
    disposal_date = fake.date_between(start_date="-2y", end_date="today")

    disposal_data.append(
        [disposal_id, book["Book_ID"], employee_id, method, material, disposal_date]
    )

with open("./csv files/disposals.csv", "w", newline="") as file:
    writer = csv.writer(file)
    writer.writerow(
        [
            "Disposal_ID",
            "Book_ID",
            "Conservator_ID",
            "Method",
            "Material_of_Book",
            "Date",
        ]
    )
    writer.writerows(disposal_data)


import csv

archive_data, shelf_data = [], []
with open("./csv files/archives.csv", "r") as archives_file:
    reader = csv.DictReader(archives_file)
    for row in reader:
        archive_data.append(
            {
                "Archive_Number": int(row["Archive_Number"]),
                "Capacity": int(row["Capacity"]),
            }
        )

shelf_data = []
for archive in archive_data:
    archive_number = archive["Archive_Number"]
    capacity = archive["Capacity"]
    num_shelves = capacity // 100

    current_shelf_number = 101
    for _ in range(num_shelves):
        shelf_data.append([archive_number, current_shelf_number])
        current_shelf_number += 1

with open("./csv files/shelves.csv", "w", newline="") as file:
    writer = csv.writer(file)
    writer.writerow(["Archive_Number", "Shelf_Number"])
    writer.writerows(shelf_data)


books, restorationists = [], []
with open("./csv files/books.csv", "r") as books_file:
    reader = csv.DictReader(books_file)
    for row in reader:
        books.append({"Book_ID": int(row["Book_ID"]), "Title": row["Title"]})

with open("./csv files/conservators.csv", "r") as employees_file:
    reader = csv.DictReader(employees_file)
    for row in reader:
        if row["Duty"] == "Restorationist":
            restorationists.append(int(row["ID"]))

tools = ["Glue", "Scissors", "Brush", "Tweezers", "Clamps", "Scalpel", "Binding Tape"]
reasons = [
    "Torn pages",
    "Loose binding",
    "Water damage",
    "Faded text",
    "Mold growth",
    "Dust accumulation",
    "Staining",
    "Cover damage",
    "Insect damage",
    "Aging and brittleness",
]

upkeep_ids = set()
while len(upkeep_ids) < 40000:
    upkeep_ids.add(random.randint(10000000, 99999999))

upkeep_data = []
used_books = set()
for upkeep_id in upkeep_ids:
    book = random.choice(books)
    while book["Book_ID"] in used_books:
        book = random.choice(books)
    used_books.add(book["Book_ID"])
    employee_id = random.choice(restorationists)
    tools_used = random.choice(tools)
    reason_for_upkeep = random.choice(reasons)
    upkeep_date = fake.date_between(start_date="-2y", end_date="today")

    upkeep_data.append(
        [
            upkeep_id,
            book["Book_ID"],
            employee_id,
            tools_used,
            reason_for_upkeep,
            upkeep_date,
        ]
    )

with open("./csv files/upkeeps.csv", "w", newline="") as file:
    writer = csv.writer(file)
    writer.writerow(
        [
            "Upkeep_ID",
            "Book_ID",
            "Conservator_ID",
            "Tools_Used",
            "Reason_for_Upkeep",
            "Date",
        ]
    )
    writer.writerows(upkeep_data)


def generate_limited_dates(start_date, num_dates, max_per_day):
    dates = []
    current_date = start_date
    assignments_today = 0

    for _ in range(num_dates):
        if assignments_today >= max_per_day:
            current_date += timedelta(days=1)
            assignments_today = 0
        dates.append(current_date)
        assignments_today += 1

    return dates


books, archives, archivists, shelves = [], [], [], []
with open("./csv files/books.csv", "r") as books_file:
    reader = csv.DictReader(books_file)
    for row in reader:
        books.append(int(row["Book_ID"]))
with open("./csv files/archives.csv", "r") as archives_file:
    reader = csv.DictReader(archives_file)
    for row in reader:
        archives.append(int(row["Archive_Number"]))
with open("./csv files/conservators.csv", "r") as employees_file:
    reader = csv.DictReader(employees_file)
    for row in reader:
        if row["Duty"] == "Archivist":
            archivists.append(int(row["ID"]))
with open("./csv files/shelves.csv", "r") as shelves_file:
    reader = csv.DictReader(shelves_file)
    for row in reader:
        shelves.append(int(row["Shelf_Number"]))

assignment_ids = set()
while len(assignment_ids) < 300000:
    assignment_ids.add(random.randint(10**14, 10**15 - 1))
start_date = date.today() - timedelta(days=5 * 365)
ordered_dates = generate_limited_dates(
    start_date, len(assignment_ids), max_per_day=1000
)

book_assignments = {
    book_id: {"Old_Archive_Room": 0, "Old_Shelf": 0} for book_id in books
}
archival_assignment_data = []
for assignment_id, assignment_date in zip(sorted(assignment_ids), ordered_dates):
    book_id = random.choice(books)
    old_archive_room = book_assignments[book_id]["Old_Archive_Room"]
    old_shelf = book_assignments[book_id]["Old_Shelf"]
    new_archive_room = random.choice(archives)
    new_shelf = random.choice(shelves)
    employee_id = random.choice(archivists)
    book_assignments[book_id]["Old_Archive_Room"] = new_archive_room
    book_assignments[book_id]["Old_Shelf"] = new_shelf

    archival_assignment_data.append(
        [
            assignment_id,
            assignment_date,
            book_id,
            old_archive_room,
            old_shelf,
            new_archive_room,
            new_shelf,
            employee_id,
        ]
    )

with open("./csv files/archival_assignments.csv", "w", newline="") as file:
    writer = csv.writer(file)
    writer.writerow(
        [
            "Assignment_ID",
            "Date",
            "Book_ID",
            "Old_Archive_Room",
            "Old_Shelf",
            "New_Archive_Room",
            "New_Shelf",
            "Conservator_ID",
        ]
    )
    writer.writerows(archival_assignment_data)
