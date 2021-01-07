import 'package:flutter/material.dart';
import '../bloc.navigation_bloc/navigation_bloc.dart';

class Aboutgracket extends StatelessWidget with NavigationStates {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Gracket'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(40),
            child: Text(
              'Gracket is combination word of "grades on pocket". It is a mobile application that shows not just grade information but also features the user information and their exam schedule. This idea was created and made by Bry-Bry Miñoza Sabejon and Jyzryll Llwyz R. Sumicad. This is also serves as our final project for IT43a-Elective 4 to be submitted to Sir Mc Wilford Paclar!',
              style: TextStyle(
                fontSize: 20.0,
              ), //Textstyle
              textAlign: TextAlign.justify,
            ), //Text
          ), //Container
        ], //Children
      ), //Column
    ); //Scaffold
  }
}
