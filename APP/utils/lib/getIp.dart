import 'dart:convert';
import 'package:http/http.dart' as http;

Future<String> ipAdd() async {
  try {
    final response = await http.get(Uri.parse('http://127.0.0.1:5000/get_ip'));

    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      String ip = data['ip_address'];
      return ip; 
    } else {
      throw Exception('Failed to fetch IP address: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Error: $e');
  }
}
