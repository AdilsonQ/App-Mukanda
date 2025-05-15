import 'package:flutter/material.dart';

// StatefulWidget é usado porque o estado da tela (seleção de dropdown, checkboxes) muda
class OfferManualScreen extends StatefulWidget {
  // Adicionando o construtor com Key? key conforme recomendação
  // Pode usar const OfferManualScreen({super.key}); em Dart >= 2.17
  const OfferManualScreen({Key? key}) : super(key: key);

  @override
  _OfferManualScreenState createState() => _OfferManualScreenState();
}

class _OfferManualScreenState extends State<OfferManualScreen> {
  // Variáveis para controlar os valores selecionados
  String? selectedAuthor; // Autor selecionado no dropdown
  bool book1Selected = false; // Estado do primeiro checkbox
  bool book2Selected = false; // Estado do segundo checkbox

  // Controladores para os campos de texto
  final TextEditingController titleController = TextEditingController();
  final TextEditingController schoolController = TextEditingController();

  // Lista de opções para o dropdown de Autor
  final List<String> authorOptions = ['Autor A', 'Autor B', 'Autor C', 'Outro'];

  @override
  void dispose() {
    // Lembre-se de descartar os controladores quando o widget for removido
    titleController.dispose();
    schoolController.dispose();
    super.dispose();
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
            Navigator.pop(context); // Volta para a tela anterior na stack de navegação
          },
        ),
        title: const Text('Oferecer manual'), // Título da tela (use const)
      ),
      // Corpo da tela (rola se necessário)
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0), // Espaçamento interno (use const)
        child: Column( // Organiza os elementos verticalmente
          crossAxisAlignment: CrossAxisAlignment.stretch, // Estica os elementos horizontalmente
          children: <Widget>[
            // Campo de texto para Título do livro
            TextField(
              controller: titleController,
              decoration: const InputDecoration( // Use const se os parâmetros forem constantes
                labelText: 'Título do livro',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20), // Espaço (use const)

            // Dropdown para Autor
            DropdownButtonFormField<String>(
              value: selectedAuthor, // Valor selecionado atualmente
              // CORRIGIDO: hintText movido para FORA da InputDecoration
              decoration: const InputDecoration( // Use const se os parâmetros forem constantes
                labelText: 'Autor',
                border: OutlineInputBorder(),
                // hintText NÃO DEVE ESTAR AQUI
              ),
              hint: Text('Selecione o autor'), // <-- CORRIGIDO: AGORA ESTÁ AQUI (parâmetro direto do DropdownButtonFormField)
              items: authorOptions // Opções da lista
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(), // Converte a lista de strings para lista de DropdownMenuItems
              onChanged: (String? newValue) { // Função chamada quando um novo item é selecionado
                setState(() { // Atualiza o estado da tela
                  selectedAuthor = newValue;
                });
              },
            ),
            const SizedBox(height: 20), // Espaço (use const)

            // Campo de texto para Minha escola
            TextField(
              controller: schoolController,
              decoration: const InputDecoration( // Use const
                labelText: 'Minha escola',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 30), // Espaço (use const)

            // Checkbox para o primeiro livro
            CheckboxListTile(
              title: const Text('Nome do Livro'), // Título do item da lista (use const)
              subtitle: const Text('Autor do Livro 10 pts'), // Subtítulo (mostrando pontos de exemplo - use const)
              value: book1Selected, // Valor atual do checkbox (marcado ou não)
              onChanged: (bool? value) { // Função chamada quando o checkbox é clicado
                setState(() { // Atualiza o estado da tela
                  book1Selected = value ?? false; // Atualiza a variável, lida com valor nulo
                });
              },
              controlAffinity: ListTileControlAffinity.leading, // Posição do checkbox (início)
            ),
            const SizedBox(height: 10), // Espaço (use const)

            // Checkbox para o segundo livro
            CheckboxListTile(
              title: const Text('Nome do Livro'), // Use const
              subtitle: const Text('Usado - Escola 10 pts'), // Subtítulo (mostrando estado e pontos de exemplo - use const)
              value: book2Selected,
              onChanged: (bool? value) {
                setState(() {
                  book2Selected = value ?? false;
                });
              },
              controlAffinity: ListTileControlAffinity.leading,
            ),
            const SizedBox(height: 30), // Espaço (use const)

            // TODO: Adicionar um botão para "Submeter Oferta" (necessita de lógica para guardar os dados)
            // ElevatedButton(
            //   onPressed: () {
            //     // TODO: Implementar Lógica de Submissão da Oferta para o backend
            //     print('Submeter Oferta pressionado');
            //     print('Título: ${titleController.text}');
            //     print('Autor: $selectedAuthor');
            //     print('Escola: ${schoolController.text}');
            //     print('Livro 1 Selecionado: $book1Selected');
            //     print('Livro 2 Selecionado: $book2Selected');
            //   },
            //   child: const Text('Submeter Oferta'), // Use const
            //   style: ElevatedButton.styleFrom(
            //       padding: const EdgeInsets.symmetric(vertical: 15)), // Use const
            // ),
          ],
        ),
      ),
      // Barra de navegação inferior
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[ // Use const para lista fixa de itens
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Manuais', // Texto do item
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_offer),
            label: 'Ofertas',
          ),
        ],
        currentIndex: 0, // Define qual item está ativo (0 = primeiro item)
        selectedItemColor: Colors.blue, // Cor do item selecionado
        onTap: (index) {
          // TODO: Implementar a navegação entre as telas usando a barra inferior
          print('Item da barra inferior tocado: $index');
          // Exemplo básico de navegação (ajuste conforme a sua estrutura de rotas ou gestão de estado):
          // if (index == 0) {
          //   // Ir para a tela de Manuais (se for diferente da atual)
          // } else if (index == 1) {
          //   // Ir para a tela de Ofertas
          // }
        },
      ),
    );
  }
}