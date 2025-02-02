import 'package:flutter/material.dart';
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
    // if (resumeImageData == null) {
    //   return const Center(
    //     child: CircularProgressIndicator(),
    //   );
    // }

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
              height: MediaQuery.sizeOf(context).height / 1.25,
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          "assets/Purvesh-Dongarwar-Resume-Image.png")),
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
