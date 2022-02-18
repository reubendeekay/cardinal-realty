import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:real_estate_ui/screens/home.dart';
import 'package:real_estate_ui/provider/auth_provider.dart';
import 'package:real_estate_ui/utils/helper.dart';
import 'package:real_estate_ui/widgets/input_widget.dart';
import 'package:real_estate_ui/widgets/primary_button.dart';

class LoginForm extends StatefulWidget {
  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  String _email = '';
  String _password = '';
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            InputWidget(
              hintText: "Email Address",
              onChanged: (val) {
                setState(() {
                  _email = val;
                });
              },
              prefixIcon: FlutterIcons.mail_ant,
            ),
            SizedBox(height: 15.0),
            InputWidget(
              hintText: "Password",
              onChanged: (val) {
                setState(() {
                  _password = val;
                });
              },
              prefixIcon: FlutterIcons.lock_ant,
            ),
            SizedBox(height: 25.0),

            //LOGIN BUTTON
            PrimaryButton(
              text: "Login",
              onPressed: () async {
                await Provider.of<AuthProvider>(context, listen: false)
                    .signIn(_email, _password);
                Helper.nextScreen(context, Home());
              },
            ),
            SizedBox(height: 10.0),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "Reset Password",
                ),
              ),
            ),
            SizedBox(height: 20.0),
            // Row(
            //   children: <Widget>[
            //     Expanded(child: Divider()),
            //     Padding(
            //       padding: const EdgeInsets.all(12.0),
            //       child: Text(
            //         "OR",
            //         style: TextStyle(),
            //       ),
            //     ),
            //     Expanded(child: Divider()),
            //   ],
            // ),
            // SizedBox(
            //   height: 15.0,
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     GestureDetector(
            //       onTap: () {},
            //       child: Container(
            //         padding: EdgeInsets.symmetric(horizontal: 14.0),
            //         height: ScreenUtil().setHeight(53.0),
            //         width: 150.0,
            //         decoration: BoxDecoration(
            //           color: Colors.white,
            //         ),
            //         child: Row(
            //           children: [
            //             SvgPicture.asset(
            //               "assets/svg/google.svg",
            //               width: 30.0,
            //             ),
            //             SizedBox(
            //               width: 10.0,
            //             ),
            //             Text(
            //               "Google",
            //               style: TextStyle(
            //                 color: Color.fromRGBO(105, 108, 121, 1),
            //               ),
            //             )
            //           ],
            //         ),
            //       ),
            //     ),
            //     SizedBox(
            //       width: 10.0,
            //     ),
            //     GestureDetector(
            //       onTap: () {},
            //       child: Container(
            //         padding: EdgeInsets.symmetric(horizontal: 14.0),
            //         height: ScreenUtil().setHeight(53.0),
            //         width: 150.0,
            //         decoration: BoxDecoration(
            //           color: Colors.white,
            //         ),
            //         child: Row(
            //           children: [
            //             SvgPicture.asset(
            //               "assets/svg/facebook.svg",
            //               width: 30.0,
            //             ),
            //             SizedBox(
            //               width: 10.0,
            //             ),
            //             Text(
            //               "Facebook",
            //               style: TextStyle(
            //                 color: Color.fromRGBO(105, 108, 121, 1),
            //               ),
            //             )
            //           ],
            //         ),
            //       ),
            //     )
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
