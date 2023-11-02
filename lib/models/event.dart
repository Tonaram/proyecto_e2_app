//lib\models\event.dart
class Event {
  final String id;
  final String title;
  final String description;
  final String date;
  final String imageUrl;
  final String eventType;

  Event({required this.id, required this.title, required this.description, required this.date, required this.imageUrl, required this.eventType,});

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      date: json['date'],
      imageUrl: json['imageUrl'],
      eventType: json['eventType'],
    );
  }
}