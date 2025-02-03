import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:purveshxdev/firebase_options.dart';
import 'package:purveshxdev/homepage.dart';
import 'package:purveshxdev/providers/firebase_provider.dart';
import 'package:purveshxdev/utils/routes.dart';

final firebaseProvider = FirebaseProvider();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await firebaseProvider.getData();


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
        useMaterial3: true,
        brightness: Brightness.dark,
        primarySwatch: Colors.indigo,
      ),
      initialRoute: RouteName.HOMEPAGE,
      routes: Routes.webRoutes,
      onGenerateInitialRoutes: (initialRoute) {
        return [
          MaterialPageRoute(
            builder: (context) => Homepage(),
          ),
        ];
      },
    );
  }
}
