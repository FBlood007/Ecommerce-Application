import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfinalproject/loginSignup/signupPage.dart';
import '../admin/allData.dart';
import '../firebaseConnection/loginDatabase.dart';
import '../firebaseConnection/productsDatabase.dart';
import '../homeScreen/homeScreen.dart';


class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String emailId = '';
  String password = '';
  String selectedDataKey = '';

  TextEditingController emailIdController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  bool _success = false;

  void initState() {
    super.initState();
    login();
  }

  login() async {
    final User? user = (await auth.signInWithEmailAndPassword(
      email: emailIdController.text,
      password: passwordController.text,
    ))
        .user;

    if (user != null) {
      // setState(() {
      _success = true;
      emailId = user.email!;
      // });
      // roleCheck();

      DataBase.selectData().then((value) {
        DataBase.selectedUser(emailIdController.text).then((value) {
          if (value == 'admin') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AllData()),
            );
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          }
        });
      });
    } else {
      setState(() {
        _success = false;
      });
    }
  }

  GlobalKey<FormState> key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      // decoration:const BoxDecoration(
      //   image: DecorationImage(
      //     image: AssetImage('assets/background.png'),
      //         fit: BoxFit.cover),
      //   ),
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(
                "https://mir-s3-cdn-cf.behance.net/project_modules/disp/496ecb14589707.562865d064f9e.png"),
            fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Form(
            key: key,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/logo.png'),
                const SizedBox(
                  height: 50,
                ),
                TextFormField(
                  controller: emailIdController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    hintText: 'Email-Id',
                    labelText: 'Email-Id',
                    labelStyle: const TextStyle(color: Colors.white54),
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    floatingLabelAlignment: FloatingLabelAlignment.center,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: 1,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: 4,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: passwordController,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.password),
                    hintText: 'Password',
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.white54),
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    floatingLabelAlignment: FloatingLabelAlignment.center,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: 1,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: 3,
                      ),
                    ),
                  ),
                ),
                MaterialButton(
                  onPressed: () async {
                    //DataBase.data.contains(emailIdController.text);
                    // roleCheck();
                    MobileDatabase.selectData();
                    login();
                    // print(_success);
                    // _success
                    //     ? null
                    //     : showDialog(
                    //     context: context,
                    //     builder: (context) =>
                    //     const AlertDialog(
                    //       actions: [Text('Enter Valid Id/Pass')],
                    //     ));
                  },
                  color: Colors.white10,
                  child: const Text(
                    'Login',
                    style: TextStyle(
                        color: Colors.white54, fontWeight: FontWeight.bold),
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    //DataBase.deleteData();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Register()),
                    );
                  },
                  color: Colors.white10,
                  child: const Text(
                    'Register',
                    style: TextStyle(
                        color: Colors.white54, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
