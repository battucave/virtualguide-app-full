class HistoryModel implements Comparable<HistoryModel> {
  int id;
  List<dynamic> messages;
  List<dynamic> gptMessages;
  String title;
  String createdAt;
  String category;
  dynamic aiAssistantData;

  HistoryModel({this.id = 0, required this.messages, required this.gptMessages,required this.title,required this.category,required this.createdAt,required this.aiAssistantData});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'messages': messages,
      'gptMessages': gptMessages,
      'category': category,
      'createdAt': createdAt,
      'aiAssistantData': aiAssistantData,
    };
  }

  static HistoryModel fromMap(Map<String, dynamic> map) {
    return HistoryModel(
      id: map['id'],
      title: map['title'],
      messages: map['messages'],
      gptMessages: map['gptMessages'],
      category: map['category'],
      createdAt: map['createdAt'],
      aiAssistantData: map['aiAssistantData'],
    );
  }

  @override
  @override
  int compareTo(HistoryModel other) => title.compareTo(other.title);
}
