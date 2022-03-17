import 'package:flutter/material.dart';

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
                color: Colors.blue,
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
                  color: Colors.blue,
                ),
              ),
              const SizedBox(width: 20.0),
            ],
            title: const Text(
              'Profile',
              style: TextStyle(
                  color: Colors.blue, fontWeight: FontWeight.bold),
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
                      Text('Name : User',style: text()),
                      const SizedBox(height: 10,),
                      Text('Email-Id : user@gmail.com',style: text()),
                      const SizedBox(height: 10,),
                      Text('Address : Pune',style: text()),
                      const SizedBox(height: 10,),
                      Text('Mobile : 9881974974',style: text()),
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
