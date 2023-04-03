import 'package:chatting_app/screens/login.dart';
import 'package:chatting_app/screens/sign_up.dart';
import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(height:450,width:MediaQuery.of(context).size.width,decoration:const BoxDecoration(color:Colors.deepPurple,borderRadius: BorderRadius.only(bottomRight: Radius.circular(200),bottomLeft: Radius.circular(200))),child:const Center(child: Padding(
                padding: EdgeInsets.only(top: 80),
                child: Text('Welcome',style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold,color:Colors.white),),
              ))),
              const SizedBox(height: 80,),
              SizedBox(height:48,width:300,child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor:Colors.deepPurple,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24))),onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>const LoginForm()));}, child: const Text("Login"))),
              const SizedBox(height: 16,),
              SizedBox(height:48,width:300,child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor:Colors.deepPurple,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24))),onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>const Registration()));}, child: const Text("Registration")))
            ],),
        ),
      ),);
  }
}
