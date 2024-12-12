import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';

class ResumeComponent extends StatefulWidget {
  const ResumeComponent({super.key});

  @override
  State<ResumeComponent> createState() => _ResumeComponentState();
}

class _ResumeComponentState extends State<ResumeComponent> {
  PdfController? controller;

  @override
  void initState() {
    super.initState();
    _loadPdf();
  }

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
  Widget build(BuildContext context) {
    if (controller == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return SizedBox(
      width: 300,
      height: MediaQuery.sizeOf(context).height,
      child: PdfView(
        renderer: (PdfPage page) => page.render(
          width: MediaQuery.sizeOf(context).width * 2,
          height: MediaQuery.sizeOf(context).height * 2,
          format: PdfPageImageFormat.png,
          backgroundColor: '#FFFFFF',
        ),
        controller: controller!,
        onDocumentLoaded: (document) {
          log("PDF loaded with ${document.pagesCount} pages.");
        },
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
