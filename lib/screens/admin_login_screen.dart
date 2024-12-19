import 'package:flutter/material.dart';
import 'package:purveshxdev/main.dart';
import 'package:purveshxdev/screens/project_edit_screen.dart';

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
              isLoading
                  ? const CircularProgressIndicator()
                  : FilledButton.tonal(
                      onPressed: () async {
                        setState(() {
                          isLoading = true;
                        });
                        bool isCorrect = firebaseProvider.login(
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
                                builder: (context) =>
                                    const ProjectEditScreen()),
                            (route) => isCorrect,
                          );
                        }
                        setState(() {
                          isLoading = false;
                        });
                      },
                      child: const Text("Login"),
                    )
            ],
          ),
        )),
      ),
    );
  }
}
