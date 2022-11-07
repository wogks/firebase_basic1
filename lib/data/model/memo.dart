class Memo {
  final String title;
  final String body;

  Memo({required this.title, required this.body});

  Memo.fromjson(Map<String, dynamic> json)
      : this(
          title: json['title']! as String,
          body: json['body']! as String,
        );

  toJson() {}
}
