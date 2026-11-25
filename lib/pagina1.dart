import 'package:flutter/material.dart';

class Tarefas extends StatefulWidget {
  @override
  State<Tarefas> createState() => _TarefasState();
}

class _TarefasState extends State<Tarefas> {
  final TextEditingController tarefaController = TextEditingController();
  final List<String> tarefas = [];

  void adicionarTarefa() {
    String tarefa = tarefaController.text;
    if (tarefa.isNotEmpty) {
      setState(() {
        tarefas.add(tarefa);
        tarefaController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text('Lista de Tarefas'),
        titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: tarefaController,
                    decoration: const InputDecoration(
                      labelText: 'Digite uma tarefa',
                      labelStyle: TextStyle(fontSize: 16),
                      fillColor: Colors.grey,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: adicionarTarefa,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: tarefas.length,
              itemBuilder: (context, index) {
                return ListTile(title: Text(tarefas[index]));
              },
            ),
          ),
        ],
      ),
    );
  }
}
