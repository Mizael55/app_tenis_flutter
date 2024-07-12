import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/models.dart';
import '../providers/providers.dart';

class ReserveDetails extends StatefulWidget {
  const ReserveDetails({
    super.key,
    required this.reserveDetails,
    required this.reserveDetailsCanchaSelected,
    required this.weather,
  });
  final bool reserveDetails;
  final CanchasModels reserveDetailsCanchaSelected;
  final String weather;

  @override
  State<ReserveDetails> createState() => _ReserveDetailsState();
}

class _ReserveDetailsState extends State<ReserveDetails> {
  final List<String> dropdownItems = [
    'Agregar Instructor',
    'Mark Gonzalez',
  ];

  String? selectedItem = 'Agregar Instructor';
  @override
  Widget build(BuildContext context) {
    final canchaFormProvider = Provider.of<CanchaFormProvider>(context);
    final size = MediaQuery.of(context).size;

    return Container(
      color: Colors.white,
      width: size.width,
      height: !widget.reserveDetails
          ? size.height * 0.3 + 6
          : size.height * 0.2 + 20,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.reserveDetailsCanchaSelected.title,
                    style: const TextStyle(
                        fontSize: 26, fontWeight: FontWeight.bold)),
                Text('\$${widget.reserveDetailsCanchaSelected.price}',
                    style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[800])),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.reserveDetailsCanchaSelected.type,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold)),
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
                Row(
                  children: [
                    Text(
                        widget.reserveDetailsCanchaSelected.available
                            ? 'Disponible'
                            : 'No disponible',
                        style:
                            const TextStyle(color: Colors.black, fontSize: 16)),
                    const SizedBox(width: 2),
                    const CircleAvatar(
                      radius: 5,
                      backgroundColor: Colors.blue,
                    ),
                    const SizedBox(width: 2),
                    Row(
                      children: [
                        const Icon(
                          Icons.access_time,
                          color: Colors.black,
                          size: 20,
                        ),
                        Text(
                            '${widget.reserveDetailsCanchaSelected.starthour} - ${widget.reserveDetailsCanchaSelected.endhour}',
                            style: const TextStyle(
                                color: Colors.black, fontSize: 16)),
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
                    Text(
                      widget.weather,
                      style: const TextStyle(
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
                margin: const EdgeInsets.only(top: 15),
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                ),
                width: size.width * 0.6,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: DropdownButton<String>(
                  value: selectedItem,
                  icon: const Icon(Icons.keyboard_arrow_down_rounded, size: 30),
                  elevation: 16,
                  style: const TextStyle(color: Colors.black, fontSize: 15),
                  underline: Container(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedItem = newValue;
                      canchaFormProvider.instructor = newValue!;
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
                      true,),
              )
          ],
        ),
      ),
    );
  }
}