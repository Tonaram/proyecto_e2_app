import 'package:flutter/material.dart';
import 'package:proyecto_e2_app/widgets/navbar.dart';
import 'package:proyecto_e2_app/widgets/sidebar.dart';

class FindEventScreen extends StatelessWidget {
  const FindEventScreen({super.key});

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
                      flex: 3,
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Event Name',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: IconButton(
                        icon: const Icon(Icons.filter_list),
                        onPressed: () {
                          // Acción del filtro aún no implementada
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  // Aquí en el futuro se mostrará los eventos
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}