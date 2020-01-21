import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app_first/demo/listview_demo.dart';

void main() => runApp(App());

class App extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        highlightColor: Color.fromRGBO(255, 255, 255, 0.5),
        splashColor: Colors.white70
      ),
    );
  }
}

class Home extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          backgroundColor: Colors.grey[100],
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.menu),
              tooltip: "Navigration",
              onPressed: ()=>debugPrint("I am Navigration Button"),
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.search),
                tooltip: "Search",
                onPressed: ()=>debugPrint("I am Search Button"),
              ),
            ],
            title: Text("ninahao",
              textAlign: TextAlign.center,
            ),
            elevation: 0.0,
            //backgroundColor: Colors.yellow,
            bottom: TabBar(
              unselectedLabelColor: Colors.black54,
              indicatorColor: Colors.black54,
              indicatorSize: TabBarIndicatorSize.label,
              tabs: <Widget>[
                Tab(icon: Icon(Icons.local_florist)),
                Tab(icon: Icon(Icons.change_history)),
                Tab(icon: Icon(Icons.directions_bike)),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              Icon(Icons.local_florist),
              Icon(Icons.change_history),
              Icon(Icons.directions_bike)
            ],
          ),
          drawer: Container(
            width: 200.0,
            color: Colors.white,
            padding: EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("我是抽屉")
              ],
            ),
          ),
      ),
    );
  }
}



class Hello extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Text(
        'Hello',
        textDirection: TextDirection.ltr,
        style: TextStyle(
          fontSize: 40.0,
          fontWeight: FontWeight.bold,
          color: Colors.yellow
        ),
      ),
    );
  }
}
