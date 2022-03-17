import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MobileDatabase {
  static List<Map> data = [];

  static Map mobs = {};

  static CollectionReference fireStore =
  FirebaseFirestore.instance.collection('mobiles');

  static Future insertData(String name, String price,String image,String desc,String rating) async {

    String key = DateTime.now().toString();

    await FirebaseFirestore.instance.collection('mobiles').doc(key).set({
      'name': name,
      'price': price,
      'key': key,
      'image':image,
      'desc':desc,
      'rating':rating,
    });
    selectData();
  }

  static Future updateDate(String name, String price,String image,String desc) async {
    fireStore.add({
      'name': name,
      'price': price,
      'image':image,
      'desc':desc,
    }).then((value) {
      selectData();
    });
  }

  static deleteData(String key) {
    //print(';;;;;;;  $key');
    fireStore.doc(key).delete();
  }

  static Future selectData() async {
    fireStore.get().then((value) {
      data.clear();
      value.docs.forEach((element) {
        data.add(element.data() as Map);
      });
    });
  }

  static Future<String> selectedUser(String email)async {
    data.forEach((element) {
      if(element['email'] == email){
        mobs = element;
      }
    });
    return mobs['role'];
  }
}