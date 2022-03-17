import 'package:flutter/material.dart';

import '../homeScreen/homeScreen.dart';


class Toys extends StatelessWidget {
  Toys({Key? key}) : super(key: key);
  List<Map> toys = [
    {
      'hName' : 'Minnie Mouse',
      'image' : 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ9new7MWdTYGouehJ-NxOGPn8_ZzUBEiKqww&usqp=CAU',
      'auth' : 'Floppy Big Head Soft Toy',
      'price': '₹1,399',
    },
    {
      'hName' : 'Mee Mee Baby Tricycle',
      'image' : 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQz2vLL71C_zAhF8WCVrzvsNjlo7To0uzP7xMJ80sPaaNoxXqMQyKCgAwhr_WKtdGpK4k8&usqp=CAU',
      'auth' : 'Rocking Function 2 in 1',
      'price': '₹3999.00',
    },
    {
      'hName' : 'Plug & Play Tricycle',
      'image' : 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSCcHPfrGJ9Zrdr3B77ubZUhqNjwNgal-CCOg&usqp=CAU',
      'auth' : ' Seat Cover - Yellow',
      'price': '₹2472.25',
    },
    {
      'hName' : 'Ultimate Learning Bot',
      'image' : 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS5SO75Xgu10G7Rnna0GwXKJv0t5ziqOyXD7g&usqp=CAU',
      'auth' : 'Electronic Activity Toy with Lights',
      'price': '₹2100.00',
    },
    {
      'hName' : 'Bhoomi Dancing Robot',
      'image' : 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrXonc1R5I2QBsLO0KIfbT_DmR7skY_04lPg&usqp=CAU',
      'auth' : 'D Flashing Lights',
      'price': '₹699.00',
    },
    {
      'hName' : 'Pretend Play Sweet Shop',
      'image' : 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQB_5oJBYxVVBMWow5uMOlZqsp1Xq4op6W_yw&usqp=CAU',
      'auth' : 'Toy Pink - 39 Pieces',
      'price': '₹932.40',
    },
    {
      'hName' : 'Fashion Beauty Set',
      'image' : 'https://cdn.fcglcdn.com/brainbees/images/products/438x531/2702867a.webp',
      'auth' : '21 Pieces - Pink',
      'price': '₹720.25',
    },
    {
      'hName' : 'Minnie Mouse',
      'image' : 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ9new7MWdTYGouehJ-NxOGPn8_ZzUBEiKqww&usqp=CAU',
      'auth' : 'Floppy Big Head Soft Toy',
      'price': '₹1,399',
    },
    {
      'hName' : 'Mee Mee Baby Tricycle',
      'image' : 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQz2vLL71C_zAhF8WCVrzvsNjlo7To0uzP7xMJ80sPaaNoxXqMQyKCgAwhr_WKtdGpK4k8&usqp=CAU',
      'auth' : 'Rocking Function 2 in 1',
      'price': '₹3999.00',
    },
    {
      'hName' : 'Plug & Play Tricycle',
      'image' : 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSCcHPfrGJ9Zrdr3B77ubZUhqNjwNgal-CCOg&usqp=CAU',
      'auth' : ' Seat Cover - Yellow',
      'price': '₹2472.25',
    },
    {
      'hName' : 'Ultimate Learning Bot',
      'image' : 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS5SO75Xgu10G7Rnna0GwXKJv0t5ziqOyXD7g&usqp=CAU',
      'auth' : 'Electronic Activity Toy with Lights',
      'price': '₹2100.00',
    },
    {
      'hName' : 'Bhoomi Dancing Robot',
      'image' : 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrXonc1R5I2QBsLO0KIfbT_DmR7skY_04lPg&usqp=CAU',
      'auth' : 'D Flashing Lights',
      'price': '₹699.00',
    },
    {
      'hName' : 'Pretend Play Sweet Shop',
      'image' : 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQB_5oJBYxVVBMWow5uMOlZqsp1Xq4op6W_yw&usqp=CAU',
      'auth' : 'Toy Pink - 39 Pieces',
      'price': '₹932.40',
    },
    {
      'hName' : 'Fashion Beauty Set',
      'image' : 'https://cdn.fcglcdn.com/brainbees/images/products/438x531/2702867a.webp',
      'auth' : '21 Pieces - Pink',
      'price': '₹720.25',
    },

  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Toys'),
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
            itemCount: toys.length,
            itemBuilder: (context, index) => mobs(
              name:toys[index]['hName'],
              image: toys[index]['image'],
              auth: toys[index]['auth'],
              cost : toys[index]['price'],
            ),
          ),
        ),
      ),
    );
  }
}
Widget mobs({
  String name = '',
  String image = '',
  String auth = '',
  String cost = '',
}){
  return Container(
    padding: EdgeInsets.all(5),
    height: 110,
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
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style:const TextStyle(
                  fontSize: 20,
                ),
              ),
              Text(auth,
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

            ],
          ),
        ),
      ],
    ),
  );
}
