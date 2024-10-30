import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:myapp/model/category_modal.dart';

class CategoryService {
  static const String _baseUrl = 'https://my-cuan-tracker.wd1ea4.easypanel.host/api';

  Future<List<Category>> getCategories() async {
    final response = await http.get(Uri.parse('$_baseUrl/categories'));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      return body.map((item) => Category.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load categories');
    }
  }
}