# role_dber.py
from role import Role
import json

def read_roles_from_txt(file_path="/media/windows/Common/_PROJECTS/qaribu/data/637 Hackathon Data/Projects/Blue Ocean Technologies/Job Descriptions.txt"):
    with open(file_path, "r") as file:
        job_descriptions = file.read().split("\n\n")

    role_instances = []
    for job_desc in job_descriptions:
        lines = job_desc.split('\n')
        title = lines[0].strip()
        responsibilities = [line.strip() for line in lines[3:lines.index("Requirements:")]]
        requirements = [line.strip() for line in lines[lines.index("Requirements:")+1:]]

        role_instance = Role(title, {"responsibilities": responsibilities, "requirements": requirements}, responsibilities, requirements)
        role_instances.append(role_instance)

    return role_instances

def write_roles_to_json(roles, output_file="role_data.json"):
    role_instances = [role.to_dict() for role in roles]

    with open(output_file, "w") as json_file:
        json.dump(role_instances, json_file, indent=2)

if __name__ == "__main__":
    roles = read_roles_from_txt()
    write_roles_to_json(roles)
    print("Role data has been saved to role_data.json.")
