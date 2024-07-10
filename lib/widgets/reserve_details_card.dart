import 'package:flutter/material.dart';

class ReserveDetails extends StatefulWidget {
  const ReserveDetails({
    super.key,
    required this.reserveDetails,
  });
  final bool reserveDetails;

  @override
  State<ReserveDetails> createState() => _ReserveDetailsState();
}

class _ReserveDetailsState extends State<ReserveDetails> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // Paso 1: Define la lista de elementos para el dropdown.
    final List<String> dropdownItems = [
      'Agregar Instructor',
      'Mario Soto',
      'Carlos Perez'
    ];
    // Paso 2: Variable para almacenar el valor seleccionado.
    String? selectedItem = 'Agregar Instructor';
    return Container(
      color: Colors.white,
      width: size.width,
      height: !widget.reserveDetails ? size.height * 0.3 + 6 : size.height * 0.2,
      child: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Epic Box',
                    style:
                        TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
                Text('\$25',
                    style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[800])),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Cancha tipo A',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text('por hora',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[500])),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  children: [
                    Text('Disponible',
                        style: TextStyle(color: Colors.black, fontSize: 16)),
                    SizedBox(width: 4),
                    CircleAvatar(
                      radius: 6,
                      backgroundColor: Colors.blue,
                    ),
                    SizedBox(width: 4),
                    Row(
                      children: [
                        Icon(
                          Icons.access_time,
                          color: Colors.black,
                          size: 20,
                        ),
                        Text('7:00 am a 4:00 pm',
                            style:
                                TextStyle(color: Colors.black, fontSize: 16)),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Image.asset(
                      'assets/img/pronostico.jpg',
                      width: 20,
                      height: 20,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(width: 5),
                    const Text(
                      '30%',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.location_on_outlined,
                  color: Colors.black,
                  size: 25,
                ),
                SizedBox(width: 4),
                Text('Via Av. Caracas y Av. P. Caroni',
                    style: TextStyle(color: Colors.black, fontSize: 18)),
              ],
            ),
            if (!widget.reserveDetails)
              Container(
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                ),
                width: size.width * 0.6,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey), // Color del borde
                  borderRadius: BorderRadius.circular(12), // Radio del borde
                ),
                child: DropdownButton<String>(
                  value: selectedItem,
                  icon: const Icon(Icons.keyboard_arrow_down_rounded, size: 30),
                  elevation: 16,
                  style: const TextStyle(color: Colors.black, fontSize: 18),
                  underline:
                      Container(), // Elimina la línea subrayada por defecto
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedItem = newValue;
                    });
                  },
                  items: dropdownItems
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  isExpanded:
                      true, // Hace que el DropdownButton se expanda para llenar el Container
                ),
              )
          ],
        ),
      ),
    );
  }
}
