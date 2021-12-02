import 'package:flutter/material.dart';

class ChatCard extends StatelessWidget {
  ChatCard({this.message, this.sender, this.isMe});

  final String message, sender;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: (isMe) ? Colors.purple : Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20,),
          bottomLeft: (isMe)?Radius.circular(20,):Radius.circular(0,),
          bottomRight: (isMe)?Radius.circular(0,):Radius.circular(20,),
        ),
      ),
      margin: (isMe)
          ? EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.5)
          : EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.5),
      //elevation: 15,
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment:
              (isMe) ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Text(
              sender,
              style: TextStyle(color: (isMe) ? Colors.white : Colors.purple),
            ),
            Text(
              message,
              style: TextStyle(color: (isMe) ? Colors.white : Colors.purple),
            ),
          ],
        ),
      ),
    );
  }
}
