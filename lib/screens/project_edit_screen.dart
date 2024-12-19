import 'dart:developer';

import 'package:flutter/material.dart';

class ProjectEditScreen extends StatefulWidget {
  const ProjectEditScreen({super.key});

  @override
  State<ProjectEditScreen> createState() => _ProjectEditScreenState();
}

class _ProjectEditScreenState extends State<ProjectEditScreen> {
  Set<String> tags = {};
  final nameController = TextEditingController();
  final descController = TextEditingController();
  final linkController = TextEditingController();
  final tagsController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
            child: ConstrainedBox(
          constraints:
              BoxConstraints(maxWidth: MediaQuery.sizeOf(context).width - 300),
          child: Column(
            children: [
              TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter Project Title",
                ),
                controller: nameController,
              ),
              const SizedBox(height: 10),
              TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter description",
                ),
                controller: descController,
              ),
              const SizedBox(height: 10),
              TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter project link",
                ),
                controller: linkController,
              ),
              const SizedBox(height: 10),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text("Add project tags"),
              ),
              const SizedBox(height: 10),
              TextField(
                onChanged: (value) {
                  if (value.contains(',')) {
                    if (value[value.length - 1] == ',') {
                      var data = value.split(',');
                      var listTemp = data.map((e) => e.trim()).toSet();
                      log(listTemp.toString());
                      tags = listTemp;
                    }
                  }
                  if (tagsController.text == '') {
                    tags.clear();
                  }
                  setState(() {});
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter project tags seperated by commas",
                ),
                controller: tagsController,
              ),
              const SizedBox(height: 10),
              tags.isEmpty
                  ? const SizedBox()
                  : Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white30,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.all(10),
                      child: Wrap(
                        crossAxisAlignment: WrapCrossAlignment.start,
                        runSpacing: 8,
                        spacing: 4,
                        children: [
                          for (var i = 0; i < tags.length; i++)
                            tags.elementAt(i) == ''
                                ? const SizedBox()
                                : InputChip(
                                    isEnabled: true,
                                    onPressed: () {},
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 2),
                                    shape: const StadiumBorder(),
                                    elevation: 0,
                                    side: BorderSide.none,
                                    label: Text(
                                      tags.elementAt(i),
                                      style: const TextStyle(
                                          fontSize: 12,
                                          color: Colors.tealAccent,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    backgroundColor:
                                        const Color.fromARGB(113, 47, 112, 132))
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
