import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_with_supabase/config/local_notification.dart';
import 'package:form_with_supabase/view/questions_page.dart';
import 'package:form_with_supabase/view/signup_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalNotification.initialize();
  await Supabase.initialize(
      url: 'https://asdxpoyjgglipkfovapj.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFzZHhwb3lqZ2dsaXBrZm92YXBqIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjA3ODM3NDYsImV4cCI6MjAzNjM1OTc0Nn0.t8If0fSVDO_VsLoFsBUjLM3sceGZ4_Mfz7MiqtqdQBg');
  runApp(ProviderScope(child: MyApp()));
}


final supabase = Supabase.instance.client;
//int? userId;
String? type;

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignupPage(),
    );
  }
}
