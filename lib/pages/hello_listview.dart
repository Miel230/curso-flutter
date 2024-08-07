import 'package:flutter/material.dart';

class HelloListview extends StatelessWidget {
  const HelloListview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView"),
      ),
      body: _body(),
    );
  }

  _body() {
    return ListView(
      itemExtent: 350,
      children: <Widget>[
        _img("assets/images/dog1.png"),
        _img("assets/images/dog2.png"),
        _img("assets/images/dog3.png"),
        _img("assets/images/dog4.png"),
        _img("assets/images/dog5.png")
      ],
    );
  }
  _img(String img) {
    return Image.asset(
      img,
      fit: BoxFit.cover,
    );
  }
}
