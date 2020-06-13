import 'package:house_review/models/IBaseModel.dart';

class IClient extends IBaseModel<IClient> {
  int id;
  String name;
  String address;
  DateTime dateOfInspection;

  IClient({this.id, this.name, this.address, this.dateOfInspection});

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'address': address,
        'date_of_inspection': dateOfInspection.toIso8601String()
      };

  @override
  IClient fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    dateOfInspection = DateTime.parse(json['date_of_inspection']);
    return this;
  }
}
