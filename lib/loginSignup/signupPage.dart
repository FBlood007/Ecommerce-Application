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
  String city = '';
  String mobile = '';
  String fullName = '';

  //TextEditingController userNameController = TextEditingController();
  TextEditingController emailIdController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController cityController = TextEditingController();

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
      fullNameController.text,
      mobileController.text,
      cityController.text,
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
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    input(fullNameController,'Enter Full Name','Full Name'),
                    const SizedBox(
                      height: 10,
                    ),
                    input(emailIdController,'Enter Email','Email-ID'),
                    const SizedBox(
                      height: 10,
                    ),
                    input(passwordController,'Enter Password','Password'),
                    const SizedBox(
                      height: 10,
                    ),
                    input(mobileController,'Enter Mobile','Mobile No.'),
                    const SizedBox(
                      height: 10,
                    ),
                    input(cityController,'Enter City','City'),
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
                                        const Text('Enter Email and Password'),
                                        Container(
                                          color: Colors.blue,
                                          child: MaterialButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child:const Text('OK'),
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
      ),
    );
  }
}

Widget input(type,hintText,labelText) {
  return TextField(
    controller: type,
    decoration: InputDecoration(
      hintText: hintText,
      labelText: labelText,
      labelStyle: const TextStyle(color: Colors.white60),
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
  );
}