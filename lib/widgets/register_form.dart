import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:real_estate_ui/models/user_model.dart';
import 'package:real_estate_ui/screens/home.dart';
import 'package:real_estate_ui/provider/auth_provider.dart';
import 'package:real_estate_ui/utils/helper.dart';
import 'package:real_estate_ui/widgets/input_widget.dart';
import 'package:real_estate_ui/widgets/primary_button.dart';

class RegisterForm extends StatefulWidget {
  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  String phoneNumber;
  String fullName;
  String password;
  String email;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            InputWidget(
              hintText: "Full Name",
              onChanged: (value) {
                setState(() {
                  fullName = value;
                });
              },
              prefixIcon: FlutterIcons.person_outline_mdi,
            ),
            SizedBox(height: 15.0),
            InputWidget(
              hintText: "Email Address",
              onChanged: (value) {
                setState(() {
                  email = value;
                });
              },
              prefixIcon: FlutterIcons.mail_ant,
            ),
            SizedBox(height: 15.0),
            InputWidget(
              hintText: "Phone Number",
              onChanged: (value) {
                setState(() {
                  phoneNumber = value;
                });
              },
              prefixIcon: FlutterIcons.phone_call_fea,
            ),
            SizedBox(height: 15.0),
            InputWidget(
              hintText: "Password",
              onChanged: (value) {
                setState(() {
                  password = value;
                });
              },
              prefixIcon: FlutterIcons.lock_ant,
            ),
            SizedBox(height: 25.0),
            PrimaryButton(
              text: "Register",
              onPressed: () async {
                await Provider.of<AuthProvider>(context, listen: false)
                    .signUp(UserModel(
                  email: email,
                  password: password,
                  fullName: fullName,
                  phoneNumber: phoneNumber,
                ));
                Helper.nextScreen(context, Home());
              },
            ),
            SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
