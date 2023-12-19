
class ExperienceModel {

  final String role;
  final String companyName;
  final String description;
  final String dateInital;
  final String dateFinal;
  final String skills;

  ExperienceModel({required this.role, required this.companyName, required this.description, required this.dateInital, required this.dateFinal, required this.skills});
  
  String get dateFormatted => '$dateInital to $dateFinal';

  static ExperienceModel fromJson(Map entry){
    return ExperienceModel(
      role: entry['role'],
      companyName: entry['companyName'],
      description: entry['description'],
      dateInital: entry['dateInital'],
      dateFinal: entry['dateFinal'],
      skills: entry['skills'],
    );
  }

}