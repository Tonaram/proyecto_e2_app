//lib\screens\find_event_screen.dart
import 'package:flutter/material.dart';
import 'package:proyecto_e2_app/widgets/navbar.dart';
import 'package:proyecto_e2_app/widgets/sidebar.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_e2_app/providers/event_provider.dart';

class FindEventScreen extends StatelessWidget {
  const FindEventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String? selectedEventType;
    String? enteredEventName;

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
                DropdownButtonFormField(
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
                  onChanged: (value) {
                    selectedEventType = value;
                    context.read<EventProvider>().filterEvents(eventType: selectedEventType, eventName: enteredEventName);
                  },
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Event Name',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onChanged: (value) {
                          enteredEventName = value;
                          context.read<EventProvider>().filterEvents(eventType: selectedEventType, eventName: enteredEventName);
                        },
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: IconButton(
                        icon: const Icon(Icons.filter_list),
                        onPressed: () {
                          context.read<EventProvider>().filterEvents(eventType: selectedEventType, eventName: enteredEventName);
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Consumer<EventProvider>(
                  builder: (ctx, eventProvider, child) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: eventProvider.events.length,
                      itemBuilder: (context, index) {
                        final event = eventProvider.events[index];
                        return Card(
                          child: ListTile(
                            title: Text(event.title),
                            trailing: Text(event.date),
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                '/eventDetails',
                                arguments: event.id,
                              );
                            },
                          ),
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
