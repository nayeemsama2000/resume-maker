import 'package:flutter/material.dart';

class ExperienceModel {

  final TextEditingController companyName = TextEditingController();
  final TextEditingController position = TextEditingController();
  final TextEditingController desc = TextEditingController();
  final TextEditingController from = TextEditingController();
  final TextEditingController to = TextEditingController();


  ExperienceModel();

  Map<String, dynamic> toJson() {
    return {
      "companyName": companyName.text,
      "position": position.text,
      "desc": desc.text,
      "from": from.text,
      "to": to.text,
    };
  }
}