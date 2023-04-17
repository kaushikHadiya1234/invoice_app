import 'package:flutter/material.dart';
import 'package:invoice_app/Bill_Screen.dart';
import 'package:invoice_app/Business_Screen.dart';
import 'package:invoice_app/Item_Screen.dart';
import 'package:invoice_app/User_Screen.dart';

Widget Infomation(String? hint,TextEditingController? controller,TextInputType? k, )
{
  return Container(
    margin: EdgeInsets.all(10),
    child: TextField(
      controller: controller,
      keyboardType: k,
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
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey),
      ),
    ),
  );
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int i = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: IndexedStack(
          index: i,
          children: [
            Business(),
            UserData(),
            Item(),
            BillScreen()
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: i,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            type: BottomNavigationBarType.shifting,
            onTap: (value) {
              setState(() {
                i=value;
              });
            },
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.add_business_outlined),label: ""),
              BottomNavigationBarItem(icon: Icon(Icons.person),label: ""),
              BottomNavigationBarItem(icon: Icon(Icons.production_quantity_limits),label: ""),
              BottomNavigationBarItem(icon: Icon(Icons.receipt_long),label: ""),
            ]),
      ),
    );
  }

}
