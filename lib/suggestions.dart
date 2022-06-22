import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class Suggestions extends StatelessWidget {
  const Suggestions({Key ? key, required this.saved}) : super(key: key);
  final List<WordPair> saved;
  
  final _biggerFont = const TextStyle(fontSize: 18);
  
  @override
  Widget build(BuildContext context){
    final tiles = saved.map(
      (pair) {
        return ListTile(
          title: Text(
            pair.asPascalCase,
            style: _biggerFont,
          ),
        );
      },
    );
    
    final divided = tiles.isNotEmpty
      ? ListTile.divideTiles(
        context: context,
        tiles: tiles,
      ).toList()
      : <Widget>[];
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved Suggestions'),
      ),
      body: ListView(children: divided),
    );
  }
}