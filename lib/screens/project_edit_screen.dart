import 'package:flutter/material.dart';

class ProjectEditScreen extends StatelessWidget {
  const ProjectEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final descController = TextEditingController();
    final linkController = TextEditingController();
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
            child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 300),
          child: Column(
            children: [
              TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter password",
                ),
                controller: nameController,
              ),
              const SizedBox(height: 10),
              TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter password",
                ),
                controller: descController,
              ),
              const SizedBox(height: 10),
              TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter password",
                ),
                controller: linkController,
              ),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white30,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.all(10),
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.start,
                  runSpacing: 8,
                  spacing: 4,
                  children: [
                    for (var i = 0; i < 5; i++)
                      InputChip(
                          isEnabled: true,
                          onPressed: () {},
                          
                          padding: EdgeInsets.symmetric(horizontal: 2),
                          shape: StadiumBorder(),
                          elevation: 0,
                          side: BorderSide.none,
                          label: Text(
                            "Flutter",
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.tealAccent,
                                fontWeight: FontWeight.bold),
                          ),
                          backgroundColor: Color.fromARGB(113, 47, 112, 132))
                  ],
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
