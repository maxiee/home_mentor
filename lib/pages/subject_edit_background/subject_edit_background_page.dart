import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

class SubjectEditBackgroundPage extends StatefulWidget {
  const SubjectEditBackgroundPage({super.key});

  @override
  State<SubjectEditBackgroundPage> createState() =>
      _SubjectEditBackgroundPageState();
}

class _SubjectEditBackgroundPageState extends State<SubjectEditBackgroundPage> {
  final _controller = QuillController.basic();

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
    );
  }
}
