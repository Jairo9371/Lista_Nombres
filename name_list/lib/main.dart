import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de Nombres',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _controller = TextEditingController();
  final List<String> _names = [];
  final List<Color> _colors = [];
  final Random _random = Random();

  void _addName() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _names.add(_controller.text);
        _colors.add(_generateRandomColor());
      });
      _controller.clear();
    }
  }

  void _removeName(int index) {
    setState(() {
      _names.removeAt(index);
      _colors.removeAt(index);
    });
  }

  Color _generateRandomColor() {
    return Color.fromARGB(
      255,
      _random.nextInt(256),
      _random.nextInt(256),
      _random.nextInt(256),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Nombres'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Ingrese un Nombre',
                    ),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _addName,
                  child: Text('Agregar'),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _names.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      _names[index],
                      style: TextStyle(color: _colors[index]),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => _removeName(index),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
