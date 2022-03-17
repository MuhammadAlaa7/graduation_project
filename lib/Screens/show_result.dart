import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Results extends StatefulWidget {
  final String? choosedImage;
  const Results({Key? key, this.choosedImage}) : super(key: key);
  @override
  _ResultsState createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Result',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color:  Color(0xff012256),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         Row(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
           SizedBox(
             width: 300,
             child:  Image.file(File(widget.choosedImage!),fit: BoxFit.fill,),
           )
           ],
         )
        ],),
    );
  }
}
