//lib\services\event_service.dart
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:proyecto_e2_app/models/event.dart';

class EventService {
  Future<List<Event>> fetchEvents() async {
    final jsonString = await rootBundle.loadString('assets/events.json');
    final List<dynamic> jsonData = jsonDecode(jsonString);
    return jsonData.map((json) => Event.fromJson(json)).toList();
  }
}