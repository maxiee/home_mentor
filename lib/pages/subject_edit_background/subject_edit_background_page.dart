import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:home_mentor/pages/subject_home/subject_home_provider.dart';
import 'package:provider/provider.dart';

class SubjectEditBackgroundPage extends StatefulWidget {
  const SubjectEditBackgroundPage({super.key});

  @override
  State<SubjectEditBackgroundPage> createState() =>
      _SubjectEditBackgroundPageState();
}

class _SubjectEditBackgroundPageState extends State<SubjectEditBackgroundPage> {
  final _controller = QuillController.basic();

  @override
  void initState() {
    super.initState();
    _controller.document = Document.fromJson(jsonDecode(
        Provider.of<SubjectHomeProvider>(context, listen: false)
            .currentSubject?['background']));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('编写背景'),
      ),
      body: Center(
        child: Column(
          children: [
            QuillSimpleToolbar(
              controller: _controller,
              configurations: const QuillSimpleToolbarConfigurations(),
            ),
            Expanded(
              child: QuillEditor.basic(
                controller: _controller,
                configurations: const QuillEditorConfigurations(),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Save the background
            Provider.of<SubjectHomeProvider>(context, listen: false)
                .updateBackground(
                    jsonEncode(_controller.document.toDelta().toJson()));
          },
          child: const Icon(Icons.save)),
    );
  }
}
