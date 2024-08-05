import 'package:client/models/comment.dart';
import 'package:client/models/commentcreation.dart';
import 'package:client/models/game.dart';
import 'package:client/service/shared-preference-service.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class DetailPage extends StatefulWidget {
  final Game game;

  DetailPage({required this.game});

  @override
  _GameDetailPageState createState() => _GameDetailPageState();
}

class _GameDetailPageState extends State<DetailPage> {
  final _commentController = TextEditingController();

  List<Comment> _comments = [];
  bool _isLoadingComments = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    fetchComments();
  }

  Future<void> fetchComments() async {
    try {
      final gameId = widget.game.id;
      final response = await http.get(
        Uri.parse('http://localhost:3000/comment/$gameId'),
      );

      if (response.statusCode == 200) {
        print(response.body);
        List data = json.decode(response.body);
        setState(() {
          _comments = data.map((comment) => Comment.fromJson(comment)).toList();
          _isLoadingComments = false;
        });
      } else {
        throw Exception('Failed to load comments');
      }
    } catch (e) {
      print("masuk error bro");
      setState(() {
        _error = e.toString();
        _isLoadingComments = false;
      });
    }
  }

  void back(BuildContext context) {
    context.go('/home');
  }

  Future<void> _submitComment() async {
    final userId = await SharedPreferenceService.getUserId();
    if (userId == null) return;
    final comment = CommentCreation(
      gameId: widget.game.id.toString(),
      userId: userId,
      text: _commentController.text,
    );

    if (_commentController.text.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Text cannot be empty")));
      return;
    }

    try {
      final response = await http.post(
        Uri.parse('http://localhost:3000/comment'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(comment.toJson()),
      );

      if (response.statusCode == 200) {
        // Berhasil mengirim komentar
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Comment submitted successfully!')),
        );
        _commentController.clear();
      } else {
        throw Exception('Failed to submit comment');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(widget.game.name),
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.info),
              ),
              Tab(
                icon: Icon(Icons.comment),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Tab 1: Detail Game
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Name: ${widget.game.name}',
                      style: TextStyle(fontSize: 20)),
                  SizedBox(height: 8),
                  Text('Description: ${widget.game.description}',
                      style: TextStyle(fontSize: 16)),
                  SizedBox(height: 8),
                  Text('Price: \$${widget.game.price.toStringAsFixed(2)}',
                      style: TextStyle(fontSize: 16)),
                  Text('Leave a Comment',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  TextField(
                    controller: _commentController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter your comment here',
                    ),
                    maxLines: 4,
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _submitComment,
                    child: Text('Submit Comment'),
                  ),
                  Padding(padding: EdgeInsets.all(16.0)),
                  ElevatedButton(
                    onPressed: () {
                      back(context);
                    },
                    child: Text('Back'),
                  ),
                ],
              ),
            ),
            // Tab 2: Comment Form
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _isLoadingComments
                      ? Center(child: CircularProgressIndicator())
                      : _error != null
                          ? Center(child: Text('Error: $_error'))
                          : Expanded(
                              child: ListView(
                                children: _comments
                                    .map((comment) => ListTile(
                                          title: Text(comment.text),
                                          subtitle:
                                              Text('Email: ${comment.email}'),
                                        ))
                                    .toList(),
                              ),
                            ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
