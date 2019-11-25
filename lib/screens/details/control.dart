import 'dart:convert';

import 'model.dart';
import 'package:http/http.dart' as http;

Future<List<CommentModel>> fetchData(int postId) async{
  try {

    final response = await http.get("https://jsonplaceholder.typicode.com/comments?postId=$postId#");
    final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
    return parsed.map<CommentModel>((json) => CommentModel.fromJson(json)).toList();

  } catch (e) {
    print(e);
  }
}