# Defines object for a Standard operating procedure
# the class contains a string called title and a dicionary called procedure
# the dictionary is a list of strings called steps

class SOP:
    def __init__(self, title, procedure):
        self.title = title
        self.procedure = procedure

    def __str__(self):
        return self.title

    def print_info(self):
        print(f"Title: {self.title}")
        print(f"Procedure: {self.procedure}")