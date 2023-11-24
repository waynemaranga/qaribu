# defines class for meeting notes
# MeetingNotes class has Meeting Class as parent
# Meeting Class has a string called Title, a list called Attendees, and a list of strings called Notes
# Meeting notes has three strings: note one, note two, and note three

class Meeting:
    def init(self, title, attendees, notes):
        self.title = title
        self.attendees = attendees
        self.notes = notes

    def printinfo(self):
        print(f"Title: {self.title}")
        print(f"Attendees: {self.attendees}")
        print(f"Notes: {self.notes}")

    def __str__(self):
        return self.title

class MeetingNotes(Meeting):
    def init(self, note_one, note_two, note_three):
        self.note_one = note_one
        self.note_two = note_two
        self.note_three = note_three

    def printinfo(self):
        print(f"Note One: {self.note_one}")
        print(f"Note Two: {self.note_two}")
        print(f"Note Three: {self.note_three}")

    def __str__(self):
        return self.note_one
        return self.note_two
        return self.note_three