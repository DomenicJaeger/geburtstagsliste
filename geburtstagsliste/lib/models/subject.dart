class Subject {
  // A unique identifier for the subject.
  final String id;

  // The name of the subject.
  final String name;

  Subject({
    required this.id,
    required this.name,
  });

  // Creates a copy of the subject with the given updates.
  Subject copyWith({
    String? id,
    String? name,
  }) {
    return Subject(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  // Converts the subject to a JSON object.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }

  // Creates a new subject from a JSON object.
  factory Subject.fromJson(Map<String, dynamic> json) {
    return Subject(
      id: json['id'],
      name: json['name'],
    );
  }

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
