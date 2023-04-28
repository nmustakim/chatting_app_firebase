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
          padding: const EdgeInsets.fromLTRB(24, 0, 24 , 128),
          child: Column(
mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Expanded(child: SizedBox()),
              const Center(child: Text('ChatEasy',style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold,))),
              const SizedBox(height: 80,),
              SizedBox(height:48,width:300,child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor:Colors.deepPurple,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24))),onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>const LoginForm()));}, child: const Text("Login"))),
              const SizedBox(height: 16,),
              SizedBox(height:48,width:300,child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor:Colors.deepPurple,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24))),onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>const Registration()));}, child: const Text("Registration")))
            ],),
        ),
      ),);
  }
}
