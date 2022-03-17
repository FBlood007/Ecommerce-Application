import 'package:flutter/material.dart';

import 'addProduct.dart';

class ProductEdit extends StatefulWidget {
  ProductEdit(
      {Key? key,
      this.image = '',
      this.name = '',
      this.price = '',
      this.rating = '',
      this.desc = ''})
      : super(key: key);

  String image = '';
  String name = '';
  String rating = '';
  String price = '';
  String desc = '';

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

  @override
  void initState() {
    super.initState();
    nameController.text = widget.name;
    imageController.text = widget.image;
    descController.text = widget.desc;
    priceController.text = widget.price;
    ratingController.text = widget.rating;

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
          child: Column(
            children: [
              nameField(),
              imageField(),
              descField(),
              priceField(),
              ratingField(),
              MaterialButton(
                onPressed: () {},
                color: Colors.blue,
                child: Text('Update'),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget nameField() {
    return TextFormField(
      controller: nameController,
      decoration: InputDecoration(labelText: 'Name'),
      keyboardType: TextInputType.text,
      style: TextStyle(fontSize: 20),
    );
  }

  Widget imageField() {
    return TextFormField(
      controller: imageController,
      decoration: InputDecoration(labelText: 'Image Url'),
      keyboardType: TextInputType.text,
      style: TextStyle(fontSize: 20),
    );
  }

  Widget descField() {
    return TextFormField(
      controller: descController,
      decoration: InputDecoration(labelText: 'Description'),
      keyboardType: TextInputType.text,
      style: TextStyle(fontSize: 20),
    );
  }

  Widget priceField() {
    return TextFormField(
      controller: priceController,
      decoration: InputDecoration(labelText: 'Price'),
      keyboardType: TextInputType.text,
      style: TextStyle(fontSize: 20),
    );
  }

  Widget ratingField() {
    return TextFormField(
      controller: ratingController,
      decoration: InputDecoration(labelText: 'Rating(1 t0 5)'),
      keyboardType: TextInputType.text,
      style: TextStyle(fontSize: 20),
    );
  }
}
