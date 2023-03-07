import 'dart:convert';

class PollModel {
  final int id;
  final String title;
  final String description;
  final bool voted;
  final List<String>? options;
  final List<int>? votes;
  PollModel({
    required this.id,
    required this.title,
    required this.description,
    required this.voted,
    this.options,
    this.votes,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'title': title});
    result.addAll({'description': description});
    result.addAll({'voted': voted});
    if (options != null) {
      result.addAll({'options': options});
    }
    if (votes != null) {
      result.addAll({'votes': votes});
    }

    return result;
  }

  factory PollModel.fromMap(Map<String, dynamic> map) {
    return PollModel(
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      voted: map['voted'] ?? false,
      options: map['options'] != null ? List<String>.from(map['options']) : [],
      votes: map['votes'] != null ? List<int>.from(map['votes']) : [],
    );
  }

  String toJson() => json.encode(toMap());

  factory PollModel.fromJson(String source) => PollModel.fromMap(json.decode(source));

  PollModel copyWith({
    int? id,
    String? title,
    String? description,
    bool? voted,
    List<String>? options,
    List<int>? votes,
  }) {
    return PollModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      voted: voted ?? this.voted,
      options: options ?? this.options,
      votes: votes ?? this.votes,
    );
  }
}
