import 'package:development/drawer_list.dart';
import 'package:development/pages/hello_listview.dart';
import 'package:development/pages/hello_page1.dart';
import 'package:development/pages/hello_page2.dart';
import 'package:development/pages/hello_page3.dart';
import 'package:development/utils/nav.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Hello Flutter"),
          bottom: TabBar(tabs: [
            Tab(text: "Tab 1",),
            Tab(text: "Tab 2",),
            Tab(text: "Tab 3",),
          ]),
        ),
        body: TabBarView(children: [
          _body(context),
          Container(
            color: Colors.green,
          ),
          Container(
            color: Colors.yellow,
          )
        ]),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                _onClickFab();
              },
            ),
            SizedBox(
              width: 8,
              height: 8,
            ),
            FloatingActionButton(
              child: Icon(Icons.favorite),
              onPressed: () {
                _onClickFab();
              },
            )
          ],
        ),
          drawer: DrawerList(
          ),
      ),
    );
  }


  _onClickFab() {
    print("Adicionar");
  }

  _body(context) {
    return Container(
      padding: EdgeInsets.only(top: 16),
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[_text(), _pageView(), _buttons(),
        ],
      ),
    );
  }

  Container _pageView() {
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 20),
      height: 300,
      child: PageView(
        children: <Widget>[
          _img("assets/images/dog1.png"),
          _img("assets/images/dog2.png"),
          _img("assets/images/dog3.png"),
          _img("assets/images/dog4.png"),
          _img("assets/images/dog5.png")
        ],
      ),
    );
  }

  _buttons() {
   return Builder(builder: (context)
   {
     return Column(
       children: <Widget>[
         Row(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children: <Widget>[
             _button(context, "ListView",
                     () => _onClickNavigator(context, HelloListView())),
             _button(context, "Page 2",
                     () => _onClickNavigator(context, HelloPage2())),
             _button(context, "Page 3",
                     () => _onClickNavigator(context, HelloPage3())),
           ],
         ),
         Row(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children: <Widget>[
             _button(context, "Snack", () => _onClickSnack(context)),
             _button(context, "Dialog", () => _onClickDialog(context)),
             _button(context, "Toast", _onClickToast)
           ],
         )
       ],
     );
   });
   }



  void _onClickNavigator(BuildContext context, Widget page) async {

    String s = await push(context, page);

   print(">> $s");
  }

  _onClickSnack(context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text('Ola Flutter'),
      duration: const Duration(seconds: 1),
      action: SnackBarAction(
       textColor: Colors.yellow,
        label: 'OK',
        onPressed: () {
          print("OK!");
        },
      ),
    ));
  }

  _onClickDialog(BuildContext context) {
   showDialog(context: context,
       barrierDismissible: false,
       builder: (context) {
     return WillPopScope(
       onWillPop: () async => false,
       child: AlertDialog(
         title: Text("Flutter é muito legal"),
         actions: <Widget>[
           TextButton(onPressed: () {
         Navigator.pop(context);
       } , child: Text("Cancelar")
           ),
           TextButton(onPressed:  () {
             Navigator.pop(context);
           } , child: Text("OK")
           ),
         ],
       ),
     );
   });
  }

  _onClickToast() {
    Fluttertoast.showToast(
        msg:"Flutter é muito legal",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 5,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

  _button(BuildContext context, String text, Function onPressed) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.blue),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontStyle: FontStyle.italic,
        ),
      ),
      onPressed: () => onPressed(),
    );
  }

  _img(String img) {
    return Image.asset(
      img,
      fit: BoxFit.cover,
    );
  }

  _text() {
    return Text(
      "Hello World",
      style: TextStyle(
          color: Colors.blue,
          fontSize: 30,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
          decoration: TextDecoration.underline,
          decorationColor: Colors.red,
          decorationStyle: TextDecorationStyle.wavy),
    );
  }
}


