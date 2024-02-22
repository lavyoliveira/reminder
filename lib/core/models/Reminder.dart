class Reminder {
  final String id;
  final String name;
  final DateTime date;
  final String dayOfTheWeek;

  Reminder({
    required this.id,
    required this.name,
    required this.date,
    required this.dayOfTheWeek
  });

  factory Reminder.fromJson(Map<String, dynamic> json) {
    return Reminder(
      id: json['id'],
      name: json['name'],
      date: DateTime.parse(json['date']),
      dayOfTheWeek: json['day_of_the_week']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'date': date.toIso8601String(),
      'day_of_the_week': dayOfTheWeek
    };
  }
}
