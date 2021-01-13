import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:protoGracket/widgets/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light
        .copyWith(statusBarColor: Colors.transparent));
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.black, Colors.white],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
        ),
        child: _isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView(
                children: <Widget>[
                  headerSection(),
                  textSection(),
                  buttonSection(),
                ],
              ),
      ),
    );
  }

  signIn(String id, String email, String password) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map data = {'id': id, 'email': email, 'password': password};
    var jsonResponse = null;
    var response = await http.post(
        "http://10.0.2.2/src/restful/public/api/auth/register",
        body: data);
    if (response.statusCode == 200) {
      jsonResponse = json.decode(response.body);
      if (jsonResponse != null) {
        setState(() {
          _isLoading = false;
        });

        sharedPreferences.setString("token", jsonResponse['token']);
        sharedPreferences.setInt("id", jsonResponse['id']);

        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (BuildContext context) => LoginPage()),
            (Route<dynamic> route) => false);
      } else {
        setState(() {
          _isLoading = false;
        });
        print("Incorrect Username and Password.");
      }
    } else {
      setState(() {
        _isLoading = false;
      });
      print("Network Error.");
    }
  }

  Container buttonSection() {
    return Container(
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 40.0,
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            margin: EdgeInsets.only(top: 15.0),
            child: RaisedButton(
              onPressed: idController.text == "" ||
                      emailController.text == "" ||
                      passwordController.text == ""
                  ? null
                  : () {
                      setState(() {
                        _isLoading = true;
                      });
                      signIn(idController.text, emailController.text,
                          passwordController.text);
                    },
              elevation: 0.0,
              color: Colors.black,
              child: Text("Create", style: TextStyle(color: Colors.white70)),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            margin: EdgeInsets.only(top: 40.0),
            child: FlatButton(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (BuildContext context) => LoginPage()),
                    (Route<dynamic> route) => false);
              },
              child: Text("< Back", style: TextStyle(color: Colors.black)),
            ),
          ),
        ],
      ),
    );
  }

  final TextEditingController idController = new TextEditingController();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  Container textSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 0.0),
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: idController,
            cursorColor: Colors.black,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
              icon: Icon(Icons.person, color: Colors.black),
              hintText: "ID No.",
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)),
              hintStyle: TextStyle(color: Colors.black),
            ),
          ),
          SizedBox(height: 30.0),
          TextFormField(
            controller: emailController,
            cursorColor: Colors.black,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
              icon: Icon(Icons.mail, color: Colors.black),
              hintText: "Email",
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)),
              hintStyle: TextStyle(color: Colors.black),
            ),
          ),
          SizedBox(height: 30.0),
          TextFormField(
            controller: passwordController,
            cursorColor: Colors.black,
            obscureText: true,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
              icon: Icon(Icons.lock, color: Colors.black),
              hintText: "Password",
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)),
              hintStyle: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }

  Container headerSection() {
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 50.0),
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 60.0),
            child: Text("Gracket",
                style: TextStyle(
                    color: Colors.white70,
                    fontSize: 70.0,
                    fontWeight: FontWeight.bold)),
          ),
          Container(
            margin: EdgeInsets.only(top: 50.0),
            padding: EdgeInsets.symmetric(horizontal: 260.0, vertical: 60.0),
            child: Text(
              '.',
              style: TextStyle(
                  fontSize: 70.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.red),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 200.0),
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 0.0),
            child: Text(
              'Grade on Pocket',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 250.0),
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 0.0),
            child: Center(
              child: Text(
                'Create Account',
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}
