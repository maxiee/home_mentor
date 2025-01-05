import 'package:flutter/material.dart';

class SubjectHome extends StatefulWidget {
  const SubjectHome({super.key});

  @override
  State<SubjectHome> createState() => _SubjectHomeState();
}

class _SubjectHomeState extends State<SubjectHome> {
  late final Map<String, dynamic> subject;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    subject =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(subject['name']),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('问答历史'),
            onTap: () {
              // Handle navigation to 问答历史
            },
          ),
          ListTile(
            title: const Text('Prompt 列表'),
            onTap: () {
              // Handle navigation to Prompt 列表
            },
          ),
          ListTile(
            title: const Text('新 Prompt'),
            onTap: () {
              // Handle navigation to 新 Prompt
            },
          ),
          ListTile(
            title: const Text('编写背景'),
            onTap: () {
              // Handle navigation to 编写背景
            },
          ),
        ],
      ),
    );
  }
}
