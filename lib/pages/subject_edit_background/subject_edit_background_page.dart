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
    if (Provider.of<SubjectHomeProvider>(context, listen: false)
            .currentSubject?['background'] !=
        null) {
      _controller.document = Document.fromJson(jsonDecode(
          Provider.of<SubjectHomeProvider>(context, listen: false)
              .currentSubject?['background']));
    }
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final shouldPop = await showDialog<bool>(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('确认返回'),
              content: const Text('你确定要返回吗？未保存的更改将会丢失。'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text('取消'),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: const Text('确定'),
                ),
              ],
            );
          },
        );
        return shouldPop ?? false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('编写背景'),
        ),
        body: Column(
          children: [
            QuillSimpleToolbar(
              controller: _controller,
              configurations: const QuillSimpleToolbarConfigurations(),
            ),
            Expanded(
                child: QuillEditor.basic(
                    controller: _controller,
                    configurations: QuillEditorConfigurations(
                      expands: true,
                      // customStyles: DefaultStyles.getInstance(context).merge(
                      //   DefaultStyles(
                      //       h1: DefaultTextBlockStyle(
                      //           TextStyle(
                      //               fontSize: 34,
                      //               fontWeight: FontWeight.bold,
                      //               height: 1.4),
                      //           HorizontalSpacing(0, 0),
                      //           VerticalSpacing(16, 8),
                      //           VerticalSpacing.zero,
                      //           null)),
                      // ),
                    )))
          ],
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () async {
              // Save the background
              await Provider.of<SubjectHomeProvider>(context, listen: false)
                  .updateBackground(
                      jsonEncode(_controller.document.toDelta().toJson()));
              // Show success message
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('保存成功')),
                );
              }
            },
            child: const Icon(Icons.save)),
      ),
    );
  }
}
