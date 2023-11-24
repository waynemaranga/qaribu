# Defines object for company
class Company:
    def __init__(self, name, location, est_year, employee_count, ceo, description):
        self.name = name
        self.location = location
        self.est_year = est_year # est_date = established date, founded
        self.employee_count = employee_count
        self.ceo = ceo
        self.description = description

    def __str__(self):
        return self.name

    def to_dict(self):
        return {
            "name": self.name,
            "location": self.location,
            "est_year": self.est_year,
            "employee_count": self.employee_count,
            "ceo": self.ceo,
            "description": self.description
        }