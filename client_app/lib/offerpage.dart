import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OffersPage extends StatelessWidget {
  String opt;
  OffersPage({opt});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Neary food offers"),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection('food').snapshots(),

        builder: (context,snapshot){
          switch (snapshot.connectionState) {
            case ConnectionState.waiting: return CircularProgressIndicator();
              
              break;
            default:
          return ListView.builder(
            shrinkWrap: true,
            itemCount: snapshot.data.documents.length,
            itemBuilder: (context,index){
              DocumentSnapshot ds=snapshot.data.documents[index];
              return Container(
                margin: EdgeInsets.only(bottom: 3),
                height: 80,
                color: Colors.green,
                width: double.infinity,
                child: Row(
                children:<Widget>[
                Container(height: 200,
                width: 40,
                margin: EdgeInsets.only(right: 15),
                decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage(ds['image']),fit: BoxFit.cover)
                ),),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(ds['shop'],style: TextStyle(fontSize: 20),),
                  Text(ds['offer'],overflow: TextOverflow.ellipsis,textAlign: TextAlign.start,)
                ],
              )
              
                ]),
              );
            },
          );
          }
        },
      ),
    );
  }
}