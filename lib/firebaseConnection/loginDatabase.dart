import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DataBase {
  static List<Map> data = [];

  static Map user = {};

  String aaa = '';
  static CollectionReference fireStore =
      FirebaseFirestore.instance.collection('users');

  static Future insertData(String email, String pass, String fullName,String mobile,String city) async {
    User? user = FirebaseAuth.instance.currentUser;

    await FirebaseFirestore.instance.collection('users').doc(user?.uid).set({
      'email': email,
      'pass': pass,
      'role': 'user',
      'key': user?.uid,
      'fullName' : fullName,
      'mobile':mobile,
      'city':city,
    });
    selectData();
  }

  static Future updateDate(String email, String pass) async {
    fireStore.add({
      'email': email,
      'pass': pass,
    }).then((value) {
      selectData();
    });
  }
  static deleteData() {
    //print(';;;;;;;  $key');
    fireStore.doc().delete();
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
       user = element;
     }
   });
   return user['role'];
 }
}
