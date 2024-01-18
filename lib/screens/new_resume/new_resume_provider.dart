import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nayeem_sama_test/models/education_model.dart';
import 'package:nayeem_sama_test/models/experience_model.dart';
import 'package:nayeem_sama_test/models/project_model.dart';

class NewResumeProvider extends ChangeNotifier {

  Map<String, dynamic> cv = {};

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  List<EducationModel> educationList = [];
  List<ProjectModel> projectsList = [];
  List skillsList = [];
  List<ExperienceModel> experienceList = [];

  NewResumeProvider(){
    create();
  }

  void create() {

    EducationModel educationModel = EducationModel();
    ExperienceModel experienceModel = ExperienceModel();
    ProjectModel projectModel = ProjectModel();
    TextEditingController skillController = TextEditingController();

    educationList.add(educationModel);
    experienceList.add(experienceModel);
    projectsList.add(projectModel);
    skillsList.add(skillController);
  }

  void addEducation() {
    EducationModel model = EducationModel();
    educationList.add(model);
    notifyListeners();
  }void addExperience() {
    ExperienceModel model = ExperienceModel();
    experienceList.add(model);
    notifyListeners();
  }void addProject() {
    ProjectModel model = ProjectModel();
    projectsList.add(model);
    notifyListeners();
  }void addSkill() {
    TextEditingController skillController = TextEditingController();
    skillsList.add(skillController);
    notifyListeners();
  }

  void createResume() {
    cv.addAll({
      'name':nameController.text,
      'email':emailController.text,
      'phone':phoneController.text,
    });
    cv.addAll({
      "educations": List.generate(educationList.length, (index) => educationList[index].toJson())
    });
    cv.addAll({
      "experiences": List.generate(experienceList.length, (index) => experienceList[index].toJson())
    });
    cv.addAll({
      "skills": List.generate(skillsList.length, (index) => skillsList[index].text)
    });

    print('all CV $cv');
    print('all CV 2 ${jsonEncode(cv)}');
  }

}
