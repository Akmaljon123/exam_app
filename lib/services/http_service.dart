import 'dart:convert';
import 'dart:io';

class HttpService{

  static Future<String?> get({required Map<String, dynamic> param})async{
    HttpClient httpClient = HttpClient();
    try {
      Uri url = Uri.https("api.api-ninjas.com", "/v1/nutrition", param);
      HttpClientRequest request = await httpClient.getUrl(url);
      request.headers.set("x-api-key", "fDRU4RCMqGI/5HojYXqikg==IvQt6siLCB2gvWeo");

      HttpClientResponse response = await request.close();

      if(response.statusCode <= 201){
        String data = await response.transform(utf8.decoder).join();

        return data;
      }else{
        return null;
      }
    } catch (e){
      Exception("Error at $e");
    } finally{
      httpClient.close();
    }
  }


  static Future<String?> getMock()async{
    HttpClient httpClient = HttpClient();
    try {
      Uri url = Uri.https("65cbb766efec34d9ed87fe33.mockapi.io", "/users");
      HttpClientRequest request = await httpClient.getUrl(url);
      request.headers.set("Content-Type", "application/json");

      HttpClientResponse response = await request.close();

      if(response.statusCode <= 201){
        String data = await response.transform(utf8.decoder).join();

        return data;
      }else{
        return null;
      }
    } catch (e){
      Exception("Error at $e");
    } finally{
      httpClient.close();
    }
  }


  static Future<void> post(Map<String, dynamic> data)async{
    HttpClient httpClient = HttpClient();
    try {
      Uri url = Uri.https("65cbb766efec34d9ed87fe33.mockapi.io", "/users");
      HttpClientRequest request = await httpClient.postUrl(url);
      request.headers.set("Content-Type", "application/json");
      request.add(utf8.encode(jsonEncode(data)));

      HttpClientResponse response = await request.close();
    } catch (e){
      Exception("Error at $e");
    } finally{
      httpClient.close();
    }
  }


}