import 'package:flutter/material.dart';

import '../homeScreen/homeScreen.dart';
import '../userAccess/cart.dart';


class Books extends StatelessWidget {
  Books({Key? key}) : super(key: key);
  List<Map> books = [
    {
      'hName' : 'World’s Greatest Classicsaaaaaaaaa',
      'image' : 'https://m.media-amazon.com/images/I/81j8i9slKIL._AC_UY327_FMwebp_QL65_.jpg',
      'auth' : 'Jane Austen F. Scott Fitzgerald',
      'rating': 4,
      'price': '₹389.00',
    },
    {
      'hName' : 'Memory: How To Develop',
      'image' : 'https://m.media-amazon.com/images/I/71Kb2dJCxWL._AC_UY327_FMwebp_QL65_.jpg',
      'auth' : 'William Walker Atkinson ',
      'rating': 4,
      'price': '₹99.00',
    },
    {
      'hName' : 'The Power of Your',
      'image' : 'https://m.media-amazon.com/images/I/71UwSHSZRnS._AC_UY327_FMwebp_QL65_.jpg',
      'auth' : 'Subconscious Mind',
      'rating': 4,
      'price': '₹95.00',
    },
    {
      'hName' : 'Arthashastra',
      'image' : 'https://m.media-amazon.com/images/I/917wUuyIaHL._AC_UY327_FMwebp_QL65_.jpg',
      'auth' : 'Kautilya',
      'rating': 4,
      'price': '₹219.00',
    },
    {
      'hName' : 'A Passage To India',
      'image' : 'https://m.media-amazon.com/images/I/919bQ4DIh1S._AC_UY327_FMwebp_QL65_.jpg',
      'auth' : 'E. M. Forster ',
      'rating': 4,
      'price': '₹135.00',
    },
    {
      'hName' : 'World’s Greatest Classics',
      'image' : 'https://m.media-amazon.com/images/I/81j8i9slKIL._AC_UY327_FMwebp_QL65_.jpg',
      'auth' : 'Jane Austen F. Scott Fitzgerald',
      'rating': 4,
      'price': '₹389.00',
    },
    {
      'hName' : 'Memory: How To Develop',
      'image' : 'https://m.media-amazon.com/images/I/71Kb2dJCxWL._AC_UY327_FMwebp_QL65_.jpg',
      'auth' : 'William Walker Atkinson ',
      'rating': 4,
      'price': '₹99.00',
    },
    {
      'hName' : 'The Power of Your',
      'image' : 'https://m.media-amazon.com/images/I/71UwSHSZRnS._AC_UY327_FMwebp_QL65_.jpg',
      'auth' : 'Subconscious Mind',
      'rating': 4,
      'price': '₹95.00',
    },
    {
      'hName' : 'Arthashastra',
      'image' : 'https://m.media-amazon.com/images/I/917wUuyIaHL._AC_UY327_FMwebp_QL65_.jpg',
      'auth' : 'Kautilya',
      'rating': 4,
      'price': '₹219.00',
    },
    {
      'hName' : 'A Passage To India',
      'image' : 'https://m.media-amazon.com/images/I/919bQ4DIh1S._AC_UY327_FMwebp_QL65_.jpg',
      'auth' : 'E. M. Forster ',
      'rating': 4,
      'price': '₹135.00',
    },

  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Books'),
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
            itemCount: books.length,
            itemBuilder: (context, index) => mobs(
              context,
              name:books[index]['hName'],
              image: books[index]['image'],
              auth: books[index]['auth'],
              rating: books[index]['rating'],
              cost : books[index]['price'],
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
  int rating = 1,
  String auth = '',
  String cost = '',
}){
  return Container(
    padding: EdgeInsets.all(5),

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
            height: 110,
            child: Image.network(image,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Container(
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
                  Row(
                    children: [
                      for(int i=0;i<rating;i++)
                        const Icon(Icons.star,
                          size: 15,color: Colors.red,),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}