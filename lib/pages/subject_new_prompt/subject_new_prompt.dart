import 'package:flutter/material.dart';
import 'package:flutter_code_editor/flutter_code_editor.dart';

class SubjectNewPromptPage extends StatefulWidget {
  const SubjectNewPromptPage({super.key});

  @override
  State<SubjectNewPromptPage> createState() => _SubjectNewPromptPageState();
}

class _SubjectNewPromptPageState extends State<SubjectNewPromptPage> {
  final controller = TextEditingController(
    text: '',
  );
  final TextEditingController nameController =
      TextEditingController(); // New controller for the input field

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('新 Prompt'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Prompt 名称',
                border: OutlineInputBorder(),
              ),
              style: const TextStyle(color: Colors.black),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                labelText: 'Prompt 内容',
                border: OutlineInputBorder(),
              ),
              maxLines: 8, // Set default number of lines to 8
            ),
          ],
        ),
      ),
    );
  }
}
