import 'package:flutter/material.dart';
import 'screens/login_screen.dart'; // Importa a tela de Login
import 'screens/offer_manual_screen.dart'; // Importa a tela de Oferecer Manual
import 'screens/chat_screen.dart'; // Importa a tela de Chat

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // Adicionando o construtor com Key? key conforme recomendação
  // Sugestão: poderia usar const MyApp({super.key}); em Dart >= 2.17
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mukanda App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/', // Define a rota inicial como a tela de Login
      routes: {
        // CORRIGIDO: Removido 'const' aqui porque LoginScreen não tem um construtor const
        '/': (context) => LoginScreen(),
        '/offerManual': (context) => OfferManualScreen(), // OfferManualScreen também não tem construtor const
        '/chat': (context) => ChatScreen(), // ChatScreen também não tem construtor const
        // Pode adicionar mais rotas aqui conforme cria mais telas
      },
      debugShowCheckedModeBanner: false, // Opcional: remove a etiqueta de debug no canto superior direito
    );
  }
}