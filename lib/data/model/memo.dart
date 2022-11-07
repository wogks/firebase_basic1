class Memo {
  final String title;
  final String body;
  final String uid;

  Memo({required this.title, required this.body, required this.uid});

  Memo.fromJson(Map<String, dynamic> json)
      : this(
        uid: json['uid']! as String,
          title: json['title']! as String,
          body: json['body']! as String,
        );

   Map<String, Object?> toJson() {
    return {
      'uid' : uid,
      'title': title,
      'body': body,
    };
  }
}
