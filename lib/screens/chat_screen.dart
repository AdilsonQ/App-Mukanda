import 'package:flutter/material.dart';

// StatefulWidget para gerir a lista de mensagens e o estado do campo de input
class ChatScreen extends StatefulWidget {
  // Adicionando o construtor com Key? key conforme recomendação
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  // Controlador para o campo de input de mensagem
  final TextEditingController messageController = TextEditingController();
  // Lista de exemplo de mensagens (substituir por dados reais do backend)
  final List<String> messages = [
    'Olá! Tenho interesse no livro que ofereceu.',
    'Podemos encontrar-nos para fazer a troca?',
    'Que horas seriam boas para você?',
  ];

  @override
  void dispose() {
    // Lembre-se de descartar os controladores quando o widget for removido
    messageController.dispose();
    super.dispose();
  }

  // TODO: Adicionar funcionalidade para envio de mensagens para o backend
  void _sendMessage() {
    if (messageController.text.isNotEmpty) {
      // Adiciona a mensagem à lista local (apenas para demonstração da UI)
      setState(() {
        // Adiciona a mensagem como se fosse enviada pelo utilizador atual (alinhamento à direita)
        messages.add(messageController.text);
        messageController.clear(); // Limpa o campo de input
      });
      // TODO: Enviar messageController.text para o backend
      print('Mensagem enviada: ${messageController.text}');
      // Rolar para o final da lista de mensagens após enviar
      // (Necessitaria de um ScrollController na ListView.builder)
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar (barra superior)
      appBar: AppBar(
        // Botão de voltar
        leading: IconButton(
          icon: const Icon(Icons.arrow_back), // Ícone de seta para trás (use const)
          onPressed: () {
            Navigator.pop(context); // Volta para a tela anterior
          },
        ),
        title: const Text('Nome do Livro'), // Título da tela (substituir pelo nome real do livro/utilizador - use const)
        // TODO: Pode adicionar ações como ver perfil do utilizador, etc.
      ),
      // Corpo da tela
      body: Column( // Organiza a lista de mensagens e o input verticalmente
        children: <Widget>[
          // Área onde as mensagens são exibidas
          Expanded( // Ocupa o espaço restante
            child: ListView.builder( // Constrói a lista de mensagens eficientemente
              padding: const EdgeInsets.all(16.0), // Espaçamento interno (use const)
              itemCount: messages.length, // Número total de mensagens
              itemBuilder: (context, index) { // Função para construir cada item da lista
                // Widget básico para exibir uma bolha de mensagem
                // A lógica de alinhamento (esquerda/direita) e cor (cinza/azul)
                // é um exemplo SIMPLES para simular remetente/destinatário.
                // Numa implementação real, você usaria o ID do remetente da mensagem
                // para determinar o alinhamento e a cor.
                bool isSender = (index % 2 == 0); // Exemplo: mensagens pares à esquerda, ímpares à direita

                return Align(
                  // Alinha a bolha: esquerda para o outro utilizador, direita para o utilizador atual
                  alignment: isSender ? Alignment.centerLeft : Alignment.centerRight,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8), // Espaçamento interno da bolha (use const)
                    margin: const EdgeInsets.symmetric(vertical: 4), // Espaço entre as bolhas (use const)
                    decoration: BoxDecoration(
                      // Cor da bolha: cinza para o outro utilizador, azul claro para o utilizador atual
                      color: isSender ? Colors.grey[300] : Colors.blue[100],
                      borderRadius: BorderRadius.circular(12), // Bordas arredondadas
                    ),
                    child: Text(messages[index]), // O texto da mensagem
                  ),
                );
              },
            ),
          ),
          // Área de input de mensagem e botão de envio
          Padding(
            padding: const EdgeInsets.all(16.0), // Espaçamento ao redor da área de input (use const)
            child: Row( // Organiza o campo de texto e o botão horizontalmente
              children: <Widget>[
                // Campo de texto para a mensagem
                Expanded( // Ocupa o máximo de espaço horizontal possível
                  child: TextField(
                    controller: messageController, // Liga o campo ao controlador
                    decoration: InputDecoration(
                      hintText: 'Mensagem', // Texto de sugestão no campo
                      border: OutlineInputBorder( // Borda arredondada para o campo
                        borderRadius: BorderRadius.circular(20),
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10), // Espaçamento interno (use const)
                    ),
                    onSubmitted: (_) => _sendMessage(), // Envia a mensagem ao pressionar Enter no teclado
                  ),
                ),
                const SizedBox(width: 8), // Espaço entre o campo e o botão (use const)

                // Botão de envio
                FloatingActionButton(
                  onPressed: _sendMessage, // Chama a função para enviar a mensagem
                  child: const Icon(Icons.send), // Ícone de envio (use const)
                  mini: true, // Deixa o botão um pouco menor
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}