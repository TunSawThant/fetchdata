import 'package:fetchdata/sharpreference/shp.dart';
import 'package:fetchdata/store/page/home.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home:
      Scaffold(
        appBar: AppBar(
          title: Text("Hello Fetch data"),
        ),
        body: ListView(
          children: <Widget>[
            GestureDetector(
              child: Card(
                child: ListTile(
                  title: Text("Flutter Store",style: TextStyle(fontSize: 32.0,fontWeight: FontWeight.bold),),
                  onTap: null,
                ),
              ),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>StoreHome()));
              },
            ),
            InkWell(
              child: Card(
                child: ListTile(
                  title: Text("Shared Preference",style: TextStyle(fontSize: 32.0,fontWeight: FontWeight.bold),),
                  onTap: null,
                ),
              ),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return SharePrefer();
                })
                );
              },            ),
          ],

        ),
      ),
    );
  }
}
