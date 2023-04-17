import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:invoice_app/Business_Screen.dart';
import 'package:invoice_app/Item_Screen.dart';
import 'package:invoice_app/User_Screen.dart';

class BillScreen extends StatefulWidget {
  const BillScreen({Key? key}) : super(key: key);

  @override
  State<BillScreen> createState() => _BillScreenState();
}

class _BillScreenState extends State<BillScreen> {
  GlobalKey _globalKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Invoice",
            style: TextStyle(fontSize: 20),
          ),
          actions: [
            IconButton(onPressed: () async {
              RenderRepaintBoundary boundary =  _globalKey.currentContext!.findRenderObject()! as RenderRepaintBoundary;
              var image = await boundary.toImage();
              ByteData? byteData = await image.toByteData(format: ImageByteFormat.png);
              Uint8List uint8List = byteData!.buffer.asUint8List();
              print(uint8List);

              await ImageGallerySaver.saveImage(uint8List);


            }, icon: Icon(Icons.download))
          ],
        ),
        body: RepaintBoundary(
          key: _globalKey,
          child: Container(
            height: double.infinity,
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Center(child: Text("INVOICE",style: TextStyle(fontSize: 30,color: Colors.blue,fontWeight: FontWeight.bold),),),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.all(10),
                          height: 120,
                          width: 300,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("${d1.bname}",style: TextStyle(fontSize: 17,color: Colors.black,fontWeight: FontWeight.bold),),
                              Text("${d1.badd}",style: TextStyle(fontSize: 17,color: Colors.black,),),
                              Text("${d1.bphno}",style: TextStyle(fontSize: 17,color: Colors.black,),),
                              Text("${d1.mailid}",style: TextStyle(fontSize: 17,color: Colors.black,),),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        height: 120,
                        width: 120,
                        child: Image.asset("assets/images/qr.jpg",fit: BoxFit.fill,),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.all(10),
                          height: 120,
                          width: 300,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Bill To:",style: TextStyle(fontSize: 17,color: Colors.black),),
                              Text("${u.name}",style: TextStyle(fontSize: 17,color: Colors.black,fontWeight: FontWeight.bold),),
                              Text("${u.add}",style: TextStyle(fontSize: 17,color: Colors.black,),),
                              Text("${u.no}",style: TextStyle(fontSize: 17,color: Colors.black,),),
                              Text("${u.mail}",style: TextStyle(fontSize: 17,color: Colors.black,),),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        height: 120,
                        width: 100,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Invoice No ",style: TextStyle(fontSize: 17,color: Colors.black,fontWeight: FontWeight.bold),),
                            Text("11223344",style: TextStyle(fontSize: 17,color: Colors.black),),
                            Text("Date",style: TextStyle(fontSize: 17,color: Colors.black,fontWeight: FontWeight.bold),),
                            Text("19/04/2023",style: TextStyle(fontSize: 17,color: Colors.black),),
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
                    height: 50,
                    color: Colors.blue,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(" Item\nNo",style: TextStyle(fontSize: 17,color: Colors.black),),
                        Text("Item\nName",style: TextStyle(fontSize: 17,color: Colors.black),),
                        Text("Item\nprice",style: TextStyle(fontSize: 17,color: Colors.black),),
                        Text("Item\nqnty",style: TextStyle(fontSize: 17,color: Colors.black),),
                        Text("Total ",style: TextStyle(fontSize: 17,color: Colors.black),),
                      ],
                    ),
                  ),
                 SizedBox(
                   height: 100,
                   child: ListView.builder(itemBuilder: (context, index) {
                     return Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           Text("${ProductList[index].ino}"),
                           Text("${ProductList[index].iname}"),
                           Text("${ProductList[index].iprice}"),
                           Text("${ProductList[index].iqnty}"),
                           Text("${ProductList[index].itotal}"),
                         ],
                       ),
                     );
                   },
                   itemCount: ProductList.length,),
                 ),
                  Container(
                    margin: EdgeInsets.all(5),
                    height: 40,
                    color: Colors.blue,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total",style: TextStyle(fontSize: 17),),
                        Text("70000",style: TextStyle(fontSize: 17),),

                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    alignment: Alignment.centerLeft,
                    height: 150,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Pay to - HDFC Bank ",style: TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.bold),),
                        Text("Account Name : ${u.name}",style: TextStyle(fontSize: 15,color: Colors.black),),
                        Text("Account Number : 112233445566",style: TextStyle(fontSize: 15,color: Colors.black),),
                        Text("IFSC code : ABC1234",style: TextStyle(fontSize: 15,color: Colors.black),)
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
