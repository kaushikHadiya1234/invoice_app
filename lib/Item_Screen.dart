import 'package:flutter/material.dart';
import 'package:invoice_app/DataModal.dart';
import 'package:invoice_app/Home_Screen.dart';

List<ItemModal> ProductList = [
  ItemModal(ino: '5502', iname: 'Laptop', iqnty: '1', iprice: '50000',itotal: 50000),
];

class Item extends StatefulWidget {
  const Item({Key? key}) : super(key: key);

  @override
  State<Item> createState() => _ItemState();
}
class _ItemState extends State<Item> {

  String price= '';
  String qanty= '';

   int total=1;

  TextEditingController txtino=TextEditingController();
  TextEditingController txtiname=TextEditingController();
  TextEditingController txtiqa=TextEditingController();
  TextEditingController txtiprice=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Add Product"),
          actions: [
            IconButton(onPressed: () {
              setState(() {
                txtino=TextEditingController();
                txtiname=TextEditingController();
                txtiqa=TextEditingController();
                txtiprice=TextEditingController();

              });
             showDialog(context: context, builder: (context) {
               return SingleChildScrollView(
                 child: AlertDialog(
                   title: Text("Add Item"),
                   content: Column(
                     mainAxisSize: MainAxisSize.min,
                     children: [
                       Infomation("Enter item no", txtino, TextInputType.number),
                       Infomation("Enter item name", txtiname, TextInputType.text),
                       Container(
                         margin: EdgeInsets.all(10),
                         child: TextField(
                           controller: txtiprice,
                           onChanged: (value) {
                             setState(() {
                               price=value;
                             });
                           },
                           keyboardType:TextInputType.number,
                           decoration: InputDecoration(
                             focusedBorder: OutlineInputBorder(
                               borderRadius: BorderRadius.circular(20),
                             ),
                             enabledBorder: OutlineInputBorder(
                               borderRadius: BorderRadius.circular(20),
                             ),
                             border: OutlineInputBorder(
                               borderRadius: BorderRadius.circular(20),
                             ),
                             hintText:'Enter item price' ,
                             hintStyle: TextStyle(color: Colors.grey),
                           ),
                         ),
                       ),
                       Container(
                         margin: EdgeInsets.all(10),
                         child: TextField(
                           controller: txtiqa,
                           onChanged: (value) {
                             setState(() {
                               qanty=value;
                               // total = (int.parse(price)*int.parse(qanty)).toString();
                             });
                           },
                           keyboardType:TextInputType.number,
                           decoration: InputDecoration(
                             focusedBorder: OutlineInputBorder(
                               borderRadius: BorderRadius.circular(20),
                             ),
                             enabledBorder: OutlineInputBorder(
                               borderRadius: BorderRadius.circular(20),
                             ),
                             border: OutlineInputBorder(
                               borderRadius: BorderRadius.circular(20),
                             ),
                             hintText:'Enter item qnty' ,
                             hintStyle: TextStyle(color: Colors.grey),
                           ),
                         ),
                       ),
                       FloatingActionButton.extended(onPressed: () {
                        setState(() {

                          int price1 = int.parse(txtiprice.text);
                          int qun = int.parse(txtiqa.text);

                          total = price1 * qun;
                          print(total);

                          ItemModal i=ItemModal(ino: txtino.text,iname: txtiname.text,iprice: txtiprice.text,iqnty: txtiqa.text,itotal: total);
                          ProductList.add(i);



                          Navigator.pop(context);
                          txtino.text='';
                          txtiname.text='';
                          txtiprice.text='';
                          txtiqa.text='';



                        });
                       },label: Text("Add"),)
                     ],
                   ),
                 ),
               );
             },);
            }, icon: Icon(Icons.add))
          ],
        ),
        body: SizedBox(
          child: ListView.builder(itemBuilder: (context, index) {
              return InkWell(
                onLongPress: () {
                  ProductList.removeAt(index);
                },
                onTap: () {
                  txtino = TextEditingController(text: ProductList[index].ino);
                  txtiname = TextEditingController(text: ProductList[index].iname);
                  txtiprice = TextEditingController(text: ProductList[index].iprice);
                  txtiqa = TextEditingController(text: ProductList[index].iqnty);

                  showDialog(context: context, builder: (context) {
                    return AlertDialog(
                      title: Text("edit Product"),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Infomation("Enter item no", txtino , TextInputType.number),
                          Infomation("Enter item name", txtiname, TextInputType.text),
                          Container(
                            margin: EdgeInsets.all(10),
                            child: TextField(
                              controller: txtiprice ,
                              onChanged: (value) {
                                setState(() {
                                  price=value;
                                });
                              },
                              keyboardType:TextInputType.number,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                hintText:'Enter item price' ,
                                hintStyle: TextStyle(color: Colors.grey),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(10),
                            child: TextField(
                              controller: txtiqa,
                              onChanged: (value) {
                                setState(() {
                                  qanty=value;
                                  // total = (int.parse(price)*int.parse(qanty)).toString();

                                });
                              },
                              keyboardType:TextInputType.number,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                hintText:'Enter item qnty' ,
                                hintStyle: TextStyle(color: Colors.grey),
                              ),
                            ),
                          ),
                          FloatingActionButton.extended(onPressed: () {
                            setState(() {
                              int price1 = int.parse(txtiprice.text);
                              int qun = int.parse(txtiqa.text);

                              total = price1 * qun;
                              print(total);

                              ItemModal i=ItemModal(ino: txtino.text,iname: txtiname.text,iprice: txtiprice.text,iqnty: txtiqa.text,itotal: total);

                              ProductList[index].ino=txtino.text;
                              ProductList[index].iname=txtiname.text;
                              ProductList[index].iprice=txtiprice.text;
                              ProductList[index].iqnty=txtiqa.text;
                              ProductList[index].itotal=total;

                              Navigator.pop(context);

                            });
                          },label: Text("Update"),)
                        ],
                      ),
                    );
                  },);
                },
                child: Container(
                  margin: EdgeInsets.all(10),
                  height: 95,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue),
                    borderRadius: BorderRadius.circular(30)
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 45,
                        margin: EdgeInsets.only(left: 10,right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("No",style: TextStyle(color: Colors.black),),
                            Text("Name",style: TextStyle(color: Colors.black),),
                            Text("Qunty",style: TextStyle(color: Colors.black),),
                            Text("Price",style: TextStyle(color: Colors.black),),
                            Text("total",style: TextStyle(color: Colors.black),),
                          ],
                        ),
                      ),
                      Container(
                        height: 45,
                        margin: EdgeInsets.only(left: 10,right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("${ProductList[index].ino}",style: TextStyle(color: Colors.blue),),
                            Text("${ProductList[index].iname}",style: TextStyle(color: Colors.blue),),
                            Text("${ProductList[index].iqnty}",style: TextStyle(color: Colors.blue),),
                            Text("${ProductList[index].iprice}",style: TextStyle(color: Colors.blue),),
                            Text("${ProductList[index].itotal}",style: TextStyle(color: Colors.blue),),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },itemCount: ProductList.length,),
        ),
      ),
    );
  }
}
