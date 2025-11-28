class DailyItem {
  final String title;
  final String text;

  DailyItem({required this.title, required this.text});

  factory DailyItem.fromJson(Map<String, dynamic> json) {
    return DailyItem(
      title: json['title'],
      text: json['text'],
    );
  }
}
