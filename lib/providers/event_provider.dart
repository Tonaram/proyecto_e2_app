//lib\providers\event_provider.dart
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:proyecto_e2_app/models/event.dart';

class EventProvider with ChangeNotifier {
  List<Event> _events = [];
  List<Event> _filteredEvents = [];

  List<Event> get events => _filteredEvents;

  Future<void> fetchEvents() async {

    final String response = await rootBundle.loadString('assets/events.json');
    final data = await json.decode(response) as List;
    _events = data.map((json) => Event.fromJson(json)).toList();
    _filteredEvents = _events;
    notifyListeners();
  }

  void filterEvents({String? eventType, String? eventName}) {
    _filteredEvents = _events.where((event) {
      final bool matchEventType = eventType == null || event.eventType == eventType;
      final bool matchEventName = eventName == null || event.title.toLowerCase().contains(eventName.toLowerCase());
      return matchEventType && matchEventName;
    }).toList();
    notifyListeners();
  }

  Event getEventById(String id) => _events.firstWhere((event) => event.id == id);
}
