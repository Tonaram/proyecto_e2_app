//lib\services\event_service.dart

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:proyecto_e2_app/models/event.dart';

class EventService {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  // Crear un nuevo evento
  Future<void> createEvent(Event event) async {
    await _firebaseFirestore.collection('events').add(event.toFirestore());
  }

  // Obtener un stream de eventos
  Stream<List<Event>> getEvents() {
    return _firebaseFirestore.collection('events').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => Event.fromFirestore(doc.data(), doc.id)).toList();
    });
  }

  // Actualizar un evento existente
  Future<void> updateEvent(Event event) async {
    await _firebaseFirestore.collection('events').doc(event.id).update(event.toFirestore());
  }

  // Eliminar un evento
  Future<void> deleteEvent(String eventId) async {
    await _firebaseFirestore.collection('events').doc(eventId).delete();
  }
}
