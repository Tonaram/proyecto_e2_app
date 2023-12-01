//lib\models\event.dart
import 'package:cloud_firestore/cloud_firestore.dart';

class Event {
  final String id;
  final String title;
  final String description;
  final DateTime date;
  final String eventType;

  Event({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.eventType,
  });

  factory Event.fromFirestore(Map<String, dynamic> firestoreDoc, String eventId) {
    return Event(
      id: eventId,
      title: firestoreDoc['title'],
      description: firestoreDoc['description'],
      date: firestoreDoc['date'].toDate(),
      eventType: firestoreDoc['eventType'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'title': title,
      'description': description,
      'date': Timestamp.fromDate(date),
      'eventType': eventType,
    };
  }
}
