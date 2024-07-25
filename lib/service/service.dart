import 'package:flutter/material.dart';
import 'package:form_with_supabase/main.dart';
import 'package:form_with_supabase/model/questionsModel.dart';
import 'package:form_with_supabase/model/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

abstract class CoreService {
  Future<Questionsmodel> getQuestions();
  Future<bool> addUser(UserModel user);
}

class ServicesImp implements CoreService {
  @override
  Future<bool> addUser(UserModel user) async {
    var newUser = await supabase
        .from("users")
        .insert({"name": user.name, "type": user.type}).select();

    // final data =
    //     await supabase.from('user').select('*').eq('name', user.name).select();
    // userId = data[0]['id'];
    // print(userId);
    // type = data[0]['type'];
    // var id = await supabase.from("questions").insert({"user_id": userId});

    return true;
  }

  @override
  Future<Questionsmodel> getQuestions() async {
    final data = await supabase
        .from('questions')
        .select('*')
        .eq("type", type.toString())
        .select();
    List que = data[0]['questions'];
    Questionsmodel question = Questionsmodel(questions: que);
    print(que);

    return question;
  }
}
