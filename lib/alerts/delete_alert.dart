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
          // Mostrar diálogo de confirmación
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
