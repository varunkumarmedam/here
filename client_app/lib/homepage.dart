import 'package:customerapp/offerpage.dart';
import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart'; 
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

List l=<String>["food","travel","cabs","grocery","clothing"];
  showdialog() async{
   await showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context){
       return Dialog(
         child: Column(
           children: <Widget>[
            ListTile(
              title: Text(l[0]),
              onTap: (){
                Navigator.of(context).pop();
                setState(() {
                  s=l[0];
                });
              },
            ),
            ListTile(
              title: Text(l[1]),
              onTap: (){
                Navigator.of(context).pop();
                setState(() {
                  s=l[1];
                });
              },
            ),
            ListTile(
              title: Text(l[2]),
            onTap: (){
              Navigator.of(context).pop();
                setState(() {
                  s=l[2];
                });
              },
            ),
            ListTile(
              title: Text(l[3]),
            onTap: (){
              Navigator.of(context).pop();
                setState(() {
                  s=l[3];
                });
              },
            ),
            ListTile(
              title: Text(l[4]),
            onTap: (){
              Navigator.of(context).pop();
                setState(() {
                  s=l[4];
                });
              },
            ),
           ],
         ),
       );
      }
    );
  }

  String s='Whats Ur Searching mood';

  @override
  Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: Text("HERE"),
          actions: <Widget>[IconButton(
            icon: Icon(Icons.location_on),
            color: Colors.white,
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(fullscreenDialog: true,builder:(context)=>OffersPage(opt: s,)));
            },
          )],
          ),
          body: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top:4,),
                color: Colors.tealAccent,
                child: ListTile(title: Text(s,textAlign: TextAlign.center,),
                onTap: (){
                  showdialog();
                },
                ),
              ),
              (s=='Whats Ur Searching mood')?Center(
                child: Container(child: Text('Select some thing for action')),
              ):Container(
                height: 300,
                width: double.infinity,
                child: FlareActor(
                  'assets/SuccessCheck.flr',alignment: Alignment.center,fit: BoxFit.contain,animation: "Untitled",),
          )
        ],
      ),
    );
  }
}