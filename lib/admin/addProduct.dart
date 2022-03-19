import 'dart:async';

import 'package:flutter/material.dart';

import '../firebaseConnection/productsDatabase.dart';
import 'allData.dart';

class AddProduct extends StatefulWidget {
   AddProduct( {Key? key , this.category = ''}) : super(key: key);
  String name = '';
   String image = '';

   String rating = '';
   String price = '';
   String desc = '';
   String category = '';
   String quantity = '';
   //String cartQty = '';
  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();



  TextEditingController nameController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController ratingController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController quantityController = TextEditingController();


  @override
  void initState() {
    super.initState();

    categoryController.text = widget.category;

  }

  added() {
    // User? user = auth.currentUser;

    MobileDatabase.insertData(
      nameController.text,
      priceController.text,
      imageController.text,
      descController.text,
      ratingController.text,
      categoryController.text,
      quantityController.text,


    ).then((value) {
      setState(() {});
    });
    Timer(
        const Duration(seconds: 3),
            () =>
                Navigator.push(context, MaterialPageRoute(builder: (context)=>
                AllData()))
            );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Product'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const SizedBox(height: 10,),
                productAddField(nameController,'Name',true),
                const SizedBox(height: 10,),
                productAddField(imageController,'Image Url',true),
                const SizedBox(height: 10,),
                productAddField(descController,'Description',true),
                const SizedBox(height: 10,),
                productAddField(categoryController,'Category',false),
                const SizedBox(height: 10,),
                productAddField(priceController,'Price',true),
                const SizedBox(height: 10,),
                productAddField(quantityController,'Quantity',true),
                const SizedBox(height: 10,),
                productAddField(ratingController,'Rating(1 to 5)',true),
                const SizedBox(height: 10,),
                MaterialButton(
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    setState(() {
                      added();
                      AllData.mobileData.clear();
                    });

                  },
                  color: Colors.blue,
                  child: const Text('Add'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget productAddField(controllerType,productDescriptionType,bool) {
    return TextFormField(
      enabled: bool,
      controller: controllerType,
      decoration: InputDecoration(labelText: productDescriptionType,
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
      style:const TextStyle(fontSize: 20),

    );
  }

}