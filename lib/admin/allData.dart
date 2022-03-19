import 'package:flutter/material.dart';

import '../firebaseConnection/productsDatabase.dart';
import '../homeScreen/homeScreen.dart';
import '../loginSignup/loginPage.dart';
import '../userAccess/home.dart';
import 'addProduct.dart';
import 'category/categoryData.dart';
import 'editPage.dart';

class AllData extends StatefulWidget {
  AllData({Key? key}) : super(key: key);

  static List mobileData = [];

  @override
  State<AllData> createState() => _AllDataState();
}

class _AllDataState extends State<AllData> {
  GlobalKey<ScaffoldState> sKey = GlobalKey<ScaffoldState>();

  addData(category) {

    setState(() {
      //AllData.mobileData.clear();
      MobileDatabase.data.forEach((element) {
        if (element.values.contains(category)) {
          AllData.mobileData.add(element.cast());
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Map> data = [
      {
        'item1': 'Mobiles',
        'image1': 'assets/mobile.png',
        'onTap': () {
          addData('mobiles');
          Navigator.push(context, MaterialPageRoute(builder: (context) =>
              CategoryData(
                name: 'Mobile Category',categ :'mobiles'
              )
          ),);
        }
      },
      {
        'image1': 'assets/book.png',
        'item1': 'Books',
        'onTap': () {
          addData('books');
          Navigator.push(context, MaterialPageRoute(builder: (context) =>
              CategoryData(name: 'Books Category',categ :'books')
          ),);
        }
      },
      {
        'image1': 'assets/toys.png',
        'item1': 'Toys',
        'onTap': () {
          addData('toys');
          Navigator.push(context, MaterialPageRoute(builder: (context) =>
              CategoryData(name: 'Toys Category',categ :'toys')
          ),);
        }
      },
      {
        'image1': 'assets/fruit.png',
        'item1': 'Fresh',
        'onTap': () {
          addData('fresh');
          Navigator.push(context, MaterialPageRoute(builder: (context) =>
              CategoryData(name: 'Fresh Category',categ :'fresh')
          ),);
        }
      },
      {
        'image1': 'assets/fashion.png',
        'item1': 'Fashion',
        'onTap': () {
          addData('fashion');
          Navigator.push(context, MaterialPageRoute(builder: (context) =>
              CategoryData(name: 'Fashion Category',categ :'fashion')
          ),);
        }
      },
      {
        'image1': 'assets/appliances.png',
        'item1': 'Appliances',
        'onTap': () {
          addData('appliances');
          Navigator.push(context, MaterialPageRoute(builder: (context) =>
              CategoryData(name: 'Appliances Category',categ :'appliances')
          ),);
        }
      },
      {
        'image1': 'assets/essentials.png',
        'item1': 'Essentials',
        'onTap': () {
          addData('essentials');
          Navigator.push(context, MaterialPageRoute(builder: (context) =>
              CategoryData(name: 'Essentials Category',categ :'essentials')
          ),);
        }
      },
      {
        'image1': 'assets/pharma.png',
        'item1': 'Pharmacy',
        'onTap': () {
          addData('pharmacy');
          Navigator.push(context, MaterialPageRoute(builder: (context) =>
              CategoryData(name: 'Pharmacy Category',categ :'pharmacy')
          ),);
        }
      },
    ];
    return SafeArea(
      child: Scaffold(
        key: sKey,
        appBar: AppBar(
          title: Text('Welcom Admin'),
          centerTitle: true,
          leading: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left:8.0),
                child: GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>
                        HomeScreen())
                      );
                    },
                    child: Text('To App')),
              ),
            ],
          ),
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

        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: GridView.builder(
              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemCount: data.length,
              itemBuilder: (context, index) =>
                  items(
                    context,
                    image1: data[index]['image1'],
                    item1: data[index]['item1'],
                    onTap: data[index]['onTap'],
                  ),
            ),
          ),
        ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //     Navigator.push(
        //         context, MaterialPageRoute(builder: (context) => AddProduct()));
        //   },
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: const [
        //       Icon(Icons.add),
        //       Text('Application'),
        //     ],
        //   ),
        //   foregroundColor: Colors.white,
        // ),

      ),
    );
  }
}


Widget items(
    context, {
      String image1 = '',
      String item1 = '',
      required void Function() onTap,
    }) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15.0),
    child: Column(
      children: [
        GestureDetector(
          onTap:  onTap,

          child: Column(
            children: [
              CircleAvatar(
                child: Image.asset(
                  image1,
                  height: 50,
                ),
                // backgroundColor: Colors.grey,
                foregroundColor: Colors.black,
                radius: 40,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                item1,
                style: const TextStyle(fontSize: 13, color: Colors.black),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}