import 'package:chatting_app/screens/login.dart';
import 'package:chatting_app/screens/sign_up.dart';
import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(height:150,width:MediaQuery.of(context).size.width,decoration:const BoxDecoration(color:Colors.deepPurple,borderRadius: BorderRadius.only(bottomRight: Radius.circular(96),bottomLeft: Radius.circular(96),topRight: Radius.circular(96))),child: const Center(child: Text('ChatEasy',style: TextStyle(fontSize: 50,color:Colors.white)))),
              const SizedBox(height: 80,),
              SizedBox(height:48,width:300,child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor:Colors.deepPurple,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24))),onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>const LoginForm()));}, child: const Text("Login"))),
              const SizedBox(height: 16,),
              SizedBox(height:48,width:300,child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor:Colors.deepPurple,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24))),onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>const Registration()));}, child: const Text("Registration")))
            ],),
        ),
      ),);
  }
}
