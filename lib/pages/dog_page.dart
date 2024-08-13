 import 'package:development/pages/hello_listview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DogPage extends StatelessWidget {
  const DogPage(this.dog, {super.key});

   final Dog dog;

  @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         title: Text(dog.nome),
         backgroundColor: Colors.blue,
       ),
           body: Image.asset(dog.foto),
     );
   }
 }
 