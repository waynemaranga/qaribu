# defines a class for team and team structure
# Team class has a string called Name, a string called Role that pulls from the Role Class, and a string called Job Description that pulls from the Job Description in the Role Class

class Team:
    def init(self, name, role, job_description):
        self.name = name
        self.role = role
        self.job_description = job_description

    def __str__(self):
        return self.name

    def print_info(self):
        print(f"Team: {self.name}")
        print(f"Role: {self.role}")
        print(f"Job Description: {self.job_description}")