import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pdfx/pdfx.dart';
import 'package:purveshxdev/firebase_options.dart';
import 'package:purveshxdev/homepage.dart';
import 'package:purveshxdev/providers/firebase_provider.dart';
import 'package:purveshxdev/utils/routes.dart';

PdfController? controller;
final firebaseProvider = FirebaseProvider();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await firebaseProvider.getData();

  try {
    controller = PdfController(
      document: PdfDocument.openAsset("purveshxd-resume.pdf"),
    );
  } catch (e) {
    log("Error loading PDF: $e");
  }

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
      // home: Homepage(),
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
