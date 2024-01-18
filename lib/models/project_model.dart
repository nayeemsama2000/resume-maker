import 'package:flutter/material.dart';

class ProjectModel {

  final TextEditingController title = TextEditingController();
  final TextEditingController desc = TextEditingController();
  final TextEditingController platform = TextEditingController();
  final TextEditingController date = TextEditingController();

  ProjectModel();

  Map<String, dynamic> toJson() {
    return {
      "title": title.text,
      "desc": desc.text,
      "platform": platform.text,
      "date": date.text,
    };
  }
}