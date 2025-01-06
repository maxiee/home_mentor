import 'package:flutter/material.dart';
import 'package:home_mentor/pages/subject_home/subject_home_provider.dart';
import 'package:home_mentor/services/subject_service.dart';
import 'package:provider/provider.dart';

class SubjectPromptListPage extends StatefulWidget {
  const SubjectPromptListPage({super.key});

  @override
  State<SubjectPromptListPage> createState() => _SubjectPromptListPageState();
}

class _SubjectPromptListPageState extends State<SubjectPromptListPage> {
  List<Map<String, dynamic>> prompts = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchPrompts();
  }

  Future<void> _fetchPrompts() async {
    final fetchedPrompts = await subjectServiceGetPrompts(
      Provider.of<SubjectHomeProvider>(context, listen: false)
          .currentSubject!['id'],
    );
    setState(() {
      prompts = fetchedPrompts;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prompts'),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: prompts.length,
              itemBuilder: (context, index) {
                final prompt = prompts[index];
                return ListTile(
                  title: Text(prompt['name']),
                  subtitle: Text(prompt['prompt']),
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      '/subject_prompt_detail',
                      arguments: prompt,
                    );
                  },
                );
              },
            ),
    );
  }
}
