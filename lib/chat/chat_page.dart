import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:cv/chat/chat_card.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  var _fireStore = FirebaseFirestore.instance;
  String newMessage;
  var _controller = TextEditingController();
  bool isMe;
  ScrollController scrollController = new ScrollController();

  //-----------------------------------------
  var _auth = FirebaseAuth.instance;
  var loggedInUser;

  getCurrentUser() {
    User user = _auth.currentUser;
    loggedInUser = user.email;
  }

  //-----------------------------------------
  @override
  void initState() {
    getCurrentUser();
    super.initState();
  }

  //----------------------------------------
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return null;
      },
      child: Scaffold(
        backgroundColor: Colors.grey[400],
        drawer: Drawer(),
        appBar: AppBar(
          //leading: Container(),
          actions: [
            Row(children: [
              Text('logout',),
              SizedBox(width: 5,),
              IconButton(icon: Icon(Icons.logout), onPressed: () {
                _auth.signOut();
                Navigator.pop(context);
              })
            ],)
          ],
          backgroundColor: Colors.purple,
          centerTitle: true,
          title: Text(
            'chat',
            style: TextStyle(
              fontSize: 35,
            ),
          ),
        ),
        body: Column(
          children: [
            StreamBuilder<QuerySnapshot>(
                stream: _fireStore
                    .collection('chat')
                    .orderBy('sort', descending: false)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  var items = snapshot.data.docs;
                  List<Widget> chatList = [];
                  for (var item in items) {
                    String message = item.data()['message'];
                    String sender = item.data()['sender'];
                    if (sender == loggedInUser) {
                      isMe = true;
                    } else {
                      isMe = false;
                    }
                    var itemList = ChatCard(
                      isMe: isMe,
                      sender: sender,
                      message: message,
                    );
                    chatList.addAll([itemList, SizedBox(height: 13,),]);
                  }
                  return Expanded(
                      child: ListView(
                        controller: scrollController,
                        padding: EdgeInsets.all(15),
                        children: chatList,
                      ));
                }),
            InkWell(
              onTap: () {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  if (scrollController.hasClients) {
                    scrollController.jumpTo(
                        scrollController.position.maxScrollExtent);
                  }
                });
              },
              child: Container(
                padding: EdgeInsets.all(12),
                color: Colors.grey[200],
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        onChanged: (val) {
                          newMessage = val;
                        },
                        decoration: InputDecoration(
                            hintText: 'enter your message'),
                      ),
                    ),
                    IconButton(
                        icon: Icon(
                          Icons.send,
                          color: Colors.teal,
                          size: 40,
                        ),
                        onPressed: () async {
                          _controller.clear();
                          await _fireStore.collection('chat').add({
                            'message': newMessage,
                            'sender': loggedInUser,
                            'sort': DateTime
                                .now()
                                .millisecondsSinceEpoch
                          });
                        })
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
