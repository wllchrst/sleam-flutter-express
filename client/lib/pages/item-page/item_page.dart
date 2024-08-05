import 'package:client/models/game.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ItemPage extends StatefulWidget {
  @override
  ItemPageState createState() => ItemPageState();
}

class ItemPageState extends State<ItemPage> {
  List<Game> _games = [];
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    fetchGames();
  }

  Future<void> fetchGames() async {
    try {
      final response = await http.get(Uri.parse('http://localhost:3000/game'));
      if (response.statusCode == 200) {
        List data = json.decode(response.body);
        setState(() {
          _games = data.map((game) => Game.fromJson(game)).toList();
          _isLoading = false;
        });
      } else {
        throw Exception('Failed to load games');
      }
    } catch (e) {
      setState(() {
        _error = e.toString();
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    } else if (_error != null) {
      return Center(child: Text('Error: $_error'));
    } else {
      return ListView(
        children: _games
            .map((game) => ListTile(
                title: Text(game.name),
                subtitle: Text(game.description),
                trailing: Text('\$${game.price.toStringAsFixed(2)}'),
                onTap: () {
                  final gameId = game.id;
                  context.go("/detail", extra: game);
                }))
            .toList(),
      );
    }
  }
}
