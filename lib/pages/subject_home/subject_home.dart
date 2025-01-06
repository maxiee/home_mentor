import 'package:flutter/material.dart';
import 'package:home_mentor/pages/subject_home/subject_home_provider.dart';
import 'package:provider/provider.dart';

class SubjectHome extends StatefulWidget {
  const SubjectHome({super.key});

  @override
  State<SubjectHome> createState() => _SubjectHomeState();
}

class _SubjectHomeState extends State<SubjectHome> {
  @override
  Widget build(BuildContext context) {
    SubjectHomeProvider subjectHomeProvider =
        Provider.of<SubjectHomeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(subjectHomeProvider.currentSubject?['name'] ?? ""),
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
              Navigator.of(context).pushNamed('/subject_prompt_list');
            },
          ),
          ListTile(
            title: const Text('新 Prompt'),
            onTap: () {
              Navigator.of(context).pushNamed('/subject_new_prompt');
            },
          ),
          ListTile(
            title: const Text('编写背景'),
            onTap: () {
              Navigator.of(context).pushNamed('/subject_edit_background',
                  arguments:
                      subjectHomeProvider.currentSubject?['background'] ?? "");
            },
          ),
        ],
      ),
    );
  }
}
