import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import './home.dart';

class HereDrop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(40),
      child: Column(
        children: <Widget>[
          Image.asset('assets/here_shop.png'),
          FormBuilder(
            context,
            autovalidate: true,
            controls: [
              FormBuilderInput.dropdown(
                attribute: "dropdown",
                require: true,
                label: " ",
                hint: "Select Category",
                options: [
                  FormBuilderInputOption(value: "Food"),
                  FormBuilderInputOption(value: "Clothes"),
                  FormBuilderInputOption(value: "Daily Needs"),
                ],
              ),
            ],
            onSubmit: (_) {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Home()));
            },
          ),
        ],
      ),
    );
  }
}

class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:Center(
        child: Text("Hello World"),
      )
    );
  }
}