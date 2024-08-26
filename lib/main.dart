import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:push_notificaciones/app.dart';
import 'package:push_notificaciones/models/modelo_pedido_evento.dart';
import 'package:push_notificaciones/providers/api_diferencias_provider.dart';
import 'package:push_notificaciones/providers/auth_provider.dart';
import 'package:push_notificaciones/providers/location_provider.dart';
import 'package:push_notificaciones/providers/pedido_provider.dart';
import 'package:push_notificaciones/providers/rutas_provider.dart';
import 'package:push_notificaciones/providers/tracking_provider.dart';
import 'package:push_notificaciones/services/models/push_notification_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // los plugins usan widgets - crear unos widgets
  await PushNotificationService.initApp();
  //await PushNotificationsService.cargarFirebaseApp();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => RutasProvider()),
    ChangeNotifierProvider(create: (_) => Authprovider()),
    ChangeNotifierProvider(create: (_) => TrackingProvider()),
    ChangeNotifierProvider(create: (_) => LocationProvider()), 
    ChangeNotifierProvider(create: (_) => ProductosProvider()), 
    ChangeNotifierProvider(create: (context){
      final pedidoProvider = PedidoProvider();
        pedidoProvider.inicializarEstados([
          PedidoEstado(
            estado: 'Order is being packed',
            descripcion: 'Package is being prepared',
            fecha: DateTime(2023, 9, 26, 19, 28),
          ),
          PedidoEstado(
            estado: 'Awaiting Shipment',
            descripcion: 'Package is waiting for shipment',
            fecha: DateTime(2023, 9, 27, 00, 16),
          ),
          // Añadir más estados según sea necesario
        ]);
        return pedidoProvider;
    }), 

  ], child: const MyApp()));
}

