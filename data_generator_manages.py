import csv
import random

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
with open("marketers.csv", "r") as marketers_file:
    csv_reader = csv.DictReader(marketers_file)
    marketers = list(csv_reader)

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
            "Username": username,
            "Platform": platform_name,
            "MarketerID": marketer["ID"],
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
        "Username",
        "Platform",
        "MarketerID",
        "FollowerCount",
        "TargetAudience",
    ]
    csv_writer = csv.DictWriter(manages_file, fieldnames=fieldnames)
    csv_writer.writeheader()
    csv_writer.writerows(manages_data)

print("Manages CSV has been generated.")
