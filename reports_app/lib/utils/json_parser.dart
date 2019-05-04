import 'dart:convert';

List<List<Map<String, String>>> parseContentJson(String data) {
  final List<dynamic> jsonResult = json.decode(data);

  List<List<Map<String, String>>> jsonTmp = [];
  for (List<dynamic> val in jsonResult) {
    // horizontal page view list of content
    List<Map<String, String>> parsedVal = [];

    for (Map<String, dynamic> innerVal in val) {
      // vertical page views list of content
      Map<String, String> parsedInnerVal = innerVal.cast<String, String>();
      parsedVal.add(parsedInnerVal);
    }

    jsonTmp.add(parsedVal);
  }
  return jsonTmp;
}
