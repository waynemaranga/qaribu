import json

from company import Company


# Read company profile from the file
with open("/media/windows/Common/_PROJECTS/qaribu/data/637 Hackathon Data/Projects/Blue Ocean Technologies/Company Profile.txt", "r") as file:
    lines = file.readlines()

# Extract information from the lines
industry = lines[0].split(":")[1].strip()
location = lines[1].split(":")[1].strip()
founded = lines[2].split(":")[1].strip()
employee_count = lines[3].split(":")[1].strip()
ceo = lines[4].split(":")[1].strip()
description = lines[5].split(":")[1].strip()

# Create an instance of the Company class
blue_ocean = Company(
    name="Blue Ocean Technologies",
    location=location,
    est_year=founded,
    employee_count=employee_count,
    ceo=ceo,
    description=description
)

# greenfield = Company(
    
# phoneix = Company(

# Convert the instance to a dictionary
blue_ocean_data = blue_ocean.to_dict()
# greenfeld_data = greenfeld.to_dict()
# phoenix_data = phoenix.to_dict()

# Store the data in JSON format
with open("blue_ocean.json", "w") as json_file:
    json.dump(blue_ocean_data, json_file, indent=2)

print("Blue Ocean has been saved to company_data.json.")
# print("Greenfeld has been saved to company_data.json.")
# print("Phoenix has been saved to company_data.json.")
