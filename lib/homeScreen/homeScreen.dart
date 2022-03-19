import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterfinalproject/firebaseConnection/loginDatabase.dart';
import 'package:flutterfinalproject/userAccess/cart2.dart';
import '../userAccess/home.dart';
import '../userAccess/uProfile.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  final pages = [
    Home(),
    // Cart(),
    Cart2(),
  ];
  GlobalKey<ScaffoldState> sKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: sKey,
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 80,
              child: AppBar(
                backgroundColor: Colors.red,
                leading: const Icon(Icons.home),
                title: const Text('Home'),

              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Icon(Icons.pages,color: Colors.black54),
                      MaterialButton(
                        onPressed: () {},
                        child:const Text(
                          'My Orders',
                          style:  TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.discount,color: Colors.black54),
                      MaterialButton(
                        onPressed: () {},
                        child:const Text(
                          'Offers',
                          style:  TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.add_shopping_cart,color: Colors.black54),
                      MaterialButton(
                        onPressed: () {},
                        child:const Text(
                          'Cart',
                          style:  TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.person,color: Colors.black54,),
                      MaterialButton(
                        onPressed: () {},
                        child:const Text(
                          'My Account',
                          style:  TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.notifications,color: Colors.black54,),
                      MaterialButton(
                        onPressed: () {},
                        child:const Text(
                          'My Notifications',
                          style:  TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      appBar: currentIndex == 0
          ? AppBar(
              centerTitle: true,
              backgroundColor: Colors.white,
              leading: GestureDetector(
                  child: Icon(Icons.menu,color: Colors.red,size: 35,),),
              actions: [
                const Icon(
                  Icons.notifications,
                  color: Colors.red,
                ),
                SizedBox(width: 20.0),
                GestureDetector(
                  onTap: (){
                    print(DataBase.data);
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> UserProfile()));
                  },
                  child:const Icon(
                    Icons.person,
                    color: Colors.red,
                  ),
                ),
                SizedBox(width: 20.0),
              ],
                title: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSFzBUW2qsImHG8MBdzZeVfpoYY4_7oi03lpw&usqp=CAU',
                  width: 120,
                ),
            )
          : null,
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.red,
        iconSize: 30.0,
        showUnselectedLabels: false,
        selectedIconTheme:const IconThemeData(size: 35),
        unselectedIconTheme: const IconThemeData(size: 25),
        currentIndex: currentIndex,
        items: const [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_shopping_cart), label: 'cart'),
        ],
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
