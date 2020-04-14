import 'package:http/http.dart' as http;
import 'dart:convert';

class TextToImage {
  Future<String> textToImage (String text) async {
    var url = 'https://content.googleapis.com/customsearch/v1?cx=002237009501334866868%3Afvzvo8x8bwm&num=1&q=$text&searchType=image&key=AIzaSyBN-EWWbmlw9KJwvK19439tLdSTcyTvOPA';
    var response = await http.get(url);
    Map<String, dynamic> textToImageData = jsonDecode(response.body.toString());
    var theItem = (textToImageData['items'] as List<dynamic>)[0];
    var link = theItem['link'];
    return link;
  }

}