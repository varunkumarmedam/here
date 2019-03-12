import 'package:flutter/material.dart';
import 'package:multi_page_form/multi_page_form.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
          children: <Widget>[Dashboard(), Offers()],
        ),
      ),
    );
  }
}

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: BouncingScrollPhysics(),
      children: <Widget>[
        Container(
            margin: EdgeInsets.all(10),
            height: 200,
            child: Card(
                elevation: 20,
                child: Center(child: Text("Analytics is Loading...")))),
        Container(
            margin: EdgeInsets.all(10),
            height: 200,
            child: Card(
                elevation: 20,
                child: Center(child: Text("Client data goes here")))),
        Container(
            margin: EdgeInsets.all(10),
            height: 200,
            child: Card(
                elevation: 20, child: Center(child: Text("Product Reviews")))),
      ],
    );
  }
}

class Offers extends StatefulWidget {
  _OffersState createState() => _OffersState();
}

class _OffersState extends State<Offers> {
  final _offerForm = GlobalKey();
  var controller = TextEditingController();
  String drop = "Dosa";
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _offerForm,
      child: MultiPageForm(
        totalPage: 2,
        pageList: <Widget>[
          Column(
            children: <Widget>[
              Container(
                  child: DropdownButton<String>(
                    value: drop,
                    elevation: 5,
                    hint: Text("Select a Category"),
                items: <String>['Dosa', 'Idly', 'Others'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                   drop = value; 
                  });
                },
              )),
              Container(
                margin: EdgeInsets.all(30),
                height: 300.0,
                width: 300.0,
                child: TextFormField(
                  controller: controller,
                  scrollPadding: EdgeInsets.all(10),
                  decoration: InputDecoration(
                      hintText: "Add an Offer", icon: Icon(Icons.edit)),
                ),
              ),
            ],
          ),
          Container(
            height: 100.0,
            width: 100.0,
            child: Image.asset('./assets/add_image.png'),
          ),
        ],
        onFormSubmitted: () {
          sendmessage();
        },
      ),
    );
  }

  void sendmessage() async {
    await Firestore.instance.collection('food').add({
      'shop': 'VarunVorld Enterprises',
      'category': 'food',
      'offer': controller.text,
      'time': DateTime.now(),
      'image' : 'https://cdn.pixabay.com/photo/2014/12/22/00/03/food-576689_640.png'
    });
  }
}
