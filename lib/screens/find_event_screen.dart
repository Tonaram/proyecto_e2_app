//lib\screens\find_event_screen.dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:proyecto_e2_app/models/event.dart';
import 'package:proyecto_e2_app/screens/event_details_screen.dart';
import 'package:proyecto_e2_app/services/event_service.dart';
import 'package:proyecto_e2_app/widgets/navbar.dart';
import 'package:proyecto_e2_app/widgets/sidebar.dart';

class FindEventScreen extends StatefulWidget {
  const FindEventScreen({Key? key}) : super(key: key);

  @override
  _FindEventScreenState createState() => _FindEventScreenState();
}

class _FindEventScreenState extends State<FindEventScreen> {
  String _selectedEventType = '';
  String _searchEventName = '';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Navbar(),
      drawer: const Sidebar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 400,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'FIND EVENT',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                const SizedBox(height: 20),
                Image.asset(
                  'assets/images/undraw_File_searching_re_3evy.png',
                  height: MediaQuery.of(context).size.height * 0.33,
                ),
                const SizedBox(height: 20),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'Event Type',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  items: const [
                    DropdownMenuItem(value: "Tournament", child: Text("Tournament")),
                    DropdownMenuItem(value: "Party", child: Text("Party")),
                    DropdownMenuItem(value: "Workshop", child: Text("Workshop")),
                  ],
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedEventType = newValue ?? '';
                    });
                  },
                ),
                const SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Event Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _searchEventName = value;
                    });
                  },
                ),
                const SizedBox(height: 20),
                StreamBuilder<List<Event>>(
                  stream: EventService().getEvents(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(child: Text('No events found'));
                    }

                    List<Event> events = snapshot.data!;
                    if (_selectedEventType.isNotEmpty) {
                      events = events.where((event) => event.eventType == _selectedEventType).toList();
                    }
                    if (_searchEventName.isNotEmpty) {
                      events = events.where((event) => event.title.toLowerCase().contains(_searchEventName.toLowerCase())).toList();
                    }

                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: events.length,
                      itemBuilder: (context, index) {
                        Event event = events[index];
                        return ListTile(
                          title: Text(event.title),
                          subtitle: Text(DateFormat.yMd().format(event.date)),
                          onTap: () {
                            // Navegar a EventDetailsScreen con el ID del evento
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EventDetailsScreen(eventId: event.id),
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}