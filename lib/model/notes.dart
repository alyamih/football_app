class Notes {
  String? title;
  String? text;
  DateTime? date;

  Notes({this.title, this.text, this.date});

  factory Notes.fromJson(Map<String, dynamic> parsedJson) {
    return Notes(
        title: parsedJson['title'] ?? "",
        text: parsedJson['text'] ?? "",
        date: DateTime.tryParse(parsedJson['date']));
  }

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "text": text,
      "date": date.toString(),
    };
  }
}
