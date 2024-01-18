import 'package:flutter/material.dart';
import 'package:nayeem_sama_test/screens/new_resume/new_resume_view.dart';
import 'package:provider/provider.dart';

import 'home_list_provider.dart';

class HomeListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildPage(context);
  }

  Widget _buildPage(BuildContext context) {
    final provider = context.read<HomeListProvider>();

    return Scaffold(
      body: Column(
        children: [
          StreamBuilder<dynamic>(
            stream: provider.fetchResumes(),
            builder: (context, snapshot) {
              if(snapshot.connectionState==ConnectionState.waiting){
                return Center(child: CircularProgressIndicator(),);
              }
              print('ddd ${snapshot.data.docs.length}');
              return ListView.separated(
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 100,
                    child: Material(
                      child: InkWell(
                        onTap: () {

                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Rusume $index'),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(height: 10);
                },
                itemCount: snapshot.data.docs.length,
              );
            }
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return NewResumePage();
        },));
      },child: Icon(Icons.add)),
    );
  }
}
