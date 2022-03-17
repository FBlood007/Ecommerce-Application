import 'package:flutter/material.dart';

import '../firebaseConnection/productsDatabase.dart';
import '../homeScreen/homeScreen.dart';
import '../userAccess/cart.dart';


class Mobiles extends StatelessWidget {
  Mobiles({Key? key}) : super(key: key);
  List<Map> mobileData = [

    {
      'hName' : 'Vivo V23e 5G',
      'image' : 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSRWT_rxG1ONLiof7mgsNw25bgy-EQC4HfyWA&usqp=CAU',
      'description' : '(Blue Void, 8GB RAM, 128GB Storage)',
      'rating': 5,
      'price': '₹25,999.00',
    },

    {
      'hName' : 'OPPO A93 8GB RAM',
      'image' : 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRSOL6Eq5L09BuFfqHFdJNMz-SHVVLD_TB8jQ&usqp=CAU',
      'description' : '(Metallic White, 128GB Storage)',
      'rating': 4,
      'price': '₹24,999.00',
    },

  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Mobiles'),
          centerTitle: true,
          leading: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
              child: const Icon(Icons.keyboard_backspace)),
        ),
        body: Center(
          child: ListView.builder(
            padding: EdgeInsets.all(10),
            //itemCount: mobileData.length,
            itemCount: MobileDatabase.data.length,
            itemBuilder: (context, index) => mobs(
              context,
              name:MobileDatabase.data[index]['name'],
              image: MobileDatabase.data[index]['image'],
              products: MobileDatabase.data[index]['desc'],
              rating: MobileDatabase.data[index]['rating'],
              cost : MobileDatabase.data[index]['price'],
            ),
          ),
        ),
      ),
    );
  }
}
Widget mobs(context,{
  String name = '',
  String image = '',
  String rating = '',
  String products = '',
  String cost = '',
}){
  return Container(
    padding: EdgeInsets.all(5),
    height: 110,
    child: GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Cart(
              image: image,
              hName: name,
              price: cost,
            ),
          ),
        );
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(),
            child: Image.network(image,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,
                  style:const TextStyle(
                    fontSize: 20,
                  ),
                ),
                Row(
                  children: [
                    for(int i=0;i<int.parse(rating);i++)
                      const Icon(Icons.star,
                        size: 15,color: Colors.red,),
                  ],
                ),
                Text(products,
                  maxLines: 1,
                  overflow: TextOverflow.fade,
                  style:const TextStyle(
                    color: Colors.black54,
                  ),
                ),
                Text(cost,
                  style:const TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height:5,),
                Text('Add to Cart',style: TextStyle(color: Colors.red),),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}