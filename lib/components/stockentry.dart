import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:uuid/uuid.dart';

import '../../../components/custom_surfix_icon.dart';


import 'package:uuid/uuid.dart';

import '../home/components/add_date.dart';
import '../home/homescreen.dart';






class StockEntry extends StatefulWidget {
  var txt="select location Press icon";
  static String routeName = "/addproduct";

  //SalesEntry( {Key? key,required this.txt}) : super(key: key);

  @override
  _StockEntryState createState() => _StockEntryState();
}

class _StockEntryState extends State<StockEntry> {

  final controllerName=TextEditingController();
  final controllerProduct=TextEditingController();
  final controllerQuantity=TextEditingController();
  final controllerMobileNo=TextEditingController();
  final controllerLocation=TextEditingController();
  final controllerDealDate=TextEditingController();
  DateTime startBidingDate= new DateTime.now();
  DateTime endBidingDate = new DateTime.now();
  TimeOfDay startTime = new TimeOfDay.now();
  TimeOfDay endTime = new TimeOfDay.now();











  final box = Hive.box<Add_data>('data');
  DateTime date = new DateTime.now();
  String? selctedItem;
  String? selctedItemi;

  final TextEditingController expalin_C = TextEditingController();
  FocusNode ex = FocusNode();
  final TextEditingController amount_c = TextEditingController();
  FocusNode amount_ = FocusNode();
  final List<String> _item = [
    "Apple", "Banana", "Grapes", "Orange", "Cotton", "Brinjal", "Wheat", "Corn", "Lady_Finger","Gram", "Peanut", "Soyabin",
    "Cabbage", "Marigold", "Mogara", "Onion", "Garlic", "Carrot", "Tomato", "Raddish","Sapodila","Sugarcan","Patato","Ginger",
    "Mustard", "Coriander", "Caulflower", "Shepu", "Fenugreek", "Ambadi", "BitterGaurd", "DrumStick", "Chawali",
    "Masoor", "Moong", "Mataki", "Pea", "Ailanthus", "Allspice", "Almond", "Alovera", "Antherium","Arecanut",
    "AshGourd", "Ashwagandha", "Beans", "Beatroot", "BengalGram", "Ber", "Betelvine", "Bajra", "Brocali", "BlackGram",
    "BottleGourd",  "Capsicum", "Mango", "Cardamom", "CashewNut", "Champak", "Chive", "Cinnamon",
    "CitronellaGrass", "Colve", "Cocoa", "Coconut", "Coffee", "Coleus", "Cowpea", "Cucumber", "Cumin",
    "CurryLeaves", "Rose", "Daylily", "Dill", "DragonFruit", "Fig", "FoxTailMillet", "FrenchBean",
    "Guava", "Jackfruit", "Jasmine", "Lemon", "Mint", "PearlMillet", "Pomegranate","Pumpkin", "Rice", "Rubber",
    "Sunflower", "Strawbery", "Tamarind","Tea", "Termeric", "Watermelon", "Vanila", "Walnut"


  ];
  // List<PlacesSearchResult> searchResults = [];
  // late PlacesAutocompleteResponse autocompleteResponse;
  // late GoogleMapController mapController;
  String apiKey="AIzaSyA0YP0uj7CM8wISZLQ3z-BluBG-f30PnBo";


  final List<String> _itemei = [
    'Income',
    "Expand",
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ex.addListener(() {
      setState(() {});
    });
    amount_.addListener(() {
      setState(() {});
    });
    controllerLocation.addListener(() {
      if (controllerLocation.text.isEmpty) {
        setState(() {
          // searchResults = [];
        });
        return;
      }

      // getAutocomplete();
    });

  }


  // Future<void> getAutocomplete() async {
  //   final places = new GoogleMapsPlaces(apiKey: "YOUR_API_KEY");
  //   PlacesAutocompleteResponse response = await places.autocomplete(
  //     controllerLocation.text,
  //     types: ['(cities)'],
  //   );
  //   if (response.isOkay) {
  //     setState(() {
  //       autocompleteResponse = response;
  //       // searchResults = response.result;
  //     });
  //   } else {
  //     print('Error: ${response.errorMessage}');
  //   }
  // }



  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      body:SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            background_container(context),
            Positioned(
              top: 120,
              left: 0,
              right: 0,
              bottom: 0,
              child: SingleChildScrollView(child: main_container()),
            ),
          ],
        ),
      ),
    );
  }
  Container main_container() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      height: 1000,
      width: 340,
      child: Column(

        children: [
          SizedBox(height: 30),
          Container(
              height: 70,
              width: 350,
              child: Name()
          ),// for name
          // SizedBox(height: 20),
          // Container(
          //   height: 60,
          //   width: 340,
          //   child: Product(),
          // ),// for select the product
          SizedBox(height: 20),
          Container(
            height: 70,
            width: 350,
            child: Quantity(),
          ),// for quantity of product
          SizedBox(height: 20),
          // Container(
          //   height: 70,
          //   width: 350,
          //   child: Location(),
          // ),// for location of farmer
          // finalloc(),
          // SizedBox(height: 10),
          // Container(
          //   height: 50,
          //   width: 310,
          //   child: date_time(),
          // ),
          SizedBox(height: 10),
          Container(
            height: 50,
            width: 310,
            child: start_date(),
          ),
          SizedBox(height: 20),
          // Container(
          //   height: 50,
          //   width: 310,
          //   child: startBidingTime(),
          // ),
          // SizedBox(height: 30),
          // Container(
          //   height: 50,
          //   width: 310,
          //   child: end_date(),
          // ),
          // SizedBox(height: 30),
          // Container(
          //   height: 50,
          //   width: 310,
          //   child: endBidingTime(),
          // ),
          SizedBox(height: 30),
          Container(
            height: 70,
            width: 347,
            child: TakeMobileNo(),
          ),// Take mobile No input
          Spacer(),
          save(),
          SizedBox(height: 25),

        ],
      ),
    );
  }

  GestureDetector save() {
    return GestureDetector(
      onTap: () {
        {
          Navigator.pop(context);
          Fluttertoast.showToast(msg: "Stock Added");
        }
        // final products=Products(
        //   name:controllerName.text,
        //   //product: selctedItem!,
        //   Quantity: controllerQuantity.text,
        //   mobileno: controllerMobileNo.text,
        //   startBidingDate: startBidingDate,
        //   endBidingDate: endBidingDate,
        //   startTime: startTime,
        //   endTime: endTime,
        //   //location: widget.txt,
        //
        //
        //
        //
        //   dealDate:date,
        //
        //
        //
        //
        // );
        // createProduct(products);


        //   var add = Add_data(
        //       selctedItemi!, amount_c.text, date, expalin_C.text, selctedItem!);
        //   box.add(add);
        //   //final products=Products()
        //   //Navigator.of(context).pop();
        //
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.deepOrangeAccent,
        ),
        width: 120,
        height: 50,
        child: Text(
          'Save',

          style: TextStyle(
            fontFamily: 'f',
            fontWeight: FontWeight.w600,
            color: Colors.white,
            fontSize: 17,
          ),
        ),
      ),
    );
  }


  // ElevatedButton save(){
  //   return ElevatedButton(
  //       onPressed:(){
  //         final products=Products(
  //           name:controllerName.text,
  //           //product: selctedItem != null?.text
  //           Quantity: int.parse(controllerQuantity.text),
  //           mobileno: int.parse(controllerMobileNo.text),
  //           //location:
  //           //dealDate:
  //
  //
  //
  //
  //         );
  //         createProduct(products);
  //         Navigator.pop(context);
  //
  //       },
  //       child:Text('Save')
  //   );
  // }

  // Widget date_time() {
  //   return Container(
  //     alignment: Alignment.bottomLeft,
  //     decoration: BoxDecoration(
  //
  //         borderRadius: BorderRadius.circular(10),
  //         border: Border.all(width: 2, color: Color(0xffC5C5C5))),
  //     width: 300,
  //     child: TextButton(
  //       onPressed: () async {
  //         DateTime? newDate = await showDatePicker(
  //
  //             context: context,
  //             initialDate: date,
  //             firstDate: DateTime(2020),
  //             lastDate: DateTime(2100));
  //         if (newDate == Null) return;
  //         setState(() {
  //           date = newDate!;
  //         });
  //       },
  //       child: Text(
  //         'Approximate deal date :  ${date.day}/${date.month}/${date.year}',
  //         style: TextStyle(
  //           fontSize: 15,
  //           color: Colors.black,
  //         ),   ),
  //     ),
  //   );
  // }


  Widget start_date() {
    return Container(
      alignment: Alignment.bottomLeft,
      decoration: BoxDecoration(

          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 2, color: Color(0xffC5C5C5))),
      width: 300,
      child: TextButton(
        onPressed: () async {
          DateTime? newDate = await showDatePicker(

              context: context,
              initialDate: startBidingDate,
              firstDate: DateTime(2020),
              lastDate: DateTime(2100));
          if (newDate == Null) return;
          setState(() {
            startBidingDate = newDate!;
          });
        },
        child: Text(
          'Stock refill date :  ${startBidingDate.day}/${startBidingDate.month}/${startBidingDate.year}',
          style: TextStyle(
            fontSize: 15,
            color: Colors.black,
          ),   ),
      ),
    );
  }

  // Widget end_date() {
  //   return Container(
  //     alignment: Alignment.bottomLeft,
  //     decoration: BoxDecoration(
  //
  //         borderRadius: BorderRadius.circular(10),
  //         border: Border.all(width: 2, color: Color(0xffC5C5C5))),
  //     width: 300,
  //     child: TextButton(
  //       onPressed: () async {
  //         DateTime? newDate = await showDatePicker(
  //
  //             context: context,
  //             initialDate: endBidingDate,
  //             firstDate: DateTime(2020),
  //             lastDate: DateTime(2100));
  //         if (newDate == Null) return;
  //         setState(() {
  //           endBidingDate = newDate!;
  //         });
  //       },
  //       child: Text(
  //         'End Biding date :  ${endBidingDate.day}/${endBidingDate.month}/${endBidingDate.year}',
  //         style: TextStyle(
  //           fontSize: 15,
  //           color: Colors.black,
  //         ),   ),
  //     ),
  //   );
  // }
  //
  // Widget startBidingTime() {
  //   return Container(
  //     alignment: Alignment.bottomLeft,
  //     decoration: BoxDecoration(
  //
  //         borderRadius: BorderRadius.circular(10),
  //         border: Border.all(width: 2, color: Color(0xffC5C5C5))),
  //     width: 300,
  //     child: TextButton(
  //       onPressed: () async{
  //         TimeOfDay? newTime = await showTimePicker(
  //           context: context,
  //           initialTime: startTime,
  //         );
  //         if(newTime != null){
  //           setState(() {
  //             startTime=newTime;
  //           });
  //         }
  //       },
  //       child: Text(
  //         'Starting Biding Time :  ${startTime.hour} : ${startTime.minute}',
  //         style: TextStyle(
  //           fontSize: 15,
  //           color: Colors.black,
  //         ),   ),
  //     ),
  //   );
  // }
  //
  //
  // Widget endBidingTime() {
  //   return Container(
  //     alignment: Alignment.bottomLeft,
  //     decoration: BoxDecoration(
  //
  //         borderRadius: BorderRadius.circular(10),
  //         border: Border.all(width: 2, color: Color(0xffC5C5C5))),
  //     width: 300,
  //     child: TextButton(
  //       onPressed: () async{
  //         TimeOfDay? newtime = await showTimePicker(
  //             context: context,
  //             initialTime: endTime
  //         );
  //         if(newtime != null)
  //         {
  //           endTime=newtime;
  //         }
  //       },
  //       child: Text(
  //         'Ending Biding Time :  ${endTime.hour} : ${endTime.minute}',
  //         style: TextStyle(
  //           fontSize: 15,
  //           color: Colors.black,
  //         ),   ),
  //     ),
  //   );
  // }
  //
  //
  //


  Padding How() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 2,
            color: Color(0xffC5C5C5),
          ),
        ),
        child: DropdownButton<String>(
          value: selctedItemi,
          onChanged: ((value) {
            setState(() {
              selctedItemi = value!;
            });
          }),
          items: _itemei
              .map((e) => DropdownMenuItem(
            child: Container(
              alignment: Alignment.center,
              child: Row(
                children: [
                  Text(
                    e,
                    style: TextStyle(fontSize: 18),
                  )
                ],
              ),
            ),
            value: e,
          ))
              .toList(),
          selectedItemBuilder: (BuildContext context) => _itemei
              .map((e) => Row(
            children: [Text(e)],
          ))
              .toList(),
          hint: Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Text(
              'How',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          dropdownColor: Colors.white,
          isExpanded: true,
          underline: Container(),
        ),
      ),
    );
  }

  Padding amount() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        keyboardType: TextInputType.number,
        focusNode: amount_,
        controller: amount_c,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          labelText: 'amount',
          labelStyle: TextStyle(fontSize: 17, color: Colors.grey.shade500),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(width: 2, color: Color(0xffC5C5C5))),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(width: 2, color: Colors.deepOrangeAccent)),
        ),
      ),
    );
  }

  Padding explain() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        focusNode: ex,
        controller: expalin_C,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          labelText: 'explain',
          labelStyle: TextStyle(fontSize: 17, color: Colors.grey.shade500),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(width: 2, color: Color(0xffC5C5C5))),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(width: 2, color: Colors.deepOrangeAccent)),
        ),
      ),
    );
  }

  // for name of farmer
  Padding Name() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        //focusNode: ex,
        //controller: expalin_C,// here for storing the name of farmer modify code later
        controller: controllerName,
        decoration: InputDecoration(

          contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          labelText: 'Enter the name of product',

          labelStyle: TextStyle(fontSize: 17, color: Colors.grey.shade500),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(width: 2, color: Color(0xffC5C5C5))),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(width: 2, color: Colors.deepOrangeAccent)),
          suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Cash.svg"),
        ),
      ),
    );
  }



  // for location



  // for quantity of product

  Padding Quantity() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: controllerQuantity,
        keyboardType:TextInputType.number,
        //focusNode: ex,
        //controller: expalin_C,// here for storing the name of farmer modify code later
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          labelText: 'Price',
          labelStyle: TextStyle(fontSize: 17, color: Colors.grey.shade500),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(width: 2, color: Color(0xffC5C5C5))),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(width: 2, color: Colors.deepOrangeAccent)),
          suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/receipt.svg"),
        ),
      ),
    );
  }

  Padding TakeMobileNo(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: controllerMobileNo,
        keyboardType:TextInputType.number,
        //focusNode: ex,
        //controller: expalin_C,// here for storing the name of farmer modify code later
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          labelText: 'Quantity ordered',
          labelStyle: TextStyle(fontSize: 17, color: Colors.grey.shade500),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(width: 2, color: Color(0xffC5C5C5))),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(width: 2, color: Colors.deepOrangeAccent)),
          suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Plus Icon.svg"),
        ),
      ),
    );
  }
  Padding product() {

    _item.sort();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),

      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 2,
            color: Color(0xffC5C5C5),
          ),
        ),
        child: DropdownButton<String>(
          value: selctedItem,

          onChanged: ((value) {

            setState(() {

              selctedItem = value!;

            });
          }),
          items: _item
              .map((e) => DropdownMenuItem(
            child: Container(
              alignment: Alignment.center,
              child: Row(
                children: [
                  Container(
                    width: 40,

                    //child: Image.asset('images/${e}.png'),
                    child: Image.asset('assets/images/${e}_Small.png'),
                  ),
                  SizedBox(width: 10),
                  Text(

                    e,
                    style: TextStyle(fontSize: 18),
                  )
                ],
              ),
            ),
            value: e,
          ))
              .toList(),
          selectedItemBuilder: (BuildContext context) => _item
              .map((e) => Row(
            children: [
              Container(
                width: 42,
                //child: Image.asset('images/${e}.png'),
                child: Image.asset('assets/images/${e}_Small.png'),
              ),
              SizedBox(width: 5),
              Text(e)
            ],
          ))
              .toList(),

          hint: Padding(
            padding: const EdgeInsets.only(top: 12),

            child: Text(
              'Select Product',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          dropdownColor: Colors.white,
          isExpanded: true,
          underline: Container(),
        ),
      ),
    );
  }

  Column background_container(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 240,
          decoration: BoxDecoration(
            color: Colors.deepOrangeAccent,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              SizedBox(height: 40),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Icon(Icons.arrow_back, color: Colors.white),
                    ),
                    Text(
                      'Add Product',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    Icon(
                      Icons.attach_file_outlined,
                      color: Colors.white,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );


  }
  Future createProduct(Products user) async{
    final docUser=FirebaseFirestore.instance.collection('products').doc();
    //user.id=docUser.id;
    final json=user.toJson();
    await docUser.set(json).then((value) =>
        Fluttertoast.showToast(msg: "Product added succesfully").then((value) =>
            Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()))
        ),

    );

  }
}


class Products {
  final String name;

  //final String product;
  final String Quantity;

  ///
  final String mobileno;

  //final String location;
  final DateTime dealDate;
  final DateTime startBidingDate;
  final DateTime endBidingDate;
  final TimeOfDay startTime;
  final TimeOfDay endTime;

  Products({
    required this.name,
    //required this.product,
    required this.Quantity,
    required this.mobileno,
    //required this.location,
    required this.dealDate,
    required this.startBidingDate,
    required this.endBidingDate,
    required this.startTime,
    required this.endTime

  });


  Map<String, dynamic> toJson() =>
      {
        'name': name,
        //'Product':product,
        'Quantity in KG': Quantity,
        'Mobileno': mobileno,
        //'Location':location,
        'Deal_Date': dealDate.toString(),
        'Start_Biding_Date': startBidingDate.toString(),
        'End_Biding_Date': endBidingDate.toString(),
        'Start_time': startTime.toString(),
        'End_time': endTime.toString()
      };

}