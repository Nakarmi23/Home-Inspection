class IClient {
  int id;
  String name;
  String address;

  IClient({
    this.id,
    this.name,
    this.address,
  });

  IClient.fromJSON(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
  }
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'address': address,
      };
}
