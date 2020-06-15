import 'dart:convert';
import 'dart:io';

class KanCard {
  final String order;
  final String word;
  final String description;
  // string to svg
  // String kanji;

  int stroke = 5;

  KanCard(this.order, this.word, this.description);

  // Future getImageUrl() async {
  //   //Null check
  //   //If there's image, don't need to get one
  //   if (imageUrl != null) {
  //     return;
  //   }

  //   HttpClient http = HttpClient();
  //   try {
  //     // Use darts Uri builder
  //     var uri = Uri.http('dog.ceo', '/api/breeds/image/random');
  //     var request = await http.getUrl(uri);
  //     var response = await request.close();
  //     var responseBody = await response.transform(utf8.decoder).join();
  //     // The dog.ceo API returns a JSON object with a property
  //     // called 'message', which actually is the URL.
  //     imageUrl = json.decode(responseBody)['message'];
  //   } catch (exception) {
  //     print(exception);
  //   }
  // }
}
