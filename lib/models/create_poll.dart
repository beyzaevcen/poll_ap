import 'dart:convert';

class CreatePoll {
  final String title;
  final String description;
  final List<String>? options;
  CreatePoll({
    required this.title,
    required this.description,
    required this.options,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'title': title});
    result.addAll({'description': description});
    if (options != null) {
      result.addAll({'options': options});
    }

    return result;
  }

  factory CreatePoll.fromMap(Map<String, dynamic> map) {
    return CreatePoll(
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      options: List<String>.from(map['options']),
    );
  }

  String toJson() => json.encode(toMap());

  factory CreatePoll.fromJson(String source) => CreatePoll.fromMap(json.decode(source));
}
