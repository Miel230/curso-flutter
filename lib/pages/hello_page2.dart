import 'package:flutter/material.dart';

class HelloPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page 2"),
      ),
      body: _body(context),
    );
  }

  _body(context) {
    return Center(
      child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.blue),
          ),
          child: Text(
            "Voltar",
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () => _onClickVoltar(context)),
    );
  }

  _onClickVoltar(context) {
    Navigator.pop(context, "Tela 2");
  }
}
