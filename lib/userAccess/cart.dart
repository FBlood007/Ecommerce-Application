import 'package:flutter/material.dart';

class Cart extends StatelessWidget {
  Cart({this.image = '', this.hName = '', this.price = '', Key? key})
      : super(key: key);
  String hName = '';
  String image = '';
  String price = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text('CART',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                const SizedBox(
                  height: 10,
                ),
               hName!='' ? Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        image ,
                        height: 100,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(hName,
                              maxLines: 2,
                              overflow: TextOverflow.visible,
                              style: TextStyle(fontSize: 20),
                            ),
                            const Text(
                              'data...........',
                            ),
                            Text(price,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ) : Container(
                 child: const Center(
                   child: Padding(
                     padding: const EdgeInsets.only(top:100.0),
                     child: Text('No Product in cart',style: TextStyle(fontSize: 30),),
                   ),
                 ),
               ),


              ],
            ),
          ),
        ),
      ),
    );
  }}

// Widget cart() {
//   return Container(
//     padding: EdgeInsets.all(10),
//     decoration: BoxDecoration(
//       border: Border.all(
//         width: 1,
//       ),
//       borderRadius: BorderRadius.circular(10.0),
//     ),
//     child: Row(
//       children: [
//         Container(
//             child: Image.network(
//           'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRn6x7ujGTuXssD11_kXGpB3PELPDGM6lXDbQ&usqp=CAU',
//           width: 100,
//         )),
//         SizedBox(
//           width: 10,
//         ),
//         Container(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: const [
//               Text(
//                 'Name..........',
//               ),
//               Text(
//                 'data...........',
//               ),
//               Text(
//                 'Mrp............',
//               ),
//             ],
//           ),
//         ),
//       ],
//     ),
//   );
// }
