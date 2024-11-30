import csv
import os
import random

# Get the current working directory
current_directory = os.getcwd()

base_directory = os.path.join(os.getcwd(), "csv files")

# Change the current directory to the new base directory
os.makedirs(base_directory, exist_ok=True)  # Ensure the directory exists
os.chdir(base_directory)  # Change to the new directory

# Define social media platforms and their usernames
platforms = [
    {"Platform": "facebook", "DistributionRating": 3},
    {"Platform": "x", "DistributionRating": 5},
    {"Platform": "instagram", "DistributionRating": 4},
    {"Platform": "linkedin", "DistributionRating": 3},
    {"Platform": "pinterest", "DistributionRating": 1},
]

# Generate 20 usernames for each platform
platform_usernames = {
    platform["Platform"]: [f"{platform['Platform']}_user_{i}" for i in range(1, 21)]
    for platform in platforms
}

# Read marketers
marketers = []
# Define the file path for the marketers CSV
marketers_file_path = os.path.join(base_directory, "marketers.csv")

# Check if marketers.csv exists before trying to read it
if os.path.exists(marketers_file_path):
    with open(marketers_file_path, "r") as marketers_file:
        csv_reader = csv.DictReader(marketers_file)
        marketers = list(csv_reader)
else:
    print(f"Error: {marketers_file_path} not found.")

# If marketers data is loaded, proceed with assigning platforms and usernames
if marketers:
    # Assign each marketer to a random account and platform
    manages_data = []
    for marketer in marketers:
        # Randomly select a platform
        platform = random.choice(platforms)
        platform_name = platform["Platform"]

        # Randomly select a username from the chosen platform
        username = random.choice(platform_usernames[platform_name])

        manages_data.append(
            {
                "MarketerID": marketer["ID"],
                "Platform": platform_name,
                "Username": username,
                "FollowerCount": random.randint(1000, 50000),
                "TargetAudience": random.choice(
                    [
                        "Tech Enthusiasts",
                        "Fashion Lovers",
                        "Business Professionals",
                        "Teenagers",
                        "Gen Z",
                        "News Readers",
                        "Health Enthusiasts",
                        "Fitness Buffs",
                        "Foodies",
                    ]
                ),
            }
        )

    # Write the Manages table to CSV
    with open("manages.csv", "w", newline="") as manages_file:
        fieldnames = [
            "MarketerID",
            "Platform",
            "Username",
            "FollowerCount",
            "TargetAudience",
        ]
        csv_writer = csv.DictWriter(manages_file, fieldnames=fieldnames)
        csv_writer.writeheader()
        csv_writer.writerows(manages_data)

    print("Manages CSV has been generated.")
else:
    print("No marketers data found to process.")
