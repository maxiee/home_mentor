import 'package:flutter/material.dart';
import 'package:home_mentor/pages/home_page/home_page.dart';
import 'package:home_mentor/pages/login/login_page.dart';
import 'package:home_mentor/pages/subject_edit_background/subject_edit_background_page.dart';
import 'package:home_mentor/pages/subject_home/subject_home.dart';
import 'package:home_mentor/pages/subject_home/subject_home_provider.dart';
import 'package:home_mentor/pages/subject_new_prompt/subject_new_prompt.dart';
import 'package:home_mentor/pages/subject_prompt_list/subject_prompt_list.dart';
import 'package:home_mentor/services/supabase_service.dart';
import 'package:home_mentor/services/user_service.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await supabaseServiceInit();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SubjectHomeProvider())
      ],
      child: MaterialApp(
        title: 'HomeMentor',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routes: {
          '/login': (context) => const LoginPage(),
          '/home': (context) => const HomePage(),
          '/subject': (context) => const SubjectHome(),
          '/subject_edit_background': (context) =>
              const SubjectEditBackgroundPage(),
          '/subject_new_prompt': (context) => const SubjectNewPromptPage(),
          '/subject_prompt_list': (context) => const SubjectPromptListPage(),
        },
        home: const SplashPage(),
      ),
    );
  }
}

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future(() async {
      if (userServiceIsLoggedIn()) {
        // Navigate to home page
        if (mounted) {
          Navigator.of(context).pushReplacementNamed('/home');
        }
      } else {
        // Navigate to login page
        if (mounted) {
          Navigator.of(context).pushReplacementNamed('/login');
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'HomeMentor',
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
            const SizedBox(height: 24),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
