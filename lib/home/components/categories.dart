import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:visualizegrow/components/stockentry.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../components/message.dart';
import '../../components/salesentry.dart';
import '../../components/stockentry.dart';
import '../../size_config.dart';




class Categories extends StatelessWidget
{
  get flutterWebviewPlugin => null;

  @override
  Widget build(BuildContext context)
  {
    List<Map<String, dynamic>> categories = [
      {"icon": "assets/icons/Plus Icon.svg", "text": "Sales Entry","key":"1"},
      {"icon": "assets/icons/arrow_right.svg", "text": "Stock Entry","key":"2"},
      {"icon": "assets/icons/receipt.svg", "text": "DailyReport","key":"3"},
      {"icon": "assets/icons/Market View2.svg", "text": "Monthly Report","key":"4"},

      // //{"icon": "assets/icons/Game Icon.svg", "text": "Game"},
      // {"icon": "assets/icons/receipt.svg", "text": "DailyReport","key":"3"},

    ];
    return Padding(
      padding: EdgeInsets.all(getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          categories.length,
              (index) => CategoryCard(
              icon: categories[index]["icon"],
              text: categories[index]["text"],


              press: (){
                if(categories[index]["key"]=="1") // Sales Entry
                    {
                  //Navigator.push(context,MaterialPageRoute(builder: (context)=>FlashDeal()));
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>SalesEntry()));
                  Fluttertoast.showToast(msg: "Sales Entry!");
                }
                else if(categories[index]["key"]=="2")  // Stock Entry
                    {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>StockEntry()));
                  Fluttertoast.showToast(msg: "Stock Entry");
                }
                else if(categories[index]["key"]=="3")  // daily report
                    {
                  //     print("this was it");
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>);
                  // Fluttertoast.showToast(msg: "Daily Report");
                }
                else if(categories[index]["key"]=="4")  // monthly report
                  {
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>StockEntry()));
                  // Fluttertoast.showToast(msg: "Monthly Report");

                }
                // else if(categories[index]["key"]=="3") // Market view
                //     {
                //   Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewUserReport()));
                //   Fluttertoast.showToast(msg: "View Report");
                // }
                // else if(categories[index]["key"]=="4") // Add product
                //     {
                //   Navigator.push(context, MaterialPageRoute(builder: (context)=>UploadPdf()));
                //   //Navigator.push(context, MaterialPageRoute(builder: (context)=>UploadPdf()));
                //   Fluttertoast.showToast(msg: "Add Report");
                //
                }
          )

          ),
        ),

      );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.icon,
    required this.text,
    required this.press,
  }) : super(key: key);

  final String? icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: getProportionateScreenWidth(55),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(15)),
              height: getProportionateScreenWidth(55),
              width: getProportionateScreenWidth(55),
              decoration: BoxDecoration(
                color: Colors.teal[50],
                borderRadius: BorderRadius.circular(10),
              ),
              child: SvgPicture.asset(icon!),
            ),
            SizedBox(height: 5),
            Text(text!, textAlign: TextAlign.center)
          ],
        ),
      ),
    );
  }
}
