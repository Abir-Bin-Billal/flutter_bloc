import "dart:async";
import "dart:convert";
import "dart:io";

import "package:bloc_flutter/data/models/post_model.dart";
import "package:http/http.dart" as http;

class PostRepository {
  Future<List<PostModel>?> fetchPost() async {
    try {
      final response = await http
          .get(Uri.parse("https://jsonplaceholder.typicode.com/comments"));
      if (response.statusCode == 200) {
        final body = json.decode(response.body) as List;
        return body.map((e) {
          return PostModel(
              id: e["id"] as int,
              postId: e["postId"],
              email: e["email"] as String,
              body: e["body"] as String);
        }).toList();
      }
    } on SocketException {
      throw Exception("It's a socket exception");
    } on TimeoutException {
      throw Exception("It's a timeOut exception");
    }
    return null;
  }
}
