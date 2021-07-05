class DataNextdate {
  String? type;
  String? name;
  String? date;
  String? observation;

  DataNextdate({
    this.type,
    this.name,
    this.date,
    this.observation,
  });

  factory DataNextdate.fromJson(Map<String, dynamic> json) => DataNextdate(
        type: json['type'] as String?,
        name: json['name'] as String?,
        date: json['date'] as String?,
        observation: json['observation'] as String? ?? '',
      );

  Map<String, dynamic> toJson() => {
        'type': type,
        'name': name,
        'date': date,
        'observation': observation,
      };
}
