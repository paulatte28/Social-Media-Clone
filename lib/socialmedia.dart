import 'package:flutter/material.dart';
import 'package:coretico_socialmedia/model/userdata.dart';
import 'package:coretico_socialmedia/views/friendlist.dart';
import 'package:coretico_socialmedia/views/infoheader.dart';
import 'package:coretico_socialmedia/views/mainheader.dart';
import 'package:coretico_socialmedia/views/postlist.dart';

class Socialmedia extends StatefulWidget {
  const Socialmedia({super.key});

  @override
  State<Socialmedia> createState() => _SocialmediaState();
}

class _SocialmediaState extends State<Socialmedia> {
  Userdata userData = Userdata();

  var followTxtStyle = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
          }, icon: Icon(Icons.arrow_back),
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          Mainheader(userdata: userData),
          Infoheader(userdata: userData),
          Friendlist(userdata: userData),
          const SizedBox(height: 20),
          Padding(padding: 
          const EdgeInsets.only(left: 8),
          child: Row(children: [
            Text('Posts', style: followTxtStyle,)],
          ),),
          const SizedBox(height: 20),
          Postlist(userdata: userData),
        ],
      )
    );
  }
}