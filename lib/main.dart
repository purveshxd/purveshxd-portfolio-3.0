import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:purveshxdev/firebase_options.dart';
import 'package:purveshxdev/homepage.dart';
import 'package:purveshxdev/providers/firebase_provider.dart';
import 'package:purveshxdev/utils/routes.dart';

// PdfController? controller;
// Uint8List? resumeImageData;
final firebaseProvider = FirebaseProvider();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await firebaseProvider.getData();

  // try {
  //   resumeImageData = File.fromUri(Uri.parse(
  //           "https://drive.google.com/uc?export=view&id=1Ln5l2jiYtQBkUsaKUPJA-i-SXi-57hA6"))
  //       .readAsBytesSync();
  // } catch (e) {
  //   log("Error loading Resume: $e");
  // }

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
