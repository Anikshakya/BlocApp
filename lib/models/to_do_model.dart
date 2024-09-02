class ToDoModel {
  final String title;
  final DateTime date;
  final bool isFav;

  ToDoModel({required this.title, required this.date, this.isFav = false});

  ToDoModel copyWith({String? title, DateTime? date, bool? isFav}) {
    return ToDoModel(
      title: title ?? this.title,
      date: date ?? this.date,
      isFav: isFav ?? this.isFav,
    );
  }
}
