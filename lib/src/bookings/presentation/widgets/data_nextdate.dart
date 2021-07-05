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
        type: json['type'],
        name: json['name'],
        date: json['date'],
        observation: json['observation'] == null ? '' : json['observation'],
      );

  Map<String, dynamic> toJson() => {
        'type': type,
        'name': name,
        'date': date,
        'observation': observation,
      };
}
