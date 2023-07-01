import 'dart:convert';
import 'package:comment_adder/applicaton/data/model/comment_photo_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiProvider {
  static const baseUrl = 'https://jsonplaceholder.typicode.com';

  Future<List<Photo>> fetchPhotos() async {
    final response = await http.get(Uri.parse('$baseUrl/photos'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);
      return jsonData.map((data) => Photo.fromJson(data)).toList();
    } else {
      throw Exception('Failed to fetch photos');
    }
  }

  Future<Photo> addComment(String comment) async {
    final response = await http.post(
      Uri.parse('$baseUrl/photos/1'),
      headers: {'Content-type': 'application/json; charset=UTF-8'},
      body: jsonEncode({
        'id': 1,
        'title': comment,
        'thumbnailUrl':
            'https://www.google.com/s2/favicons?sz=64&domain_url=yahoo.com',
        'url': 'https://yahoo.com',
      }),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = jsonDecode(response.body);
      debugPrint(jsonData.toString());
      return Photo.fromJson(jsonData);
    } else {
      throw Exception('Failed to add comment');
    }
  }
}
