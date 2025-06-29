import 'package:flutter/material.dart';
import 'package:tugas_listview/page/login_page.dart';

class HomePage extends StatefulWidget{
  HomePage({super.key});

  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
@override
Widget build(BuildContext context){
  return Scaffold(
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Welcome Back",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: (){
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(
                  "Logout Success"
                ),
                ), 
                );
                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
            },
            child: Text("Logout")
          ),
        ],
      ),
    )
  );
}
}