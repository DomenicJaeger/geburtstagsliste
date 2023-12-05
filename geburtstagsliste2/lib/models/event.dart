class Event {
  // The title of the event.
  final String title;
  // The date of the event.
  final DateTime date;
  // The ID of the subject to whom the event is associated.
  final String subjectId;
  // The ID if the event to identify it
  final String? eventId;

  Event({
    required this.title,
    required this.date,
    required this.subjectId,
    this.eventId,
  });

  // Creates a copy of the event with the given updates.
  Event copyWith({
    String? title,
    DateTime? date,
    String? subjectId,
    String? eventId,
  }) =>
      Event(
        title: title ?? this.title,
        date: date ?? this.date,
        subjectId: subjectId ?? this.subjectId,
        eventId: eventId ?? this.eventId,
      );

  // Converts the event to a JSON object.
  Map<String, dynamic> toJson() => {
        'title': title,
        'date': date.toIso8601String(),
        'subjectId': subjectId,
        'eventId': eventId,
      };

  // Creates a new event from a JSON object.
  factory Event.fromJson(Map<String, dynamic> json) => Event(
        title: json['title'],
        date: DateTime.parse(json['date']),
        subjectId: json['subjectId'],
        eventId: json['eventId'],
      );
}
