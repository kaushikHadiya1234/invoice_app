import 'package:flutter/material.dart';
import 'package:invoice_app/DataModal.dart';
import 'package:invoice_app/Home_Screen.dart';

DataModal d1=DataModal();

class Business extends StatefulWidget {
  const Business({Key? key}) : super(key: key);

  @override
  State<Business> createState() => _BusinessState();
}

class _BusinessState extends State<Business> {

  TextEditingController txtbname=TextEditingController();
  TextEditingController txtbadd=TextEditingController();
  TextEditingController txtbno=TextEditingController();
  TextEditingController txtbmail=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Business Detail"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height:30,),
              Infomation("Enter the Shop Name", txtbname, TextInputType.text),
              Infomation("Enter the shop address", txtbadd, TextInputType.text),
              Infomation("Enter the Contact no", txtbno, TextInputType.number),
              Infomation("Enter the gmail", txtbmail, TextInputType.emailAddress),
              SizedBox(height: 20),
              FloatingActionButton.extended(onPressed: (){
                d1=DataModal(bname: txtbname.text, badd: txtbadd.text, bphno: txtbno.text, mailid: txtbmail.text);
              },label: Text("Submit"), )
            ],

          ),
        ),
      ),
    );
  }
}
