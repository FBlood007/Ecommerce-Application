import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutterfinalproject/firebaseConnection/productsDatabase.dart';

import 'addProduct.dart';
import 'allData.dart';

class ProductEdit extends StatefulWidget {
  ProductEdit(
      {Key? key,
      this.image = '',
      this.name = '',
      this.price = '',
      this.rating = '',
      this.desc = '',
      this.category = '',
      this.id = ''})
      : super(key: key);

  String image = '';
  String name = '';
  String rating = '';
  String price = '';
  String desc = '';
  String category = '';
  String id = '';

  @override
  State<ProductEdit> createState() => _ProductEditState();
}

class _ProductEditState extends State<ProductEdit> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();

  TextEditingController imageController = TextEditingController();

  TextEditingController descController = TextEditingController();

  TextEditingController priceController = TextEditingController();

  TextEditingController ratingController = TextEditingController();

  TextEditingController categoryController = TextEditingController();

  TextEditingController idController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.text = widget.name;
    imageController.text = widget.image;
    descController.text = widget.desc;
    priceController.text = widget.price;
    categoryController.text = widget.category;
    ratingController.text = widget.rating;
    idController.text = widget.id;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text('Update Product'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                itemDataInput(nameController,'Name'),
                const SizedBox(height: 10,),
                itemDataInput(imageController,'Image Url'),
                const SizedBox(height: 10,),
                itemDataInput(descController,'Description'),
                const SizedBox(height: 10,),
                itemDataInput(priceController,'Price'),
                const SizedBox(height: 10,),
                itemDataInput(categoryController,'Category'),
                const SizedBox(height: 10,),
                itemDataInput(ratingController,'Rating(1 to 5)'),
                //idField(),
                MaterialButton(
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    MobileDatabase.updateDate(
                            name: nameController.text,
                            price: priceController.text,
                            image: imageController.text,
                            desc: descController.text,
                            category: categoryController.text,
                            rating: ratingController.text,
                            id: idController.text)
                        .then((value) {
                      setState(() {});
                    });
                    Timer(
                        Duration(seconds: 3),
                        () => Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                                builder: (BuildContext context) => AllData())));
                  },
                  color: Colors.blue,
                  child: Text('Update'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget itemDataInput(controllerType,type){
    return TextFormField(
      controller: controllerType,
      decoration: InputDecoration(
        labelText: type,
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
        ),
      ),
      keyboardType: TextInputType.text,
      style: TextStyle(fontSize: 20),
    );
  }
}
