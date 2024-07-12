import 'package:app_tenis/routes/route_bottom_navigation.dart';
import 'package:flutter/material.dart';
import '../providers/providers.dart';

class DeleteBottomAlert extends StatelessWidget {
  const DeleteBottomAlert({
    super.key,
    required this.getCanchasResevered,
    required this.cancha,
  });

  final CanchasProvider getCanchasResevered;
  final cancha;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () async {
          final bool confirmDelete = await showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Confirmar'),
                    content: const Text(
                        '¿Estás seguro de que quieres eliminar esta cancha?'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(false),
                        child: const Text('Cancelar'),
                      ),
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(true),
                        child: const Text('Eliminar'),
                      ),
                    ],
                  );
                },
              ) ??
              false; // El diálogo devuelve 'null' si se cierra, por lo que se asegura un valor booleano con '?? false'

          // Si se confirma la eliminación, proceder a eliminar la cancha
          if (confirmDelete) {
            await getCanchasResevered.deleteCancha(cancha.id);
          }
        },
        icon: const Icon(Icons.delete, color: Colors.black));
  }
}

Future<dynamic> reserveAlreadyExist(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Error'),
      content: const Text(
          'Ya existe una reserva para la fecha y rango de horas seleccionados con el tipo de cancha'),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('OK'),
        ),
      ],
    ),
  );
}

Future<dynamic> reserveCreated(BuildContext context, canchaType) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Éxito'),
      content:
          Text('Reserva realizada con éxito para la cancha tipo, $canchaType '),
      actions: <Widget>[
        TextButton(
          onPressed: () {
             Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SelectScreenRoute(),
                      ),
                    );
          },
          child: const Text('OK'),
        ),
      ],
    ),
  );
}

Future<dynamic> maxReserve(BuildContext context, canchaType) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Error'),
      content: Text(
          'Se ha alcanzado el máximo de reservas por día para el tipo de cancha ${canchaType})'),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('OK'),
        ),
      ],
    ),
  );
}
