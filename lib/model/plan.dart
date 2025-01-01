import 'dart:convert';

class Plan {
  int? id;
  String plan_name;
  DateTime start_time;
  DateTime end_time;
  DateTime? created_at;
  DateTime? modified_at;
  int? fetch_count;
  Plan({
    this.id,
    required this.plan_name,
    required this.start_time,
    required this.end_time,
    this.created_at,
    this.modified_at,
    this.fetch_count,
  });

  Plan copyWith({
    int? id,
    String? plan_name,
    DateTime? start_time,
    DateTime? end_time,
    DateTime? created_at,
    DateTime? modified_at,
    int? fetch_count,
  }) {
    return Plan(
      id: id ?? this.id,
      plan_name: plan_name ?? this.plan_name,
      start_time: start_time ?? this.start_time,
      end_time: end_time ?? this.end_time,
      created_at: created_at ?? this.created_at,
      modified_at: modified_at ?? this.modified_at,
      fetch_count: fetch_count ?? this.fetch_count,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'plan_name': plan_name,
      'start_time': start_time.toIso8601String(),
      'end_time': end_time..toIso8601String(),
    };
  }

  static Plan? fromMap(Map<String, dynamic>? map) {
    if (map == null) return null;
    try {
      return Plan(
        id: map['id'],
        plan_name: map['plan_name'],
        start_time: DateTime.parse(map['start_time']),
        end_time: DateTime.parse(map['end_time']),
        created_at: DateTime.parse(map['created_at']),
        modified_at: DateTime.parse(map['modified_at']),
        fetch_count: map['fetch_count'],
      );
    } catch (e) {
      return null;
    }
  }

  String toJson() => json.encode(toMap());

  static Plan? fromJson(String source) => Plan.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Plan(id: $id, plan_name: $plan_name, start_time: $start_time, end_time: $end_time, created_at: $created_at, modified_at: $modified_at, fetch_count: $fetch_count)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Plan &&
        other.id == id &&
        other.plan_name == plan_name &&
        other.start_time == start_time &&
        other.end_time == end_time &&
        other.created_at == created_at &&
        other.modified_at == modified_at &&
        other.fetch_count == fetch_count;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        plan_name.hashCode ^
        start_time.hashCode ^
        end_time.hashCode ^
        created_at.hashCode ^
        modified_at.hashCode ^
        fetch_count.hashCode;
  }
}
