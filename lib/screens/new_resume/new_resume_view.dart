import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'new_resume_provider.dart';

class NewResumePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var arg = ModalRoute.of(context)?.settings.arguments;

    return ChangeNotifierProvider(
      create: (BuildContext context) => NewResumeProvider(),
      builder: (context, child) => _buildPage(context),
    );
  }

  Widget _buildPage(BuildContext context) {
    final provider = context.read<NewResumeProvider>();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Consumer<NewResumeProvider>(
          builder: (BuildContext context, value, Widget? child) {
            return ListView(
              children: [
                _centerTitle(name: 'New Resume', size: 28),
                const Divider(
                  thickness: 2,
                  height: 50,
                ),
                Container(child: Column(
                  children: [
                    _centerTitle(name: 'Details', size: 25),
                    TextFormField(
                      controller: provider.nameController,
                      keyboardType: TextInputType.text,
                      decoration:
                      InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)), enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(50)), labelText: 'Name'),
                    ),
                    const SizedBox(height: 20,),
                    TextFormField(
                      controller: provider.emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration:
                      InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)), enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(50)), labelText: 'Email'),
                    ),
                    const SizedBox(height: 20,),
                    TextFormField(
                      controller: provider.phoneController,
                      keyboardType: TextInputType.number,
                      decoration:
                      InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)), enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(50)), labelText: 'Phone No.'),
                    ),
                  ],
                ),),

                const Divider(thickness: 1,height: 30,),
                _centerTitle(name: 'Education', size: 25),
                ...List.generate(provider.educationList.length, (index) {

                  if(index==provider.educationList.length-1){
                    return Column(
                      children: [
                        Container(padding: const EdgeInsets.all(5),decoration: BoxDecoration(
                            color: Colors.blue.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(width: 3,color: Colors.blue)
                        ),child: Column(children: [
                          TextFormField(
                            controller: provider.educationList[index].place,
                            keyboardType: TextInputType.text,
                            decoration:
                            InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)), enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(50)), labelText: 'Place'),
                          ),
                          const SizedBox(height: 20,),
                          TextFormField(
                            controller: provider.educationList[index].course,
                            keyboardType: TextInputType.emailAddress,
                            decoration:
                            InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)), enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(50)), labelText: 'Course'),
                          ),
                          const SizedBox(height: 20,),
                          TextFormField(
                            controller: provider.educationList[index].grade,
                            keyboardType: TextInputType.number,
                            decoration:
                            InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)), enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(50)), labelText: 'Grade'),
                          ),
                          const SizedBox(height: 20,),
                          TextFormField(
                            controller: provider.educationList[index].date,
                            keyboardType: TextInputType.number,
                            decoration:
                            InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)), enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(50)), labelText: 'Date'),
                          ),
                        ],),),
                        SizedBox(height: 10,),
                        TextButton(onPressed: () {
                          provider.addEducation();
                        }, child: const Text('Add education'))
                      ],
                    );
                  }

                  return Container(margin: EdgeInsets.only(bottom: 15),padding: const EdgeInsets.all(5),decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(width: 3,color: Colors.blue)
                  ),child: Column(children: [
                    TextFormField(
                      controller: provider.educationList[index].place,
                      keyboardType: TextInputType.text,
                      decoration:
                      InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)), enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(50)), labelText: 'Place'),
                    ),
                    const SizedBox(height: 20,),
                    TextFormField(
                      controller: provider.educationList[index].course,
                      keyboardType: TextInputType.emailAddress,
                      decoration:
                      InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)), enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(50)), labelText: 'Course'),
                    ),
                    const SizedBox(height: 20,),
                    TextFormField(
                      controller: provider.educationList[index].grade,
                      keyboardType: TextInputType.number,
                      decoration:
                      InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)), enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(50)), labelText: 'Grade'),
                    ),
                    const SizedBox(height: 20,),
                    TextFormField(
                      controller: provider.educationList[index].date,
                      keyboardType: TextInputType.number,
                      decoration:
                      InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)), enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(50)), labelText: 'Date'),
                    ),
                  ],),);
                }),
                const Divider(thickness: 1,height: 30,),
                _centerTitle(name: 'Experience', size: 25),
                ...List.generate(provider.experienceList.length, (index) {

                  if(index==provider.experienceList.length-1){
                    return Column(
                      children: [
                        Container(padding: const EdgeInsets.all(5),decoration: BoxDecoration(
                            color: Colors.amber.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(width: 3,color: Colors.amber)
                        ),child: Column(children: [
                          TextFormField(
                            controller: provider.experienceList[index].companyName,
                            keyboardType: TextInputType.text,
                            decoration:
                            InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)), enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(50)), labelText: 'Company Name'),
                          ),
                          const SizedBox(height: 20,),
                          TextFormField(
                            controller: provider.experienceList[index].position,
                            keyboardType: TextInputType.emailAddress,
                            decoration:
                            InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)), enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(50)), labelText: 'Position'),
                          ),
                          const SizedBox(height: 20,),
                          TextFormField(
                            controller: provider.experienceList[index].desc,
                            maxLines: 5,
                            minLines: 3,
                            keyboardType: TextInputType.multiline,
                            decoration:
                            InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)), enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(50)), labelText: 'Description'),
                          ),
                          const SizedBox(height: 20,),
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: provider.experienceList[index].from,
                                  keyboardType: TextInputType.number,
                                  decoration:
                                  InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)), enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(50)), labelText: 'From'),
                                ),
                              ),
                              const SizedBox(width: 10,),
                              Expanded(
                                child: TextFormField(
                                  controller: provider.experienceList[index].to,
                                  keyboardType: TextInputType.number,
                                  decoration:
                                  InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)), enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(50)), labelText: 'To'),
                                ),
                              ),
                            ],
                          )
                        ],),),
                        SizedBox(height: 10,),
                        TextButton(onPressed: () {
                          provider.addExperience();
                        }, child: const Text('Add Experience'))
                      ],
                    );
                  }

                  return Container(margin: EdgeInsets.only(bottom: 15),padding: const EdgeInsets.all(5),decoration: BoxDecoration(
                      color: Colors.amber.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(width: 3,color: Colors.amber)
                  ),child: Column(children: [
                    TextFormField(
                      controller: provider.experienceList[index].companyName,
                      keyboardType: TextInputType.text,
                      decoration:
                      InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)), enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(50)), labelText: 'Company Name'),
                    ),
                    const SizedBox(height: 20,),
                    TextFormField(
                      controller: provider.experienceList[index].position,
                      keyboardType: TextInputType.emailAddress,
                      decoration:
                      InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)), enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(50)), labelText: 'Position'),
                    ),
                    const SizedBox(height: 20,),
                    TextFormField(
                      controller: provider.experienceList[index].desc,
                      maxLines: 5,
                      minLines: 3,
                      keyboardType: TextInputType.multiline,
                      decoration:
                      InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)), enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(50)), labelText: 'Description'),
                    ),
                    const SizedBox(height: 20,),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: provider.experienceList[index].from,
                            keyboardType: TextInputType.datetime,
                            decoration:
                            InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)), enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(50)), labelText: 'From'),
                          ),
                        ),
                        const SizedBox(width: 10,),
                        Expanded(
                          child: TextFormField(
                            controller: provider.experienceList[index].to,
                            keyboardType: TextInputType.number,
                            decoration:
                            InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)), enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(50)), labelText: 'To'),
                          ),
                        ),
                      ],
                    )
                  ],),);

                }),
                const Divider(thickness: 1,height: 30,),
                _centerTitle(name: 'Skills', size: 25),
                ...List.generate(provider.skillsList.length, (index) {

                  if(index==provider.skillsList.length-1){
                    return Column(
                      children: [
                        Container(padding: const EdgeInsets.all(5),decoration: BoxDecoration(
                            color: Colors.green.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(width: 3,color: Colors.green)
                        ),child: TextFormField(
                          controller: provider.skillsList[index],
                          keyboardType: TextInputType.text,
                          decoration:
                          InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)), enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(50)), labelText: 'Skill'),
                        ),),
                        SizedBox(height: 10,),
                        TextButton(onPressed: () {
                          provider.addSkill();
                        }, child: const Text('Add Skill'))
                      ],
                    );
                  }

                  return Container(margin: EdgeInsets.only(bottom: 15),padding: const EdgeInsets.all(5),decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(width: 3,color: Colors.green)
                  ),child: TextFormField(
                    controller: provider.skillsList[index],
                    keyboardType: TextInputType.text,
                    decoration:
                    InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)), enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(50)), labelText: 'Skill'),
                  ),);
                }),
                SizedBox(height: 20,),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
                  child: ElevatedButton(onPressed: () { provider.createResume(context); }, child: Text('Create Resume'),style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 60)),)
                )
              ],
            );
          },
        ),
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
