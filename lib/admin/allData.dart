import 'package:flutter/material.dart';

import '../firebaseConnection/productsDatabase.dart';
import '../homeScreen/homeScreen.dart';
import '../loginSignup/loginPage.dart';
import '../userAccess/home.dart';
import 'addProduct.dart';
import 'editPage.dart';

class AllData extends StatefulWidget {
  AllData({Key? key}) : super(key: key);

  @override
  State<AllData> createState() => _AllDataState();
}

class _AllDataState extends State<AllData> {

  int currentIndex = 0;
  GlobalKey<ScaffoldState> sKey = GlobalKey<ScaffoldState>();
  final pages = [
    AllData(),
    Home(),
  ];
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        key: sKey,
        appBar: AppBar(
          title: Text('Welcom Admin'),
          centerTitle: true,
          leading: Icon(Icons.person),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  child: const Icon(Icons.logout)),
            ),
          ],
        ),

        body: currentIndex==0? Center(
          child: ListView.builder(
            padding: EdgeInsets.all(10),
            //itemCount: mobileData.length,
            itemCount: MobileDatabase.data.length,
            itemBuilder: (context, index) =>
                mobs(
                  context,
                  name: MobileDatabase.data[index]['name'],
                  image: MobileDatabase.data[index]['image'],
                  desc: MobileDatabase.data[index]['desc'],
                  rating: MobileDatabase.data[index]['rating'],
                  cost: MobileDatabase.data[index]['price'],
                  key:MobileDatabase.data[index]['key'],
                ),
          ),
        ) : pages[currentIndex],
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => AddProduct()));
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.add),
              Text('Add'),
            ],
          ),
          foregroundColor: Colors.white,
        ),
        bottomNavigationBar: BottomNavigationBar(
          fixedColor: Colors.red,
          iconSize: 30.0,
          showUnselectedLabels: false,
          selectedIconTheme:const IconThemeData(size: 35),
          unselectedIconTheme: const IconThemeData(size: 25),
          currentIndex: currentIndex,
          items: const [
            BottomNavigationBarItem(
              label: 'Admin',
              icon: Icon(Icons.person),
            ),
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(Icons.home),
            ),
          ],
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}

Widget mobs(context, {
  String name = '',
  String image = '', String rating = '',
  String desc = '',
  String cost = '',
  String key = '',
}) {
  return Container(
    padding: EdgeInsets.all(5),
    height: 110,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(),
          child: Image.network(
            image,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              Row(
                children: [
                  for (int i = 0; i < int.parse(rating); i++)
                    const Icon(
                      Icons.star,
                      size: 15,
                      color: Colors.red,
                    ),
                ],
              ),
              Text(
                desc,
                maxLines: 1,
                overflow: TextOverflow.fade,
                style: const TextStyle(
                  color: Colors.black54,
                ),
              ),
              Text(
                cost,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ProductEdit(
                                image: image,
                                name: name,
                                price: cost,
                                desc: desc,
                                rating: rating,
                              ),
                        ),
                      );
                    },
                    child: const Text(
                      'EDIT',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      MobileDatabase.deleteData(key);
                      },
                    child: const Text(
                      'DELETE',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
