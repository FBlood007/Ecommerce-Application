import 'package:flutter/material.dart';

import '../../firebaseConnection/productsDatabase.dart';
import '../addProduct.dart';
import '../allData.dart';
import '../editPage.dart';

class CategoryData extends StatelessWidget {
  CategoryData({Key? key, this.name='',this.categ = ''}) : super(key: key);
  String name = '';
  String categ= '';

  GlobalKey<ScaffoldState> sKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: sKey,
        appBar: AppBar(
          title: Text(name),
          centerTitle: true,
          leading: GestureDetector(
              onTap: () {
                AllData.mobileData.clear();
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back)),
        ),
        body: Center(
          child: ListView.builder(
            padding: EdgeInsets.all(10),
            //itemCount: mobileData.length,
            itemCount: AllData.mobileData.length,
            itemBuilder: (context, index) => mobs(
              context,
              name: AllData.mobileData[index]['name'],
              image: AllData.mobileData[index]['image'],
              desc: AllData.mobileData[index]['desc'],
              rating: AllData.mobileData[index]['rating'],
              cost: AllData.mobileData[index]['price'],
              id: AllData.mobileData[index]['id'],
              category: AllData.mobileData[index]['category'],
            ),
          ),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(right: 150),
          child: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => AddProduct(category:categ)));
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
        ),
      ),
    );
  }
}

Widget mobs(
  context, {
  String name = '',
  String image = '',
  String rating = '',
  String desc = '',
  String cost = '',
  String id = '',
  String category = '',
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
              Text(
                desc,
                maxLines: 1,
                overflow: TextOverflow.fade,
                style: const TextStyle(
                  color: Colors.black54,
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
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductEdit(
                            image: image,
                            name: name,
                            price: cost,
                            desc: desc,
                            rating: rating,
                            id: id,
                            category: category,
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
                      MobileDatabase.deleteData(id);
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

