import 'package:flutter/material.dart';
import 'package:nayeem_sama_test/screens/show_resume/show_resume_provider.dart';
import 'package:provider/provider.dart';


class ShowResumePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Map arg = ModalRoute.of(context)!.settings.arguments as Map;

    return ChangeNotifierProvider(
      create: (BuildContext context) => ShowResumeProvider(arg['id']),
      builder: (context, child) => _buildPage(context),
    );
  }

  Widget _buildPage(BuildContext context) {
    final provider = context.read<ShowResumeProvider>();

    provider.showS(context);

    return Scaffold(
      body: Center(
        child: Text('Resume here!!!'),
      ),
    );
  }

  _centerTitle({required String name, required double size}){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          name,
          style: TextStyle(fontSize: size, color: Colors.black),
        ),
      ],
    );
  }

}
