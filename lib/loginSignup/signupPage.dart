import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../firebaseConnection/loginDatabase.dart';
import 'loginPage.dart';


final FirebaseAuth auth = FirebaseAuth.instance;

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String role = 'User';

  //String userName = '';
  String emailId = '';
  String password = '';

  //TextEditingController userNameController = TextEditingController();
  TextEditingController emailIdController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  create() async {
    User? user = (await auth.createUserWithEmailAndPassword(
            email: emailIdController.text, password: passwordController.text))
        .user;
    //emailId = user!.email!;
    setState(() {});
    print(user?.email);
    print(user?.uid);
  }

  void dispose() {
    emailIdController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  isSubmited() {
   // User? user = auth.currentUser;

    DataBase.insertData(
      emailIdController.text,
      passwordController.text,
    ).then((value) {
      setState(() {});
    });
    if (emailIdController.text != null && passwordController.text != null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  "https://mir-s3-cdn-cf.behance.net/project_modules/disp/496ecb14589707.562865d064f9e.png"),
              fit: BoxFit.cover),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Column(
                children: [
                  // TextField(
                  //   controller: userNameController,
                  //   decoration: InputDecoration(
                  //     hintText: 'Enter User Name',
                  //     labelText: 'User Name',
                  //     floatingLabelBehavior: FloatingLabelBehavior.auto,
                  //     floatingLabelAlignment: FloatingLabelAlignment.center,
                  //     focusedBorder: OutlineInputBorder(
                  //       borderRadius: BorderRadius.circular(15.0),
                  //       borderSide: const BorderSide(
                  //         color: Colors.blue,
                  //         width: 3,
                  //       ),
                  //     ),
                  //     border: OutlineInputBorder(
                  //         borderRadius: BorderRadius.circular(15.0),
                  //         borderSide: const BorderSide(
                  //           color: Colors.black,
                  //           width: 3,
                  //         )),
                  //   ),
                  // ),
                  Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: emailIdController,
                    decoration: InputDecoration(
                      hintText: 'Enter Email',
                      labelText: 'Email-ID',
                      labelStyle: TextStyle(color: Colors.white60),
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
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      hintText: 'Enter Password',
                      labelText: 'Password',
                      labelStyle: TextStyle(color: Colors.white60),
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
                          )),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  // Container(
                  //   decoration: BoxDecoration(
                  //   ),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       Text('Role : ',style: TextStyle(fontSize: 17),),
                  //       DropdownButton<String>(
                  //         value: role,
                  //         icon: const Icon(Icons.arrow_downward),
                  //         elevation: 16,
                  //         style: const TextStyle(color: Colors.deepPurple),
                  //         // underline: Container(
                  //         //
                  //         //   height: 2,
                  //         //   color: Colors.deepPurpleAccent,
                  //         // ),
                  //         onChanged: (String? newValue) {
                  //           setState(() {
                  //             role = newValue!;
                  //           });
                  //         },
                  //         items: <String>[
                  //           'Admin',
                  //           'User',
                  //         ].map<DropdownMenuItem<String>>((String value) {
                  //           return DropdownMenuItem<String>(
                  //             value: value,
                  //             child: Text(value),
                  //           );
                  //         }).toList(),
                  //       ),
                  //
                  //     ],
                  //   ),
                  // ),
                  MaterialButton(
                    onPressed: () {
                      emailIdController.text.isNotEmpty &&
                              passwordController.text.isNotEmpty
                          ? {isSubmited(),create()}
                          : showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    alignment: Alignment.center,
                                    actions: [
                                      Text('Enter Email and Password'),
                                      Container(
                                        color: Colors.blue,
                                        child: MaterialButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text('OK'),
                                        ),
                                      ),
                                    ],
                                  ));
                    },
                    color: Colors.white10,
                    child: const Text(
                      'Submit',
                      style: TextStyle(
                        color: Colors.white54,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    color: Colors.white10,
                    child: const Text(
                      'Back',
                      style: TextStyle(
                        color: Colors.white54,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
