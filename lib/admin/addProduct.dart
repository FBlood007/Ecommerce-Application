import 'dart:async';

import 'package:flutter/material.dart';

import '../firebaseConnection/productsDatabase.dart';
import 'allData.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String image = '';
  String name = '';
  String rating = '';
  String price = '';
  String desc = '';

  TextEditingController nameController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController ratingController = TextEditingController();

  added() {
    // User? user = auth.currentUser;

    MobileDatabase.insertData(
      nameController.text,
      priceController.text,
      imageController.text,
      descController.text,
      ratingController.text,

    ).then((value) {
      setState(() {});
    });
    Timer(
        Duration(seconds: 3),
            () =>
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => AllData())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Product'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const SizedBox(height: 10,),
                nameField(),
                const SizedBox(height: 10,),
                imageField(),
                const SizedBox(height: 10,),
                descField(),
                const SizedBox(height: 10,),
                priceField(),
                const SizedBox(height: 10,),
                ratingField(),
                const SizedBox(height: 10,),
                MaterialButton(
                  onPressed: () {
                    added();
                  },
                  color: Colors.blue,
                  child: Text('Add'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }


  Widget nameField() {
    return TextFormField(
      controller: nameController,
      decoration: InputDecoration(labelText: 'Name',
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide:const BorderSide(
            color: Colors.blue,
            width: 3,
          ),
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide:const BorderSide(
              color: Colors.black,
              width: 3,
            )
        ),),
      keyboardType: TextInputType.text,
      style: TextStyle(fontSize: 20),

    );
  }

  Widget imageField() {
    return TextFormField(
      controller: imageController,
      decoration: InputDecoration(labelText: 'Image Url',
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide:const BorderSide(
            color: Colors.blue,
            width: 3,
          ),
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide:const BorderSide(
              color: Colors.black,
              width: 3,
            )
        ),),
      keyboardType: TextInputType.text,
      style: TextStyle(fontSize: 20),

    );
  }

  Widget descField() {
    return TextFormField(
      controller: descController,
      decoration: InputDecoration(labelText: 'Description',
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide:const BorderSide(
            color: Colors.blue,
            width: 3,
          ),
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide:const BorderSide(
              color: Colors.black,
              width: 3,
            )
        ),),
      keyboardType: TextInputType.text,
      style: TextStyle(fontSize: 20),

    );
  }

  Widget priceField() {
    return TextFormField(
      controller: priceController,
      decoration: InputDecoration(labelText: 'Price',
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide:const BorderSide(
            color: Colors.blue,
            width: 3,
          ),
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide:const BorderSide(
              color: Colors.black,
              width: 3,
            )
        ),),
      keyboardType: TextInputType.text,
      style: TextStyle(fontSize: 20),

    );
  }

  Widget ratingField() {
    return TextFormField(
      controller: ratingController,
      decoration: InputDecoration(labelText: 'Rating(1 to 5)',
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide:const BorderSide(
            color: Colors.blue,
            width: 3,
          ),
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide:const BorderSide(
              color: Colors.black,
              width: 3,
            )
        ),),
      keyboardType: TextInputType.text,
      style: TextStyle(fontSize: 20),

    );
  }
}