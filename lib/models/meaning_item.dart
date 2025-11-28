class MeaningItem {
  final String title;
  final String meaning;
  final String icon;

  MeaningItem({
    required this.title,
    required this.meaning,
    required this.icon,
  });

  factory MeaningItem.fromJson(Map<String, dynamic> json) {
    return MeaningItem(
      title: json['title'],
      meaning: json['meaning'],
      icon: json['icon'],
    );
  }
}
