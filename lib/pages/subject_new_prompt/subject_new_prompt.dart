import 'package:flutter/material.dart';
import 'package:home_mentor/pages/subject_home/subject_home_provider.dart';
import 'package:home_mentor/services/subject_service.dart';
import 'package:provider/provider.dart';

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Text('关联 Subject: ' +
                Provider.of<SubjectHomeProvider>(context)
                    .currentSubject?['name']),
            SizedBox(
              height: 20,
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
            SizedBox(
              height: 20,
            ),
            Text("\"\$background\" 表示在此处嵌入背景内容。"),
            Text("\"\$1\"、\"\$2\"…… 表示未来用户动态输入的内容。"),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Handle saving the new prompt
          String name = nameController.text;
          String content = controller.text;
          if (name.isNotEmpty && content.isNotEmpty) {
            subjectServiceAddPrompt(
                Provider.of<SubjectHomeProvider>(context, listen: false)
                    .currentSubject?['id'],
                name,
                content);
            if (context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('保存成功')),
              );
            }
            Navigator.of(context).pop();
          }
        },
        child: const Icon(Icons.save),
      ),
    );
  }
}
