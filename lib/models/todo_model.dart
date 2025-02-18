class TodoModel {
  TodoModel({
   required this.title,
  required  this.createdAt,
    this.isCompleted = false,
  });


  final String title;
  final String createdAt;
   bool isCompleted;

  Map<String, dynamic> toJson() => {
    'title': title,
    'createdAt':createdAt,
   'isCompleted': isCompleted,
  };

  factory TodoModel.fromJson(Map<String, dynamic> json){
    return TodoModel(title: json['title'], createdAt: json['createdAt'],isCompleted: json['isCompleted']);
  }
  @override
  String toString() {
    return 'TodoModel{title: $title, createdAt: $createdAt, isCompleted: $isCompleted}\n';
  }
}
