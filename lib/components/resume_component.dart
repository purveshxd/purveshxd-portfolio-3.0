import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';
import 'package:purveshxdev/main.dart';
import 'package:url_launcher/url_launcher.dart';

class ResumeComponent extends StatefulWidget {
  const ResumeComponent({super.key});

  @override
  State<ResumeComponent> createState() => _ResumeComponentState();
}

class _ResumeComponentState extends State<ResumeComponent> {
  bool isHovering = false;
  // PdfController? controller;
  @override
  Widget build(BuildContext context) {
    if (controller == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return GestureDetector(
      onTap: () => launchUrl(Uri.parse(
          "https://drive.google.com/file/d/1PQMwKtVOhmG9H6LKqBBMRdG0D4EqsgAP/view")),
      child: FocusableActionDetector(
        onShowHoverHighlight: (value) {
          setState(() {
            isHovering = value;
          });
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
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
            ),
            AnimatedContainer(
              duration: Durations.short4,
              padding: const EdgeInsets.all(15),
              curve: Curves.easeOut,
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: isHovering
                    ? Border.all(
                        color: Colors.black12,
                        width: 2,
                      )
                    : null,
                borderRadius: BorderRadius.circular(12),
                color: isHovering ? Colors.black38 : Colors.transparent,
              ),
              child: Text(
                "View",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: isHovering ? Colors.tealAccent : Colors.white),
              ),
            ),
          ],
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
