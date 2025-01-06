import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
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
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(
                  controller: _controller1,
                  decoration: const InputDecoration(
                    labelText: '\$1',
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 2,
                  style: const TextStyle(color: Colors.black),
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.multiline,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // 按钮：手动粘贴至 LLM 网站进行询问
                      ElevatedButton(
                        onPressed: () {
                          // submit
                          final wholePrompt =
                              finalPrompt.replaceAll('\$1', _controller1.text);
                          // copy to clipboard
                          Clipboard.setData(ClipboardData(text: wholePrompt));
                          // show snackbar
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Copied to clipboard'),
                            ),
                          );
                        },
                        child: const Text('手动粘贴至 LLM 网站询问'),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      // 按钮：自动调用 OpenAPI 接口进行询问（花钱）
                      // 创建一个空按钮，接口调用先空着
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('自动调用 AI 接口询问'),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
