class FilterAttention {
  String? from;
  String? to;
  String? userName;
  String? petName;
  List<int>? petSpecie;
  
    FilterAttention({
        this.from,
        this.to,
        this.userName,
        this.petName,
        this.petSpecie,
    });

    Map<String, dynamic> toJson() => {
        "from": from,
        "to": to,
        "user_name": userName,
        "pet_name": petName,
        "pet_specie": List<dynamic>.from(petSpecie!.map((x) => x)),
    };
}