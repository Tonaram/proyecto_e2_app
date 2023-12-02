//lib\services\event_service.dart

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:proyecto_e2_app/models/event.dart';

class EventService {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  // Crear un nuevo evento
  Future<String> createEvent(Event event) async {
    DocumentReference docRef = await _firebaseFirestore.collection('events').add(event.toFirestore());
    return docRef.id;
  }

  // Obtener un stream de eventos
  Stream<List<Event>> getEvents() {
    return _firebaseFirestore.collection('events').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => Event.fromFirestore(doc.data(), doc.id)).toList();
    });
  }

    // Obtener un evento específico por ID
  Future<Event?> getEventById(String eventId) async {
    try {
      DocumentSnapshot doc = await _firebaseFirestore.collection('events').doc(eventId).get();
      if (doc.exists) {
        return Event.fromFirestore(doc.data() as Map<String, dynamic>, doc.id);
      } else {
        throw Exception("El evento con ID: $eventId no se encontró.");
      }
    } catch (e) {
      throw Exception("Error al obtener el evento: $e");
    }
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
