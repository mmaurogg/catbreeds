import 'package:http/http.dart' as http;

mixin Conectivity {
  Future<bool>? isConnected();
}

class ApiSource {
  final http.Client client;
  final Conectivity? conectivity;
  final String token;

  ApiSource({
    required this.client,
    required this.conectivity,
    required this.token,
  });

  Future<T?> getApi<T>(Uri url) async {
    try {
      final response = await client.get(url, headers: {'x-api-key': token});

      if (response.statusCode == 200) {
        return response as T;
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
