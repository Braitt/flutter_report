import 'dart:convert';

List parseContentJson(String data) {
  final List jsonResult = json.decode(data);
  return jsonResult;
}

Map parseContentTopicsJson(String data) {
  final Map jsonResult = json.decode(data);
  return jsonResult;
}

Map parseContentReportsJson(String data) {
  final Map jsonResult = json.decode(data);
  return jsonResult;
}
