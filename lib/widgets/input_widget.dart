import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InputWidget extends StatefulWidget {
  final String hintText;
  final IconData prefixIcon;
  final double height;
  final Function(String val) onChanged;
  InputWidget(
      {this.hintText, this.prefixIcon, this.height = 53.0, this.onChanged});

  @override
  State<InputWidget> createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(widget.height),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
      ),
      padding: EdgeInsets.only(
        right: 16.0,
        left: this.widget.prefixIcon == null ? 16.0 : 0.0,
      ),
      child: TextFormField(
        onChanged: (val) {
          setState(() {
            this.widget.onChanged(val);
          });
        },
        decoration: InputDecoration(
          prefixIcon: this.widget.prefixIcon == null
              ? null
              : Icon(
                  this.widget.prefixIcon,
                  color: Color.fromRGBO(105, 108, 121, 1),
                ),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.transparent,
            ),
          ),
          hintText: this.widget.hintText,
          hintStyle: TextStyle(
            fontSize: 14.0,
            color: Color.fromRGBO(105, 108, 121, 1),
          ),
        ),
      ),
    );
  }
}
