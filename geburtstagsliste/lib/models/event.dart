class Event {
  // The title of the event.
  final String title;
  // The date of the event.
  final DateTime date;
  // The ID of the subject to whom the event is associated.
  final String subjectId;

  Event({
    required this.title,
    required this.date,
    required this.subjectId,
  });

  // Creates a copy of the event with the given updates.
  Event copyWith({
    String? title,
    DateTime? date,
    String? subjectId,
  }) {
    return Event(
      title: title ?? this.title,
      date: date ?? this.date,
      subjectId: subjectId ?? this.subjectId,
    );
  }

  // Converts the event to a JSON object.
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'date': date,
      'subjectId': subjectId,
    };
  }

  // Creates a new event from a JSON object.
  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      title: json['title'],
      date: json['date'],
      subjectId: json['subjectId'],
    );
  }
}
