import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:push_notificaciones/providers/pedido_provider.dart';


class SeguimientoPedidoScreen extends StatelessWidget {
  const SeguimientoPedidoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final estados = context.watch<PedidoProvider>().estados;

    return Scaffold(
      appBar: AppBar(
        title: Text('Seguimiento de Pedido'),
      ),
      body: ListView.builder(
        itemCount: estados.length,
        itemBuilder: (context, index) {
          final estado = estados[index];
          return ListTile(
            leading: _buildEstadoIcon(index, estados.length),
            title: Text(estado.estado),
            subtitle: Text(
              '${estado.descripcion}\n${_formatDate(estado.fecha)}',
              style: TextStyle(fontSize: 12),
            ),
            isThreeLine: true,
          );
        },
      ),
    );
  }

  Widget _buildEstadoIcon(int index, int total) {
    return Column(
      children: [
        Icon(
          Icons.circle,
          color: index == total - 1 ? Colors.orange : Colors.grey,
        ),
        if (index < total - 1)
          Container(
            height: 50,
            width: 2,
            color: Colors.grey,
          ),
      ],
    );
  }

  String _formatDate(DateTime date) {
    return "${date.day}/${date.month}/${date.year} ${date.hour}:${date.minute}";
  }
}