# class define job description
# job description has name, description. Descrption has responsibilites which is a list of strings, and requirements another list of strings
# should interface with Job Descriptions.txt

class Role:
    def __init__(self, name, description, responsibilities, requirements):
        self.name = name
        self.description = description # a dictionary containing dictionaries: responsibilities and requirements
        self.responsibilities = responsibilities # a list of strings
        self.requirements = requirements # a list of strings

    def __str__(self):
        return self.name

    def print_info(self):
        print(f"Role: {self.name}")
        print(f"Description: {self.description}")
        print(f"Responsibilities: {self.responsibilities}")
        print(f"Requirements: {self.requirements}")

    def to_dict(self):
        return {
            "name": self.name,
            "description": self.description,
            "responsibilities": self.responsibilities,
            "requirements": self.requirements
        }