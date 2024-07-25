import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_with_supabase/model/questionsModel.dart';
import 'package:form_with_supabase/service/service.dart';

final getQuestions = FutureProvider<Questionsmodel>((ref) {
  return ref.read(service).getQuestions();
});
final service = StateProvider<ServicesImp>((ref) {
  return ServicesImp();
});
