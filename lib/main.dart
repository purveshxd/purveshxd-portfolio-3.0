import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pdfx/pdfx.dart';
import 'package:purveshxdev/firebase_options.dart';
import 'package:purveshxdev/screens/project_edit_screen.dart';

PdfController? controller;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //loads the pdf
  Future<void> _loadPdf() async {
    try {
      setState(() {
        controller = PdfController(
          document: PdfDocument.openAsset("purveshxd-resume.pdf"),
        );
      });
    } catch (e) {
      log("Error loading PDF: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    _loadPdf();
  }

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
      home: ProjectEditScreen(),
      // initialRoute: RouteName.HOMEPAGE,
      // routes: Routes().webRoutes,
    );
  }
}
