import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_quill/quill_delta.dart';
import 'package:home_mentor/pages/subject_home/subject_home_provider.dart';
import 'package:markdown_quill/markdown_quill.dart';
import 'package:provider/provider.dart';

class SubjectPromptDetailPage extends StatefulWidget {
  const SubjectPromptDetailPage({super.key});

  @override
  State<SubjectPromptDetailPage> createState() =>
      _SubjectPromptDetailPageState();
}

class _SubjectPromptDetailPageState extends State<SubjectPromptDetailPage> {
  String? promptName;
  String? prompt;

  String finalPrompt = '';

  final _controller1 = TextEditingController();
  final deltaToMd = DeltaToMarkdown();

  @override
  void dispose() {
    super.dispose();
    _controller1.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    promptName = args['name'];
    prompt = args['prompt'];

    final currentSubject =
        Provider.of<SubjectHomeProvider>(context, listen: false).currentSubject;
    if (currentSubject != null) {
      finalPrompt = prompt!.replaceAll(
        '\$background',
        deltaToMd
            .convert(Delta.fromJson(jsonDecode(currentSubject['background']))),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(promptName!),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Text('Prompt: '),
            Text(finalPrompt),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: _controller1,
              decoration: const InputDecoration(
                labelText: '\$1',
                border: OutlineInputBorder(),
              ),
              maxLines: 8,
              readOnly: true,
              style: const TextStyle(color: Colors.black),
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.multiline,
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
