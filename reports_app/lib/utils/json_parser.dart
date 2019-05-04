import 'dart:convert';

List<Map<String, dynamic>> parseContentJson(String data) {
  final List<dynamic> jsonResult = json.decode(data);

  List<Map<String, dynamic>> jsonTmp = [];
  for (Map<String, dynamic> val in jsonResult) {
    String title = val['title'];
    List<dynamic> content = val['content'];
    // horizontal page view list of content
    Map<String, dynamic> parsedVal = {};
    parsedVal['content'] = [];
    parsedVal['title'] = title;

    for (Map<String, dynamic> innerVal in content) {
      // vertical card list of content
      Map<String, String> parsedInnerVal = innerVal.cast<String, String>();
      parsedVal['content'].add(parsedInnerVal);
    }

    jsonTmp.add(parsedVal);
  }
  return jsonTmp;
}

Map parseContentTopicsJson(String data) {
  final Map jsonResult = json.decode(data);
  return jsonResult;
}

Map parseContentReportsJson(String data) {
  final Map jsonResult = json.decode(data);
  return jsonResult;
}
