import 'package:flutter/material.dart';
import '../bloc.navigation_bloc/navigation_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ChangePassed extends StatefulWidget with NavigationStates {
  @override
  _ChangePassedState createState() => _ChangePassedState();
}

class _ChangePassedState extends State<ChangePassed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Password'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            textSection(),
            buttonSection(),
          ],
        ),
      ),
    );
  }

  changePass(String oldPass, String newPass, String rePass) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String id = sharedPreferences.getInt("id").toString();
    Map data = {
      'id': id,
      'oldpass': oldPass,
      'newpass': newPass,
      'repass': rePass
    };
    var jsonResponse = null;
    var response = await http.put(
        "http://10.0.2.2/src/restful/public/api/auth/changepass",
        body: data);
    if (response.statusCode == 200) {
      jsonResponse = json.decode(response.body);
      if (jsonResponse != null) {
        if (jsonResponse['status'] == true) {
          print(jsonResponse['message'].toString());
        }
      }
    } else {
      print("Network Error.");
    }
  }

  Container buttonSection() {
    return Container(
      height: 40.0,
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      margin: EdgeInsets.only(top: 15.0),
      child: RaisedButton(
        onPressed: () {
          changePass(oldPassController.text, newPassController.text,
              rePassController.text);
        },
        elevation: 0.0,
        color: Colors.blue,
        child: Text("Change Password", style: TextStyle(color: Colors.white70)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      ),
    );
  }

  final TextEditingController oldPassController = new TextEditingController();
  final TextEditingController newPassController = new TextEditingController();
  final TextEditingController rePassController = new TextEditingController();

  Container textSection() {
    return Container(
      child: Column(children: <Widget>[
        TextFormField(
          controller: oldPassController,
          obscureText: true,
          decoration: InputDecoration(
            hintText: 'Enter old password',
            labelText: 'Old Password',
            labelStyle: TextStyle(fontSize: 20, color: Colors.black),
            border: OutlineInputBorder(),
            suffixIcon: Icon(Icons.security),
          ), //Inputdecor
        ), //TexField
        SizedBox(
          height: 20,
        ), //SizeBox
        TextFormField(
          controller: newPassController,
          obscureText: true,
          decoration: InputDecoration(
            hintText: 'Enter new password',
            helperText: 'password that is easy to remember',
            labelText: 'New Password',
            labelStyle: TextStyle(fontSize: 20, color: Colors.black),
            border: OutlineInputBorder(),
            suffixIcon: Icon(Icons.security),
          ), //Inputdecor
        ), //TexField
        SizedBox(
          height: 20,
        ), //SizeBox
        TextFormField(
          controller: rePassController,
          obscureText: true,
          decoration: InputDecoration(
            hintText: 'Re-enter new password',
            helperText: 'Make sure to remember this new password',
            labelText: 'Re-type New password',
            labelStyle: TextStyle(fontSize: 20, color: Colors.black),
            border: OutlineInputBorder(),
            suffixIcon: Icon(Icons.security),
          ), //Inputdecor
        ), //TexField
        SizedBox(
          height: 30,
        ),
      ]),
    );
  }
}
