import 'package:flutter/material.dart';
import 'package:proyecto_e2_app/widgets/navbar.dart';
import 'package:proyecto_e2_app/widgets/sidebar.dart';
import 'package:proyecto_e2_app/models/event.dart';
import 'package:proyecto_e2_app/services/event_service.dart';
import 'package:intl/intl.dart'; // formatear fechas

class CreateEventScreen extends StatefulWidget {
  const CreateEventScreen({Key? key}) : super(key: key);

  @override
  _CreateEventScreenState createState() => _CreateEventScreenState();
}

class _CreateEventScreenState extends State<CreateEventScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final EventService _eventService = EventService();

  String _eventName = '';
  String _eventType = '';
  DateTime _eventDate = DateTime.now(); // El usuario no puede crear eventos en el pasado
  String _eventDescription = '';
  String _imageUrl = ''; // TODO: tener una manera de obtener esta URL, mediante la carga de una imagen
  
  // Controladores para los TextFields
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void dispose() {
    // Limpia los controladores cuando se destruye el widget
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _createEvent() async {
    if (_formKey.currentState!.validate()) {
      // Si el formulario es válido, se crea el evento
      Event event = Event(
        id: '',
        title: _eventName,
        description: _eventDescription,
        date: _eventDate,
        imageUrl: _imageUrl,
        eventType: _eventType,
      );

      try {
        await _eventService.createEvent(event);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Evento creado correctamente'),
          ),
        );
        // limpia los campos
         _nameController.clear();
        _descriptionController.clear();
        setState(() {
          _eventName = '';
          _eventDescription = '';
          _eventType = '';
          _eventDate = DateTime.now();
          _imageUrl = '';
        });
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Error al crear el evento'),
          ),
        );
      }
    }
  }

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
            child: Form(
              key: _formKey,
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
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: 'Event Name',
                      hintText: 'My Event',
                      hintStyle: TextStyle(color: Colors.grey.withOpacity(0.5)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a name';
                      }
                      return null;
                    },
                    onChanged: (value) => _eventName = value,
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
                    onPressed: _createEvent,
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
      ),
    );
  }
}
