import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:catbreeds/src/model/catbreed_model.dart';

class ApiSource {
  final String token;

  ApiSource({
    required this.token,
  });

  final http.Client client = http.Client();
  //final Conectivity? conectivity;

  Future<List<T?>?> getApi<T>(Uri url) async {
    try {
      final response = await client.get(url, headers: {'x-api-key': token});

      if (response.statusCode == 200) {
        final jsonResponse = convert.jsonDecode(response.body);
        print(jsonResponse);
        return jsonResponse;
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

/*   Future<http.Response> postApi(String endPoint, Map<String, dynamic> body) async {
    final url = Uri.https(baseUrl, endPoint);
    final response =
        await client.post(url, body: body, headers: {'x-api-key': token});
    return response;
  } */
}
