import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';
import 'package:purveshxdev/main.dart';

class ResumeComponent extends StatelessWidget {
  const ResumeComponent({super.key});

  // PdfController? controller;
  @override
  Widget build(BuildContext context) {
    if (controller == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return SizedBox(
      height: MediaQuery.sizeOf(context).height,
      child: Padding(
        padding: const EdgeInsets.only(top: 30, bottom: 30),
        child: PdfView(
          renderer: (PdfPage page) => page.render(
            quality: 100,
            width: MediaQuery.sizeOf(context).width * 2,
            height: MediaQuery.sizeOf(context).height * 2,
            format: PdfPageImageFormat.png,
            forPrint: true,
          ),
          controller: controller!,
          onDocumentLoaded: (document) {
            log("PDF loaded with ${document.pagesCount} pages.");
          },
        ),
      ),
    );
  }
}


// class GetDocument {
//   final url = Uri.parse(
//       "https://drive.usercontent.google.com/download?id=1PQMwKtVOhmG9H6LKqBBMRdG0D4EqsgAP&export=download&authuser=0");

//   Future<Uint8List> getDocument() async {
//     try {
//       final response = await http.get(url);
//       if (response.statusCode == 200) {
//         return response.bodyBytes;
//       } else {
//         throw Exception("Failed to load PDF: ${response.statusCode}");
//       }
//     } catch (e) {
//       log("Error fetching PDF: $e");
//       throw e;
//     }
//   }
// }
