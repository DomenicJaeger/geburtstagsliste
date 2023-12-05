class Subject {
  final String id;
  final String name;
  final String? image;

  Subject({
    required this.id,
    required this.name,
    this.image = 'assets/images/default_avatar_1.png',
  });

  // Creates a copy of the subject with the given updates.
  Subject copyWith({
    String? id,
    String? name,
  }) =>
      Subject(
        id: id ?? this.id,
        name: name ?? this.name,
      );

  // Converts the subject to a JSON object.
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };

  // Creates a new subject from a JSON object.
  factory Subject.fromJson(Map<String, dynamic> json) => Subject(
        id: json['id'],
        name: json['name'],
      );

  @override
  int get hashCode => Object.hash(id, name);

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != Subject) return false;
    if (id != (other as Subject).id) return false;
    if (name != other.name) return false;
    return true; // if all comparisons are true, the objects are considered equal
  }
}
