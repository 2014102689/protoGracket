import 'package:flutter/material.dart';
import 'package:protoGracket/widgets/login.dart';
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
        title: Text('Account Settings'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            textSection(),
            buttonSection(),
            deleteAccountSection(),
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

  deleteAccount() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String id = sharedPreferences.getInt("id").toString();
    var jsonResponse = null;
    var response = await http
        .delete("http://10.0.2.2/src/restful/public/api/auth/delete/" + id);
    if (response.statusCode == 200) {
      jsonResponse = json.decode(response.body);
      if (jsonResponse != null) {
        if (jsonResponse['status'] == true) {
          sharedPreferences.clear();
          sharedPreferences.commit();
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (BuildContext context) => LoginPage()),
              (Route<dynamic> route) => false);
        }
      }
    } else {
      print("Network Error.");
    }
  }

  Container deleteAccountSection() {
    return Container(
      margin: EdgeInsets.only(top: 50.0),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            alignment: Alignment.centerLeft,
            child: Text(
              'Delete Account',
              style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.yellow[700]),
            ),
          ),
          Container(
            height: 1,
            decoration: BoxDecoration(
              color: Colors.black,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
            child: Text(
              'Once you delete this account, there is no going back. Please be certain.',
              style: TextStyle(fontSize: 15.0, color: Colors.red),
            ),
          ),
          RaisedButton(
            onPressed: () {
              deleteAccount();
            },
            elevation: 0.0,
            color: Colors.yellow[700],
            child: Text("Delete Account",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 17)),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        ],
      ),
    );
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
        Container(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          alignment: Alignment.centerLeft,
          child: Text(
            'Change Password',
            style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                color: Colors.blue),
          ),
        ),
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
