// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
 
  String name;
  String type;
  UserModel({
    
    required this.name,
    required this.type,
  });

  UserModel copyWith({
    int? id,
    String? name,
    String? type,
  }) {
    return UserModel(
      
      name: name ?? this.name,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
     
      'name': name,
      'type': type,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      
      name: map['name'] as String,
      type: map['type'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'UserModel(name: $name, type: $type)';

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;
  
    return 
      
      other.name == name &&
      other.type == type;
  }

  @override
  int get hashCode => name.hashCode ^ type.hashCode;
}
