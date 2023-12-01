import 'package:flutter/material.dart';
import 'package:proyecto_e2_app/widgets/navbar.dart';
import 'package:proyecto_e2_app/widgets/sidebar.dart';

class CreateEventScreen extends StatelessWidget {
  const CreateEventScreen({super.key});

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
                  'CREATE EVENT',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                const SizedBox(height: 20),
                Image.asset(
                  'assets/images/undraw_Online_organizer_re_156n.png',
                  height: MediaQuery.of(context).size.height * 0.25,
                ),
                const SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Event Name',
                    hintText: 'My Event',
                    hintStyle: TextStyle(color: Colors.grey.withOpacity(0.5)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
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
                  onChanged: (value) {},
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        icon: const Icon(Icons.map),
                        label: const Text("Location"),
                        onPressed: () {
                          // Integración con el mapa
                        },
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton.icon(
                        icon: const Icon(Icons.calendar_today),
                        label: const Text("Date"),
                        onPressed: () async {
                          DateTime? selectedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2101),
                          );

                          if (selectedDate != null && selectedDate != DateTime.now()) {
                            // manejo futuro de la fecha seleccionada
                          }
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                TextField(
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    labelText: 'Event Description',
                    hintText: 'This Event...',
                    hintStyle: TextStyle(color: Colors.grey.withOpacity(0.5)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/eventDetails');
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text('Create'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
