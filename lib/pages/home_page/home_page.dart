import 'package:flutter/material.dart';
import 'package:home_mentor/pages/subject_home/subject_home_provider.dart';
import 'package:home_mentor/services/subject_service.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> _subjects = [];

  @override
  void initState() {
    super.initState();
    _loadSubjects();
  }

  void _loadSubjects() async {
    List<Map<String, dynamic>> subjects = await subjectServiceGetSubjects();
    setState(() {
      _subjects = subjects;
    });
  }

  void _createSubject() async {
    TextEditingController subjectController = TextEditingController();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Create New Subject'),
          content: TextField(
            controller: subjectController,
            decoration: const InputDecoration(hintText: 'Enter subject name'),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Create'),
              onPressed: () async {
                String subjectName = subjectController.text;
                if (subjectName.isNotEmpty) {
                  await subjectServiceCreateSubject(subjectName);
                  if (context.mounted) {
                    Navigator.of(context).pop();
                  }
                  _loadSubjects(); // Reload subjects after creating a new one
                }
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Mentor'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_subjects.isEmpty) const Text('Welcome to HomeMentor!'),
            Expanded(
              child: ListView.builder(
                itemCount: _subjects.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(Icons.book, color: Colors.blue),
                    title: Text(
                      _subjects[index]['name'],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('Subject ID: ${_subjects[index]['id']}'),
                    trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey),
                    onTap: () {
                      SubjectHomeProvider subjectHomeProvider =
                          Provider.of<SubjectHomeProvider>(context,
                              listen: false);
                      subjectHomeProvider.setCurrentSubject(_subjects[index]);
                      Navigator.of(context).pushNamed('/subject');
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _createSubject,
        child: const Icon(Icons.add),
      ),
    );
  }
}
