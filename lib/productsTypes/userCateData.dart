import 'package:flutter/material.dart';
import 'package:flutterfinalproject/firebaseConnection/cardDatabase.dart';

import '../homeScreen/homeScreen.dart';
import '../userAccess/home.dart';

List cart = [];

class UserCategData extends StatelessWidget {
  UserCategData({Key? key, this.name = ''}) : super(key: key);
  String name = '';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(name),
        centerTitle: true,
        leading: GestureDetector(
            onTap: () {
              Home.mobileData.clear();
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomeScreen()));
            },
            child: const Icon(Icons.keyboard_backspace)),
      ),
      body: Center(
        child: ListView.builder(
          padding: const EdgeInsets.all(10),
          //itemCount: mobileData.length,
          itemCount: Home.mobileData.length,
          itemBuilder: (context, index) =>
              mobs(
                context,
                Home.mobileData[index],
                name: Home.mobileData[index]['name'],
                image: Home.mobileData[index]['image'],
                products: Home.mobileData[index]['desc'],
                rating: Home.mobileData[index]['rating'],
                cost: Home.mobileData[index]['price'],
                quantity: Home.mobileData[index]['quantity'],

              ),
        ),
      ),
    );
  }
}

Widget mobs(context,
    Map data,
    {
      String name = '',
      String image = '',
      String rating = '',
      String products = '',
      String cost = '',
      String quantity = '',
    }) {
  return Container(
    padding: const EdgeInsets.all(5),
    height: 110,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: Image.network(
            image,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
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
              products,
              maxLines: 1,
              overflow: TextOverflow.fade,
              style: const TextStyle(
                color: Colors.black54,
              ),
            ),
            Text(
              '₹$cost',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            GestureDetector(
                onTap: () {
                  // cart.add(MobileDatabase.data[index]);
                  CartDatabase.insertData(
                      name,
                      cost,
                      image,
                      products,
                      quantity,);
                  cart.add(data);
                  //Mobiles.cart.clear();
                  print('***** $cart');
                  //print(MobileDatabase.data);
                  showDialog(context: context, builder: (context) =>
                      AlertDialog(
                        alignment: Alignment.center,
                        actions: [
                          Text('$name added to cart !'),
                          Container(
                            color: Colors.blue,
                            child: MaterialButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('OK'),
                            ),
                          ),
                        ],
                      ));
                },
                child: const Text(
                  'Add to Cart',
                  style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),
                )),
          ],
        ),
      ],
    ),
  );
}
