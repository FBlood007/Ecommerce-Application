import 'package:flutter/material.dart';

import '../firebaseConnection/productsDatabase.dart';
import '../productsTypes/userCateData.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);
  static List mobileData = [];
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Map> data1 = [
    {
      'image1':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRn6x7ujGTuXssD11_kXGpB3PELPDGM6lXDbQ&usqp=CAU',
    },
    {
      'image1':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRCyaoi54sDTV5sB3YXA2SaZXh-LY2uuJnIfns33iEXfuYhiQvMgxBvs_oez2ecS-HhhwM&usqp=CAU',
    },
    {
      'image1':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSkK8szvzzfJrQRNP0XcaOBauJ64GincKgDtQ&usqp=CAU',
    },
    {
      'image1':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQh1grQHAie4wBlSZoscV9XB9-oV0aiP4Mu9Q&usqp=CAU',
    },
    {
      'image1':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTF3Xp-ocTOJ8Plr-sSn091wCBlAHpwZU-3dw&usqp=CAU',
    },
    {
      'image1':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTbFErx5Uo9wtKF6l7d8nCtATlezzFysbhRgg&usqp=CAU',
    },
    {
      'image1':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQif6l5BqtomUfixB3JCeCapoldTigKyqYz2Q&usqp=CAU',
    },
    {
      'image1':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZXx7y4zbloNwvMN7B9lXmP139ixAwM_w0NQ&usqp=CAU',
    },
    {
      'image1':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR9wx50jcpKKqZ8fr6t5WV_vu-C_8c4Tlqjdw&usqp=CAU',
    },
  ];
  List<Map> products = [
    {
      'hName': 'Asus Gaming Laptops',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcReMnVf2-M1RttBf8wW0TUGiWhvOC2lrLdvHQ&usqp=CAU',
    },
    {
      'hName': '',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT6DXVCRWVxUIuXUkvjBH3N-5f4dOEdOz2BeA&usqp=CAU',
    },
    {
      'hName': 'iPhone',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQCNBSmp-95T44J0G5beAizCFHPgrPxX-43ww&usqp=CAU',
    },
    {
      'hName': 'Cashback',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQcas0hejF_7KgLLCaBiE8cKPACdjP6ngq5JA&usqp=CAU',
    },
    {
      'hName': 'Headphones',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTbV3hkkhAhlEMbSt17A4LxugMBc47ywLa_Ow&usqp=CAU',
    },
    {
      'hName': 'Asus Gaming Laptops',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcReMnVf2-M1RttBf8wW0TUGiWhvOC2lrLdvHQ&usqp=CAU',
    },
    {
      'hName': '',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT6DXVCRWVxUIuXUkvjBH3N-5f4dOEdOz2BeA&usqp=CAU',
    },
    {
      'hName': 'iPhone',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQCNBSmp-95T44J0G5beAizCFHPgrPxX-43ww&usqp=CAU',
    },
    {
      'hName': 'Cashback',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQcas0hejF_7KgLLCaBiE8cKPACdjP6ngq5JA&usqp=CAU',
    },
    {
      'hName': 'Headphones',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTbV3hkkhAhlEMbSt17A4LxugMBc47ywLa_Ow&usqp=CAU',
    },
  ];

  GlobalKey<ScaffoldState> sKey = GlobalKey<ScaffoldState>();
  addData(category) {

    setState(() {
      //AllData.mobileData.clear();
      MobileDatabase.data.forEach((element) {
        if (element.values.contains(category)) {
          Home.mobileData.add(element.cast());
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
              UserCategData(
                name: 'Mobiles',
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
              UserCategData(name: 'Books',)
          ),);
        }
      },
      {
        'image1': 'assets/toys.png',
        'item1': 'Toys',
        'onTap': () {
          addData('toys');
          Navigator.push(context, MaterialPageRoute(builder: (context) =>
              UserCategData(name: 'Toys',)
          ),);
        }
      },
      {
        'image1': 'assets/fruit.png',
        'item1': 'Fresh',
        'onTap': () {
          addData('fresh');
          Navigator.push(context, MaterialPageRoute(builder: (context) =>
              UserCategData(name: 'Fresh',)
          ),);
        }
      },
      {
        'image1': 'assets/fashion.png',
        'item1': 'Fashion',
        'onTap': () {
          addData('fashion');
          Navigator.push(context, MaterialPageRoute(builder: (context) =>
              UserCategData(name: 'Fashion',)
          ),);
        }
      },
      {
        'image1': 'assets/appliances.png',
        'item1': 'Appliances',
        'onTap': () {
          addData('appliances');
          Navigator.push(context, MaterialPageRoute(builder: (context) =>
              UserCategData(name: 'Appliances',)
          ),);
        }
      },
      {
        'image1': 'assets/essentials.png',
        'item1': 'Essentials',
        'onTap': () {
          addData('essentials');
          Navigator.push(context, MaterialPageRoute(builder: (context) =>
              UserCategData(name: 'Essentials',)
          ),);
        }
      },
      {
        'image1': 'assets/pharma.png',
        'item1': 'Pharmacy',
        'onTap': () {
          addData('pharmacy');
          Navigator.push(context, MaterialPageRoute(builder: (context) =>
              UserCategData(name: 'Pharmacy',)
          ),);
        }
      },
    ];
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Center(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.red,
                      ),
                      suffixIcon: const Icon(
                        Icons.sort,
                        color: Colors.red,
                      ),
                      hintText: 'Search for Products',
                      hintStyle: const TextStyle(
                        color: Colors.red,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: const BorderSide(
                          color: Colors.black54,
                          width: 2,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: const BorderSide(
                          color: Colors.black,
                          width: 3,
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          color: Colors.white,
                          height: 90,
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: data.length,
                            itemBuilder: (context, index) => items(
                              context,
                              image1: data[index]['image1'],
                              item1: data[index]['item1'],
                              onTap: data[index]['onTap'],
                            ),
                          ),
                        ),
                        Container(
                          width: 450,
                          child: Image.network(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTp9K_QIPXejmj83D67r4BljtveMQcHJFsAVw&usqp=CAU',
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        Container(
                          height: 160,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            //physics: NeverScrollableScrollPhysics(),
                            //padding: EdgeInsets.all(10),
                            itemCount: products.length,
                            itemBuilder: (context, index) => offers(
                              name: products[index]['hName'],
                              image: products[index]['image'],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 2.5),
                          child: Image.network(
                            'https://blog.hubspot.com/hubfs/limited-time-offer.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(
                                    top: 5, left: 15, bottom: 5),
                                child: Text(
                                  '70% Off | Limited Offer',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                              SizedBox(
                                height: 420,
                                child: GridView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: data1.length,
                                  padding:
                                      const EdgeInsets.only(top: 0, bottom: 10),
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                  ),
                                  itemBuilder: (context, index) => discounts(
                                    image: data1[index]['image1'],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5, bottom: 5),
                          child: Image.network(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSfzLV0JVw99U8VhsiYm1AWk_z7LAnuDyBqzA&usqp=CAU',
                            fit: BoxFit.fitWidth,
                            width: 410,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
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
                  height: 30,
                ),
                // backgroundColor: Colors.grey,
                foregroundColor: Colors.black,
                radius: 25,
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

Widget offers({
  String name = '',
  String image = '',
}) {
  return Padding(
    padding: const EdgeInsets.all(5.0),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border:
            Border.all(color: Colors.black, width: 0, style: BorderStyle.solid),
      ),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Image.network(
            image,
            height: 150,
          ),
          Text(
            name,
            style: const TextStyle(
              fontSize: 15,
              color: Colors.white,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget discounts({
  String image = '',
  String type = '',
}) {
  return Container(
    color: Colors.white70,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.network(
          image,
          height: 120,
          fit: BoxFit.fitHeight,
        ),
      ],
    ),
  );
}
