import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_with_supabase/main.dart';
import 'package:form_with_supabase/model/user_model.dart';
import 'package:form_with_supabase/provider/provider.dart';
import 'package:form_with_supabase/view/questions_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignupPage extends ConsumerWidget {
  SignupPage({super.key});
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController typeControl = TextEditingController();
  TextEditingController age = TextEditingController();

 // String names = '';
  //String types = '';

  final stream = supabase.from("users").stream(primaryKey: ['id']);

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: const Color.fromARGB(255, 226, 187, 233),
      // ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "What's your name",
                style: TextStyle(color: Colors.purple, fontSize: 20),
              ),
            ),
          ),
          TextField(
            onSubmitted: (value) async {
            String  names = value;
            },
            controller: name,
            decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                fillColor: Color.fromARGB(255, 201, 165, 177),
                filled: true),
          ),
          const Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "what's your email",
                style: TextStyle(color: Colors.purple, fontSize: 20),
              ),
            ),
          ),
          TextField(
            controller: email,
            decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                fillColor: Color.fromARGB(255, 211, 169, 183),
                filled: true),
          ),
          const Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "how old are you?",
                style: TextStyle(color: Colors.purple, fontSize: 20),
              ),
            ),
          ),
          TextField(
            controller: age,
            decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                fillColor: Color.fromARGB(255, 221, 183, 195),
                filled: true),
          ),
          const Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "what's your educational status: engineer/teacher/doctor?",
                style: TextStyle(color: Colors.purple, fontSize: 20),
              ),
            ),
          ),
          TextField(
            onSubmitted: (value) async {
             String types = value;
            },
            controller: typeControl,
            decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                fillColor: Color.fromARGB(255, 233, 198, 210),
                filled: true),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton(
                child: const Center(
                    child: Center(
                        child: Text(
                  "Done",
                  style: TextStyle(color: Colors.green, fontSize: 20),
                ))),
                onPressed: () async {
                  type = typeControl.text;
                  UserModel user =
                      UserModel(name: name.text, type: typeControl.text);
                  ref.read(service).addUser(user);
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: MaterialButton(
                height: 50,
                child: const Text("Questions",
                    style: TextStyle(
                      color: Colors.purple,
                    )),
                color: const Color.fromARGB(255, 219, 161, 180),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => QuestionsPage()));
                }),
          ),
        ],
      ),
    );
  }
}
