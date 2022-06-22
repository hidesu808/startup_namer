import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:startup_namer/suggestions.dart';


class RandomWords extends StatefulWidget{
  const RandomWords({ Key? key }) : super(key: key);
  
  @override
  State<RandomWords> createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords>{
  final _suggestions = <WordPair>[];                 // NEW
  final _saved = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18); // NEW

  @override
  Widget build(Object context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bad Names"),
        actions: [
          IconButton(
            icon: const Icon(Icons.list),
            onPressed: _pushSaved,
            tooltip: 'Saved Suggestions',
          )
        ]
      ),

      body: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          if(index >= _suggestions.length){
            _suggestions.addAll(generateWordPairs().take(10));
          }

          final alreadySaved = _saved.contains(_suggestions[index]);

          return ListTile(
            onTap: (){
              setState(() {
                if(alreadySaved) {
                  _saved.remove(_suggestions[index]);
                }
                else{
                  _saved.add(_suggestions[index]);
                }
              });
            },

            title: Text(
              _suggestions[index].asPascalCase,
              style: _biggerFont,
            ),
            trailing: Icon(
              alreadySaved ? Icons.favorite : Icons.favorite_outline,
              color: alreadySaved ? Colors.red: null,
              semanticLabel: alreadySaved ? 'Remove from saved' : 'Save',
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index){
          return const Divider();
        },
        itemCount: 1000),
    );
  }

  void _pushSaved(){
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => Suggestions(saved: _saved))
    );
  }
}