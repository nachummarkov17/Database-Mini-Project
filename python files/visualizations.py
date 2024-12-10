import getpass

import matplotlib.pyplot as plt
import pandas as pd
import psycopg2

# Database connection settings
DB_CONFIG = {
    "dbname": "library_employees_db",
    "user": "postgres",
    "password": None,
    "host": "localhost",
    "port": 5432,
}

# Prompt the user for their password securely
DB_CONFIG["password"] = getpass.getpass(prompt="Enter your PostgreSQL password: ")


def fetch_data(query):
    """Fetch data from PostgreSQL using the given query."""
    try:
        conn = psycopg2.connect(**DB_CONFIG)
        df = pd.read_sql_query(query, conn)
        conn.close()
        return df
    except Exception as e:
        print(f"Error: {e}")
        return None


# Queries for fetching data
librarian_query = """
SELECT Expertise, YearsOfExperience
FROM LibrarianExpertise
WHERE Section = 'History'
LIMIT 100;
"""

employee_query = """
SELECT 
    CASE
        WHEN Salary BETWEEN 20000 AND 30000 THEN '20k-30k'
        WHEN Salary BETWEEN 30001 AND 40000 THEN '30k-40k'
        WHEN Salary BETWEEN 40001 AND 50000 THEN '40k-50k'
        WHEN Salary BETWEEN 50001 AND 60000 THEN '50k-60k'
        WHEN Salary BETWEEN 60001 AND 70000 THEN '60k-70k'
        WHEN Salary BETWEEN 70001 AND 80000 THEN '70k-80k'
        WHEN Salary BETWEEN 80001 AND 90000 THEN '80k-90k'
        WHEN Salary BETWEEN 90001 AND 100000 THEN '90k-100k'
    END AS SalaryRange,
    COUNT(*) AS EmployeeCount
FROM LibraryEmployee
WHERE Salary >= 20000 AND ExpirationOfContract < '2028-01-01'
GROUP BY SalaryRange
ORDER BY SalaryRange;
"""

# Fetch data for LibrarianExpertise
# df_librarian = fetch_data(librarian_query)

# if df_librarian is not None:
#     # Calculate average years of experience and group sizes
#     df_summary = (
#         df_librarian.groupby("expertise")["yearsofexperience"]
#         .agg(["mean", "count"])
#         .reset_index()
#         .rename(columns={"mean": "avg_experience", "count": "group_size"})
#     )

#     # Bar graph: Average Years of Experience with group sizes as labels
#     plt.figure(figsize=(8, 6))
#     bars = plt.bar(
#         df_summary["expertise"], df_summary["avg_experience"], color="skyblue"
#     )
#     plt.title("Average Years of Experience in History Section", fontsize=14)
#     plt.xlabel("Expertise", fontsize=12)
#     plt.ylabel("Average Years of Experience", fontsize=12)
#     plt.xticks(rotation=15)

#     # Add group size labels above bars
#     for bar, size in zip(bars, df_summary["group_size"]):
#         height = bar.get_height()
#         plt.text(
#             bar.get_x() + bar.get_width() / 2,
#             height + 0.5,
#             f"{size}",
#             ha="center",
#             fontsize=10,
#         )

#     plt.tight_layout()
#     plt.show()

# Fetch data for EmployeeContractDetails
df_employee = fetch_data(employee_query)

if df_employee is not None and not df_employee.empty:
    # Pie chart: Employee Salary Proportion by Range
    plt.figure(figsize=(8, 6))
    plt.pie(
        df_employee["employeecount"],
        labels=df_employee["salaryrange"],
        autopct="%1.1f%%",
        startangle=140,
        colors=plt.cm.Paired.colors,
    )
    plt.title(
        "Salary Proportion of Employees (Contracts Expiring Before 2028)", fontsize=14
    )
    plt.tight_layout()
    plt.show()
else:
    print("No data to visualize!")
