import 'package:flutter/material.dart';
import './here.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Home",
            style: TextStyle(fontSize: 27),
          ),
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.book),
                text: "Dashboard",
              ),
              Tab(
                icon: Icon(Icons.message),
                text: "Offers",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Test(),
            Test()
          ],
        ),
      ),
    );
  }
}