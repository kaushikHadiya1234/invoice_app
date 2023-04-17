import 'package:flutter/material.dart';
import 'package:invoice_app/DataModal.dart';
import 'package:invoice_app/Home_Screen.dart';


UserDataModal u=UserDataModal();

class UserData extends StatefulWidget {
  const UserData({Key? key}) : super(key: key);

  @override
  State<UserData> createState() => _UserDataState();
}

class _UserDataState extends State<UserData> {

  TextEditingController txtname=TextEditingController();
  TextEditingController txtadd=TextEditingController();
  TextEditingController txtno=TextEditingController();
  TextEditingController txtmail=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("User Detail"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height:30,),
              Infomation("Enter the Client Name", txtname, TextInputType.text),
              Infomation("Enter the Client address", txtadd, TextInputType.text),
              Infomation("Enter the Client no", txtno, TextInputType.number),
              Infomation("Enter the Client gmail", txtmail, TextInputType.emailAddress),
              SizedBox(height: 20),
              FloatingActionButton.extended(onPressed: (){
                u=UserDataModal(name: txtname.text, add: txtadd.text, no: txtno.text, mail: txtmail.text);
              },label: Text("Submit"), )
            ],

          ),
        ),
      ),
    );
  }
}
