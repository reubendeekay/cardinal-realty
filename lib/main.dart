import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:real_estate_ui/firebase_options.dart';
import 'package:real_estate_ui/screens/authentication.dart';
import 'package:real_estate_ui/screens/filters.dart';
import 'package:real_estate_ui/screens/home.dart';
import 'package:real_estate_ui/screens/search_result.dart';
import 'package:real_estate_ui/screens/welcome.dart';
import 'package:real_estate_ui/provider/auth_provider.dart';
import 'package:real_estate_ui/provider/property_provider.dart';
import 'package:real_estate_ui/utils/constants.dart';
import 'package:real_estate_ui/widgets/bottom_bar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: () => MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: AuthProvider()),
          ChangeNotifierProvider.value(value: PropertyProvider()),
        ],
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Cardinal Realty',
          theme: ThemeData(
            primaryColor: Constants.primaryColor,
            scaffoldBackgroundColor: Color.fromRGBO(247, 249, 255, 1),
            visualDensity: VisualDensity.adaptivePlatformDensity,
            textTheme: GoogleFonts.poppinsTextTheme(),
          ),
          home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (ctx, data) =>
                data.hasData ? BottomBar() : Authentication(),
          ),
          // initialRoute:  "/authentication",
          onGenerateRoute: _onGenerateRoute,
        ),
      ),
    );
  }
}

Route<dynamic> _onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case "/":
      return MaterialPageRoute(builder: (BuildContext context) {
        return Home();
      });
    case "/welcome":
      return MaterialPageRoute(builder: (BuildContext context) {
        return Welcome();
      });
    case "/authentication":
      return MaterialPageRoute(builder: (BuildContext context) {
        return Authentication();
      });
    case "/search-result":
      return MaterialPageRoute(builder: (BuildContext context) {
        return SearchResult();
      });

    case "/filters":
      return MaterialPageRoute(builder: (BuildContext context) {
        return Filters();
      });
    default:
      return MaterialPageRoute(builder: (BuildContext context) {
        return Home();
      });
  }
}
