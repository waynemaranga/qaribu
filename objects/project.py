# defines the project object
# has a string called introduction, a string called overview, a dictionary called scope that has a two lists, a list of strings called in-scope and a list of strings called out-of-scope
# it also has a object called stakeholders, that is a dictionary with a list of ...abs
# it has an object called timeline which is a dictionary. The dictionary has a list of strings
# it has a list of deliverables
# it has a string called conclusion
# it has an object called appendices

class Project:
    def init(self, introduction, overview, scope, stakeholders, timeline, deliverables, conclusion, appendices):
        self.introduction = introduction
        self.overview = overview
        self.scope = scope
        self.stakeholders = stakeholders
        self.timeline = timeline
        self.deliverables = deliverables
        self.conclusion = conclusion
        self.appendices = appendices

    def print_info(self):
        print(f"Introduction: {self.introduction}")
        print(f"Overview: {self.overview}")
        print(f"Scope: {self.scope}")
        print(f"Stakeholders: {self.stakeholders}")
        print(f"Timeline: {self.timeline}")
        print(f"Deliverables: {self.deliverables}")
        print(f"Conclusion: {self.conclusion}")
        print(f"Appendices: {self.appendices}")