import 'package:coretico_socialmedia/model/userdata.dart';
import 'package:flutter/material.dart';

class Infoheader extends StatelessWidget {
  Infoheader({super.key, required this.userdata});
  final Userdata userdata;

  var followTxtstyle = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [Text('Followers'), Text('Post'), Text('Following')],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(userdata.myUserAccount.numFollowers, style: followTxtstyle,),
            Text(userdata.myUserAccount.numFollowing, style: followTxtstyle,),
            Text(userdata.myUserAccount.numPosts, style: followTxtstyle,),
          ],
        ),
        const SizedBox(height: 10),
        const Divider(color: Colors.grey),
      ],
    );
  }
}