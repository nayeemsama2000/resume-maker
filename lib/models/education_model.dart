import 'package:flutter/cupertino.dart';

class EducationModel {

  final TextEditingController course = TextEditingController();
  final TextEditingController place = TextEditingController();
  final TextEditingController grade = TextEditingController();
  final TextEditingController date = TextEditingController();

  EducationModel();

  Map<String, dynamic> toJson() {
    return {
      "course": course.text,
      "place": place.text,
      "grade": grade.text,
      "date": date.text,
    };
  }
}