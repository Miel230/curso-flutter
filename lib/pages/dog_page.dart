 import 'package:development/pages/hello_listview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DogPage extends StatelessWidget {
  const DogPage({super.key, required this.dog});

   final Dog dog;


   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         title: Text(dog.nome),
       )
     );
   }
 }
 