import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterfinalproject/firebaseConnection/cardDatabase.dart';

import '../homeScreen/homeScreen.dart';

class Cart2 extends StatefulWidget {
  const Cart2({Key? key}) : super(key: key);

  @override
  State<Cart2> createState() => _Cart2State();
}

class _Cart2State extends State<Cart2> {
  @override
  Widget build(BuildContext context) {
    // void initState() {
    //   CartDatabase.selectData();
    //   super.initState();
    // }

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Text('Cart',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          centerTitle: true,
          leading: GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomeScreen()));
            },
            child: const Icon(Icons.keyboard_backspace),
          ),
          actions: [
            // Padding(
            //   padding: EdgeInsets.only(right: 8.0),
            //   child: Center(
            //     child: GestureDetector(
            //       onTap: () {
            //         setState(() {
            //           //cart.clear();
            //         });
            //       },
            //       child: const Text(
            //         'Clear Cart',
            //         textAlign: TextAlign.center,
            //       ),
            //     ),
            //   ),
            // )
          ],
        ),
        body: Center(
          child: Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(10),
              itemCount: CartDatabase.data.length,
              itemBuilder: (context, index) => carts(
                context,
                CartDatabase.data[index],
                name: CartDatabase.data[index]['name'],
                image: CartDatabase.data[index]['image'],
                products: CartDatabase.data[index]['desc'],
                cost: CartDatabase.data[index]['price'],
                quantity: CartDatabase.data[index]['quantity'],
                id: CartDatabase.data[index]['id'],
              ),
            ),
          ),
        ));
  }

  Widget carts(
    context,
    Map data, {
    String id = '',
    String name = '',
    String image = '',
    String rating = '',
    String products = '',
    String cost = '',
    String quantity = '',
  }) {
    return Container(
      padding: const EdgeInsets.all(5),
      height: 130,
      child: Expanded(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              image,
              fit: BoxFit.fill,
              width: 100,
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
                Text(
                  products,
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
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {});
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.red),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        height: 28,
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (int.parse(quantity) > 1) {
                                    int qnt = int.parse(quantity) - 1;
                                    CartDatabase.updateDate(
                                        quantity: qnt.toString(), id: id);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Cart2()));
                                  }
                                });
                              },
                              child: Container(
                                child: Icon(
                                  Icons.remove,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                            Container(
                              height: double.infinity,
                              width: 30,
                              color: Colors.red,
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 3, right: 3),
                                  child: Text(
                                    quantity,
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  int qnt = int.parse(quantity) + 1;
                                  CartDatabase.updateDate(
                                      quantity: qnt.toString(), id: id);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Cart2()));
                                });
                              },
                              child: Icon(
                                Icons.add,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        CartDatabase.deleteData(id);
                        print(CartDatabase.data);
                      },
                      child: Container(
                        child: Padding(
                          padding: EdgeInsets.only(left: 40),
                          child: Icon(Icons.delete,color: Colors.red,),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
