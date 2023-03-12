// // import 'dart:html';
// //
//
// import 'dart:io';
//
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:firebase_storage/firebase_storage.dart';
// // import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:healthplus/NearByLab/adddetails.dart';
// import 'package:image_picker/image_picker.dart';
//
// import '../home/icon_but_with_cnt.dart';
//
// class Donatereport extends StatefulWidget {
//
//   const Donatereport({Key? key}) : super(key: key);
//
//   @override
//   State<Donatereport> createState() => _PublisgScreenState();
// }
//
// class _PublisgScreenState extends State<Donatereport> {
//   String imageUrl = '';
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.teal,
//         title: Text("Donate report"),
//       ),
//       body: Container(
//         //margin: const EdgeInsets.all(10),
//
//         padding: const EdgeInsets.all(10),
//         //height: 200,
//         // color: Colors.amberAccent,
//         height: MediaQuery.of(context).size.height *1/6,
//         width: MediaQuery.of(context).size.width* double.infinity,
//         decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),border: Border.all(width: 2, color: Colors.teal),color: Colors.teal[50]),
//
//
//         child: Center(
//
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Center(
//                 child: Text(
//                   "We are requesting for your report,"
//                       "please upload the report for our testing model ."
//                       "Your contribution is always valuable for us",
//                   style: TextStyle(color: Colors.teal,fontSize: 20),),
//               ),
//             ],
//           ),
//         ),
//       ),
//       // body: Container(
//       //   child: StreamBuilder(
//       //     stream: FirebaseFirestore.instance.collection('laboratory').snapshots(),
//       //     builder: (context,AsyncSnapshot<QuerySnapshot> snapshot){
//       //
//       //       if(snapshot.hasData){
//       //         return ListView.builder(
//       //             itemCount: snapshot.data!.docs.length,
//       //             itemBuilder: (context,index){
//       //               var data=snapshot.data!.docs[index].data() as Map<String,dynamic>;
//       //               return Padding(
//       //                 padding: const EdgeInsets.all(10.0),
//       //                 child: SingleChildScrollView(
//       //                   child: Container(
//       //                     //margin: const EdgeInsets.all(10),
//       //                     padding: const EdgeInsets.all(10),
//       //                     //height: 200,
//       //                     // color: Colors.amberAccent,
//       //                     height: MediaQuery.of(context).size.height *1/6,
//       //                     width: MediaQuery.of(context).size.height *1/3,
//       //                     decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),border: Border.all(width: 2, color: Colors.teal),color: Colors.teal[50]),
//       //
//       //
//       //                     child: SingleChildScrollView(
//       //                       child: Padding(
//       //                         padding: const EdgeInsets.only(left: 5,top: 8.0),
//       //                         child: Column(
//       //                           //mainAxisAlignment: MainAxisAlignment.center,
//       //
//       //                           crossAxisAlignment: CrossAxisAlignment.start,
//       //                           children: [
//       //                             Text(
//       //                               "Laboratory Name :"+snapshot.data?.docs[index]['labname'],
//       //                               style: TextStyle(color: Colors.teal,fontSize: 15),),
//       //                             const SizedBox(
//       //                               height: 5,
//       //                             ),
//       //
//       //                             Text(
//       //                               "Owner's Name :"+snapshot.data?.docs[index]['ownername'],
//       //                               style: TextStyle(color: Colors.teal,fontSize: 15),
//       //                             ),
//       //                             // const SizedBox(
//       //                             //   height: 5,
//       //                             // ),
//       //                             // Text(
//       //                             //   "Location :"+snapshot.data?.docs[index]['location'],
//       //                             //   style: TextStyle(color: Colors.deepOrangeAccent,fontSize: 15),
//       //                             // ),
//       //                             const SizedBox(
//       //                               height: 5,
//       //                             ),
//       //                             Text(
//       //                               "Contact no :"+snapshot.data?.docs[index]['mobileno'],
//       //                               style: TextStyle(color: Colors.teal,fontSize: 15),
//       //                             ),
//       //                             const SizedBox(
//       //                               height: 5,
//       //                             ),
//       //                           ],
//       //                         ),
//       //                       ),
//       //                     ),
//       //                   ),
//       //                 ),
//       //               );
//       //               return Container();
//       //             }
//       //
//       //         );
//       //
//       //       }
//       //       return Container();
//       //
//       //     },
//       //   ),
//       // ),
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: Colors.teal,
//         // onPressed:(){
//         //   // Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=> AddItem()));
//         //
//         // },
//         onPressed: () async {
//           /*
//                 * Step 1. Pick/Capture an image   (image_picker)
//                 * Step 2. Upload the image to Firebase storage
//                 * Step 3. Get the URL of the uploaded image
//                 * Step 4. Store the image URL inside the corresponding
//                 *         document of the database.
//                 * Step 5. Display the image on the list
//                 *
//                 * */
//
//           /*Step 1:Pick image*/
//           //Install image_picker
//           //Import the corresponding library
//
//           ImagePicker imagePicker = ImagePicker();
//           XFile? file =
//           await imagePicker.pickImage(source: ImageSource.gallery);
//           print('${file?.path}');
//
//           if (file == null) return;
//           //Import dart:core
//           String uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();
//
//           /*Step 2: Upload to Firebase storage*/
//           //Install firebase_storage
//           //Import the library
//
//           //Get a reference to storage root
//           Reference referenceRoot = FirebaseStorage.instance.ref();
//           Reference referenceDirImages = referenceRoot.child('DonateReports');
//
//
//           //Create a reference for the image to be stored
//           Reference referenceImageToUpload = referenceDirImages.child(uniqueFileName);
//           //Reference referenceImageToUpload = referenceRoot.child();
//
//           //Handle errors/success
//           try {
//             //Store the file
//             await referenceImageToUpload.putFile(File(file!.path));
//             //Success: get the download URL
//             imageUrl = await referenceImageToUpload.getDownloadURL();
//           } catch (error) {
//             //Some error occurred
//           }
//           Fluttertoast.showToast(msg: "Thankyou for your contribution.");
//         },
//         tooltip: 'Increment',
//         child:  Icon(Icons.add),
//       ),
//     );
//   }
// }
//
//
//
//
//
// class AddItem extends StatefulWidget {
//   const AddItem({Key? key}) : super(key: key);
//
//   @override
//   State<AddItem> createState() => _AddItemState();
// }
//
// class _AddItemState extends State<AddItem> {
//   TextEditingController _controllerName = TextEditingController();
//   TextEditingController _controllerQuantity = TextEditingController();
//
//   GlobalKey<FormState> key = GlobalKey();
//
//   CollectionReference _reference =
//   FirebaseFirestore.instance.collection('DonateReports');
//
//   String imageUrl = '';
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Form(
//         key: key,
//         child: Column(
//           children: [
//             IconButton(
//                 onPressed: () async {
//                   /*
//                 * Step 1. Pick/Capture an image   (image_picker)
//                 * Step 2. Upload the image to Firebase storage
//                 * Step 3. Get the URL of the uploaded image
//                 * Step 4. Store the image URL inside the corresponding
//                 *         document of the database.
//                 * Step 5. Display the image on the list
//                 *
//                 * */
//
//                   /*Step 1:Pick image*/
//                   //Install image_picker
//                   //Import the corresponding library
//
//                   ImagePicker imagePicker = ImagePicker();
//                   XFile? file =
//                   await imagePicker.pickImage(source: ImageSource.camera);
//                   print('${file?.path}');
//
//                   if (file == null) return;
//                   //Import dart:core
//                   String uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();
//
//                   /*Step 2: Upload to Firebase storage*/
//                   //Install firebase_storage
//                   //Import the library
//
//                   //Get a reference to storage root
//                   Reference referenceRoot = FirebaseStorage.instance.ref();
//                   Reference referenceDirImages = referenceRoot.child('DonateReports');
//
//
//                   //Create a reference for the image to be stored
//                   Reference referenceImageToUpload = referenceDirImages.child(uniqueFileName);
//                  //Reference referenceImageToUpload = referenceRoot.child();
//
//                   //Handle errors/success
//                   try {
//                     //Store the file
//                     await referenceImageToUpload.putFile(File(file!.path));
//                     //Success: get the download URL
//                     imageUrl = await referenceImageToUpload.getDownloadURL();
//                   } catch (error) {
//                     //Some error occurred
//                   }
//                 },
//                 icon: Icon(Icons.camera_alt)),
//             ElevatedButton(
//                 onPressed: () async {
//                   if (imageUrl.isEmpty) {
//                     ScaffoldMessenger.of(context)
//                         .showSnackBar(SnackBar(content: Text('Please upload an image')));
//
//                     return;
//                   }
//
//                   if (key.currentState!.validate()) {
//                     String itemName = _controllerName.text;
//                     String itemQuantity = _controllerQuantity.text;
//
//                     //Create a Map of data
//                     Map<String, String> dataToSend = {
//                       'name': itemName,
//                       'quantity': itemQuantity,
//                       'image': imageUrl,
//                     };
//
//                     //Add a new item
//                     _reference.add(dataToSend);
//                   }
//                 },
//                 child: Text('Submit'))
//           ],
//         ),
//       ),
//     );
//   }
// }
