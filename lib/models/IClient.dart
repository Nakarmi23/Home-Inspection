import 'package:house_review/models/IBaseModel.dart';

class IClient extends IBaseModel<IClient> {
  int id;
  String name;
  String address;

  IClient({
    this.id,
    this.name,
    this.address,
  });

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'address': address,
      };

  @override
  IClient fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    return this;
  }
}
