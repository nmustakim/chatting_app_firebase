import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
FirebaseFirestore? firestore;
User? user;
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  FirebaseAuth? firebaseAuth;





  TextEditingController? messageController;

  @override
  void initState() {
    messageController = TextEditingController();
    firestore = FirebaseFirestore.instance;
    firebaseAuth = FirebaseAuth.instance;
    getCurrentUser();
    super.initState();
  }

  void getCurrentUser() {
    try {
      user = firebaseAuth!.currentUser;
    } catch (error) {
      print(error);
    }
  }
  void saveMessage() async {
    final message = <String, dynamic>{
      "sender": firebaseAuth!.currentUser!.email,
      "text": messageController!.text,
      'timestamp': DateTime.now().microsecondsSinceEpoch
    };

   await firestore!.collection("messages").add(message);

  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation:0,backgroundColor:Colors.deepPurple,automaticallyImplyLeading: false,actions: [IconButton(onPressed: (){Navigator.pop(context);}, icon: const Icon(Icons.close))],),
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [


            const Messages(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                SizedBox(
                    height: 45,
                    width: MediaQuery.of(context).size.width/1.4,
                    child: TextField(
                      controller: messageController,
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(8),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(24))),
                    )),
                IconButton(
                    onPressed: () {
                      saveMessage();
                      messageController!.clear();
                    },
                    icon:const Padding(
                      padding: EdgeInsets.only(bottom: 16),
                      child: Icon(Icons.send,size: 42,color: Colors.deepPurple,),
                    ))
              ],
            ),


          ],
        ),
      ),
    ));
  }
}

class Messages extends StatelessWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder <QuerySnapshot> (stream:firestore!.collection('messages').orderBy('timestamp',descending: true).snapshots(),builder: (context,snapshot){
      if(snapshot.hasData){
List <MessageContainer>  messageWidgets = [];
for(QueryDocumentSnapshot qds in snapshot.data!.docs){
  String mt = qds.get("text");
  String ms = qds.get("sender");
  MessageContainer messageContainer = MessageContainer(sender: ms, msgText: mt, isMe:ms == user!.email ? true : false  );
  messageWidgets.add(messageContainer);
}
return Expanded(
  child:   ListView (
    reverse: true,
      children:
      messageWidgets
  ),
);
      }
      else{
        return Container();
      }

    });
  }
}

class MessageContainer extends StatelessWidget {
 final String sender;
  final String msgText;
  final bool isMe;
  const MessageContainer({Key? key, required this.sender, required this.msgText, required this.isMe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding (padding: const EdgeInsets.all(16),child:
      Column(
        crossAxisAlignment: isMe == true ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children:
        [
          Text(sender,style: const TextStyle(fontSize: 10,),),
          const SizedBox(height: 8,),
          Container(
            padding: const EdgeInsets.all(16),
              decoration:isMe == true ? const BoxDecoration(color:Colors.deepPurple,borderRadius: BorderRadius.only(topLeft: Radius.circular(24),bottomLeft: Radius.circular(24),bottomRight: Radius.circular(24))):const BoxDecoration(color:Colors.indigo,borderRadius: BorderRadius.only(topRight: Radius.circular(24),bottomLeft: Radius.circular(24),bottomRight: Radius.circular(24))),child: Text(msgText,style: TextStyle(color: isMe == true ? Colors.white : Colors.black),))

      ],)
      ,);
  }
}



