import 'package:flutter/material.dart';
import 'package:real_estate_ui/widgets/input_widget.dart';
import 'package:real_estate_ui/widgets/primary_button.dart';

class AddPropertyScreen extends StatefulWidget {
  @override
  State<AddPropertyScreen> createState() => _AddPropertyScreenState();
}

class _AddPropertyScreenState extends State<AddPropertyScreen> {
  String name;
  String address;
  String price;
  String description;
  String image;
  String type;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Property'),
      ),
      body: ListView(children: [
        SizedBox(height: 15.0),
        InputWidget(
          hintText: "Name of property",
          onChanged: (value) {
            setState(() {
              name = value;
            });
          },
        ),
        SizedBox(height: 15.0),
        InputWidget(
          hintText: "Detailed Description",
          onChanged: (value) {
            setState(() {
              description = value;
            });
          },
        ),
        SizedBox(height: 15.0),
        InputWidget(
          hintText: "Type of property",
          onChanged: (value) {
            setState(() {
              type = value;
            });
          },
        ),
        SizedBox(height: 15.0),
        InputWidget(
          hintText: "Location address",
          onChanged: (value) {
            setState(() {
              address = value;
            });
          },
        ),
        SizedBox(height: 15.0),
        InputWidget(
          hintText: "Price of property",
          onChanged: (value) {
            setState(() {
              name = value;
            });
          },
        ),
        SizedBox(height: 15.0),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 15.0),
          child: PrimaryButton(
            onPressed: () {},
            text: 'Add Property',
          ),
        )
      ]),
    );
  }
}
