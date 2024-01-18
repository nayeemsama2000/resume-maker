import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nayeem_sama_test/models/education_model.dart';
import 'package:nayeem_sama_test/models/experience_model.dart';
import 'package:nayeem_sama_test/models/project_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart' as FStore;


class ShowResumeProvider extends ChangeNotifier {

  Map<String, dynamic> cv = {};

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  List<EducationModel> educationList = [];
  List<ProjectModel> projectsList = [];
  List skillsList = [];
  List<ExperienceModel> experienceList = [];

  ShowResumeProvider(String id){
    fetch(id);
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

  void createResume(context) async {
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
    await FStore.FirebaseFirestore.instance.collection('resumes').add(cv);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Resume created')));
    Future.delayed(Duration(seconds: 3),() {
      Navigator.of(context).pop();
    },);
  }

  void fetch(id) async {
    var doc = await FStore.FirebaseFirestore.instance.collection('resumes').doc(id).get();
    doc.data();
    print('showing ${doc.data()}');
  }

  showS(context){
    Future.delayed(Duration(seconds: 3),() {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Fetched Resume in log!!')));

    },);
  }

}
