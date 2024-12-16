import 'package:flutter/material.dart';
import 'package:purveshxdev/providers/firebase_provider.dart';

class AdminLoginScreen extends StatefulWidget {
  const AdminLoginScreen({super.key});

  @override
  State<AdminLoginScreen> createState() => _AdminLoginScreenState();
}

class _AdminLoginScreenState extends State<AdminLoginScreen> {
  bool loggedIn = false;
  bool isLoading = false;
  TextEditingController userNameController = TextEditingController();
  TextEditingController passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
            child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 300),
          child: Column(
            children: [
              TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter user name",
                ),
                controller: userNameController,
              ),
              const SizedBox(height: 10),
              TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter password",
                ),
                controller: passController,
              ),
              const SizedBox(height: 10),
              FilledButton.tonal(
                onPressed: () async {
                  setState(() {
                    isLoading = true;
                  });
                  bool isCorrect = await FirebaseProvider().login(
                      username: userNameController.text.trim(),
                      password: passController.text.trim());
                  setState(() {
                    if (isCorrect) {
                      loggedIn = true;
                    } else {
                      loggedIn = false;
                    }
                  });
                  if (context.mounted) {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const Scaffold();
                        },
                      ),
                      (route) => isCorrect,
                    );
                  }
                  setState(() {
                    isLoading = false;
                  });
                },
                child: isLoading ? CircularProgressIndicator() : Text("Login"),
              )
            ],
          ),
        )),
      ),
    );
  }
}
