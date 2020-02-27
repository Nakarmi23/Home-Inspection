import 'dart:core';

class IClient {
  int id;
  String name;
  String address;
  String contact;

  IClient({
    this.id,
    this.name,
    this.address,
    this.contact,
  });

  IClient.fromJSON(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    contact = json['contact'];
  }
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'address': address,
        'contact': contact,
      };
}
