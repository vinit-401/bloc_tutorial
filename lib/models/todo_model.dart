class TodoModel {
  TodoModel({
   required this.title,
  required  this.createdAt,
    this.isCompleted = false,
  });


  final String title;
  final String createdAt;
   bool isCompleted;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = title;
    map['createdAt'] = createdAt;
    map['isCompleted'] = isCompleted;
    return map;
  }

  @override
  String toString() {
    return 'TodoModel{title: $title, createdAt: $createdAt, isCompleted: $isCompleted}\n';
  }
}
