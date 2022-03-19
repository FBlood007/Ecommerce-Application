import 'package:flutter/material.dart';
import 'package:flutterfinalproject/firebaseConnection/loginDatabase.dart';

import '../loginSignup/loginPage.dart';


class UserProfile extends StatelessWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar:AppBar(
            centerTitle: true,
            backgroundColor: Colors.white,
            leading:GestureDetector(
              onTap: (){
                Navigator.pop(context, MaterialPageRoute(builder: (context)=> UserProfile()));
              },
              child:const Icon(
                Icons.keyboard_backspace_outlined,
                color: Colors.red,
                size: 30,
              ),
            ),
            actions: [
              const SizedBox(width: 20.0),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginPage()));
                },
                child:const Icon(
                  Icons.logout,
                  color: Colors.red,
                ),
              ),
              const SizedBox(width: 20.0),
            ],
            title: const Text(
              'Profile',
              style: TextStyle(
                  color: Colors.red, fontWeight: FontWeight.bold),
            ),
          ),
        body: Center(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  const CircleAvatar(
                    backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQuRMtrxXdjQvBk9KtnpV380Hp3tgahZPW8mA&usqp=CAU'),
                    radius: 100,
                  ),
                  const SizedBox(height: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Name : ${DataBase.user['fullName']}',style: text()),
                      const SizedBox(height: 10,),
                      Text('Email-Id : ${DataBase.user['email']}',style: text()),
                      const SizedBox(height: 10,),
                      Text('City : ${DataBase.user['city']} ',style: text()),
                      const SizedBox(height: 10,),
                      Text('Mobile : ${DataBase.user['mobile']}',style: text()),
                    ],
                  ),
                ],
              ),
            ),
        ),
      ),
    );
  }
}
TextStyle text(){
  return TextStyle(fontSize: 30,);
}
