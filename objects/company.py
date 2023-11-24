# Defines object for company
class Company:
    def __init__(self, name, location, phone, email, website, logo, description):
        self.name = name
        self.location = location
        self.est_year = est_year # est_date = established date, founded
        self.employee_count = employee_count
        self.ceo = ceo
        self.description = description

    def __str__(self):
        return self.name