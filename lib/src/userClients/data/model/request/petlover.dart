// To parse this JSON data, do
//
//     final createPetloverReq = createPetloverReqFromJson(jsonString);

import 'dart:convert';


String createPetloverReqToJson(CreatePetloverReq data) => json.encode(data.toJson());

class CreatePetloverReq {
    CreatePetloverReq({
        this.name,
        this.lastname,
        this.phone,
        this.email,
    });

    String? name;
    String? lastname;
    String? phone;
    String? email;

    Map<String, dynamic> toJson() => {
        'name': name,
        'lastname': lastname,
        'phone': phone,
        'email': email,
    };
}
