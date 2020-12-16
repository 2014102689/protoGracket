import 'package:flutter/material.dart';
import '../bloc.navigation_bloc/navigation_bloc.dart';

class MyProfile extends StatelessWidget with NavigationStates {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ), //AppBar
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(children: [
              Container(
                  child: Text('Image'),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.blue,
                  ),
                  padding: EdgeInsets.all(60.0),
                  margin: EdgeInsets.fromLTRB(10, 20, 10, 20)),

              /*Container( 
                                        
                                                child: Text('Jyzryll Llwyz R. Sumicad', 
                                                    style: TextStyle(
                                                        fontSize: 16.0,
                                                        fontWeight: FontWeight.bold,
                                                        ),

                                                    ),
                                                    decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(6.0),
                                                        shape: BoxShape.rectangle,
                                                        color: Colors.green,
                                                    ),
                                                    padding: EdgeInsets.all(5.0),
                                                    margin: EdgeInsets.fromLTRB(5, 5, 5, 5) ), */

              Container(
                margin: EdgeInsets.fromLTRB(40, 1, 5, 1),
                child: ListTile(
                  //leading: FlutterLogo(size: 56.0),
                  title: Text(
                    'Jyzryll Llwyz R. Sumicad',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  subtitle: Text('Full Name'),
                  //trailing: Icon(Icons.more_vert),
                ),
              ), //Container
              Container(
                margin: EdgeInsets.fromLTRB(40, 1, 5, 1),
                child: ListTile(
                  //leading: FlutterLogo(size: 56.0),
                  title: Text(
                    '23',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  subtitle: Text('Age'),
                  //trailing: Icon(Icons.more_vert),
                ),
              ), //Container
              Container(
                margin: EdgeInsets.fromLTRB(40, 1, 5, 1),
                child: ListTile(
                  //leading: FlutterLogo(size: 56.0),
                  title: Text(
                    'May 7, 1997',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  subtitle: Text('Birthdate'),
                  //trailing: Icon(Icons.more_vert),
                ),
              ), //Container
              Container(
                margin: EdgeInsets.fromLTRB(40, 1, 5, 1),
                child: ListTile(
                  //leading: FlutterLogo(size: 56.0),
                  title: Text(
                    '2015***150',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  subtitle: Text('ID Number'),
                  //trailing: Icon(Icons.more_vert),
                ),
              ), //Container
              Container(
                margin: EdgeInsets.fromLTRB(40, 1, 5, 1),
                child: ListTile(
                  //leading: FlutterLogo(size: 56.0),
                  title: Text(
                    'BS-IT 4R4',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  subtitle: Text('Course year & Section'),
                  //trailing: Icon(Icons.more_vert),
                ),
              ), //Container
              Container(
                margin: EdgeInsets.fromLTRB(40, 1, 5, 1),
                child: ListTile(
                  //leading: FlutterLogo(size: 56.0),
                  title: Text(
                    'sumicadjyzryll@gmail.com',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  subtitle: Text('Active Email'),
                  //trailing: Icon(Icons.more_vert),
                ),
              ), //Container
            ]), //Column

            /* Container(
                        height: 50,
                    decoration: BoxDecoration(
                    color: Colors.red,
                    
                ),//BoxDecoration
                child: Text('Test'),
                ),//Container  
                Container(
                    decoration: BoxDecoration(
                    color: Colors.green,
                ),//BoxDecoration
                child: Text('Testing'),
                ),      
                Container(
                    decoration: BoxDecoration(
                    color: Colors.blue,
                ),//BoxDecoration
                child: Text('Testingi'),
            ),*/
          ], //Children
        ),
      ),
    ); //Column & Scaffold
  }
}
