import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  // Removendo o 'const' do construtor
  LoginScreen({Key? key}) : super(key: key); // <-- CORRIGIDO

  // Controladores para os campos de texto (permitem obter o texto inserido)
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Lembre-se de descartar os controladores quando o widget for removido (boa prática, especialmente em StatefulWidgets, mas útil aqui também se o widget for removido da árvore)
  // Embora StatelessWidget não tenha dispose() diretamente, os controladores podem ser descartados onde o widget é gerido
  // Para este exemplo simples, onde o LoginScreen é uma rota inicial, não é estritamente necessário descartá-los aqui, mas é uma boa prática geral a ter em mente.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar (barra superior) da tela
      appBar: AppBar(
        title: const Text('Mukanda'), // Título na barra superior (usando const pois é fixo)
        // actions: <Widget>[ // Exemplo: botões na barra superior
        //   IconButton(
        //     icon: const Icon(Icons.settings), // Use const para ícones fixos
        //     onPressed: () {
        //       // TODO: Implementar ação do botão de configurações
        //     },
        //   ),
        // ],
      ),
      // Corpo da tela
      body: Center( // Centraliza o conteúdo na tela
        child: SingleChildScrollView( // Permite rolar o conteúdo se for muito longo
          padding: const EdgeInsets.all(24.0), // Espaçamento interno (use const para valores fixos)
          child: Column( // Organiza os elementos verticalmente
            mainAxisAlignment: MainAxisAlignment.center, // Centraliza a coluna verticalmente
            crossAxisAlignment: CrossAxisAlignment.stretch, // Estica os elementos horizontalmente
            children: <Widget>[
              // Título principal
              const Text( // Use const para textos fixos
                'Mukanda',
                textAlign: TextAlign.center, // Alinha o texto ao centro
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8), // Espaço vertical (use const para tamanho fixo)
              // Subtítulo
              Text(
                'Troque e doe manuais escolares',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey[600], // Cor cinza
                ),
              ),
              const SizedBox(height: 40), // Espaço maior (use const)

              // Campo de texto para Número de telefone
              TextField(
                controller: phoneController, // Liga o campo ao controlador
                decoration: const InputDecoration( // Use const para decorações fixas
                  labelText: 'Número de telefone', // Texto que aparece antes de digitar
                  border: OutlineInputBorder(), // Borda ao redor do campo
                  prefixIcon: Icon(Icons.phone), // Ícone à esquerda
                ),
                keyboardType: TextInputType.phone, // Tipo de teclado (numérico para telefone)
              ),
              const SizedBox(height: 20), // Espaço

              // Campo de texto para Senha
              TextField(
                controller: passwordController, // Liga o campo ao controlador
                decoration: const InputDecoration( // Use const para decorações fixas
                  labelText: 'Senha',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock), // Ícone à esquerda
                ),
                obscureText: true, // Oculta o texto (para senhas)
              ),
              const SizedBox(height: 30), // Espaço maior

              // Botão Entrar
              ElevatedButton(
                onPressed: () {
                  // --- LÓGICA DE LOGIN (PLACEHOLDER) ---
                  // TODO: Implementar Lógica de Login Real aqui
                  // - Validar campos
                  // - Enviar dados para o backend
                  // - Navegar para a tela principal se o login for bem-sucedido
                  print('Botão Entrar pressionado');
                  print('Telefone: ${phoneController.text}');
                  print('Senha: ${passwordController.text}');

                  // Por agora, apenas navega para a tela de Ofertar Manual ao pressionar o botão
                  Navigator.pushNamed(context, '/offerManual');
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15), // Espaçamento interno do botão (use const)
                  textStyle: const TextStyle(fontSize: 18), // Tamanho do texto do botão (use const)
                ),
                child: const Text('Entrar'), // Use const para texto fixo
              ),
              const SizedBox(height: 20), // Espaço

              // Link Criar conta (TextButton parece mais um link)
              TextButton(
                onPressed: () {
                  // TODO: Implementar Navegação para a tela de Criar Conta
                  print('Criar conta pressionado');
                  // Exemplo: Navigator.pushNamed(context, '/createAccount');
                },
                child: const Text('Criar conta'), // Use const para texto fixo
              ),
              const SizedBox(height: 30), // Espaço maior

              // Botão Continuar com Google (OutlinedButton com ícone)
              OutlinedButton.icon(
                onPressed: () {
                  // TODO: Implementar integração com Google Sign-In
                  print('Continuar com Google pressionado');
                },
                icon: Image.network( // Ícone do Google (usando uma imagem da web para demonstração)
                  'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Google_%22G%22_logo.svg/1920px-Google_%22G%22_logo.svg.png',
                  height: 24, // Tamanho do ícone
                ),
                label: const Text('Continuar com Google'), // Texto do botão (use const)
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15), // Use const
                  textStyle: const TextStyle(fontSize: 18), // Use const
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}