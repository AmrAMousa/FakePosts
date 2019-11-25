import 'dart:convert';

import 'model.dart';
import 'package:http/http.dart' as http;

Future<List<PostModel>> fetchData() async{
  try {

    final response = await http.get("https://jsonplaceholder.typicode.com/posts");
    final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
    return parsed.map<PostModel>((json) => PostModel.fromJson(json)).toList();

  } catch (e) {
    print(e);
  }
}