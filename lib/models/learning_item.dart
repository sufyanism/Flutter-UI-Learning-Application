class LearningItem {
  final String title;
  final String description;
  final String icon;

  LearningItem({
    required this.title,
    required this.description,
    required this.icon,
  });

  factory LearningItem.fromJson(Map<String, dynamic> json) {
    return LearningItem(
      title: json['title'],
      description: json['description'],
      icon: json['icon'],
    );
  }
}
