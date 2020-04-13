abstract class IBaseModel<T> {
  int id;

  T fromJson(Map<String, dynamic> json);

  Map<String, dynamic> toJson();
}
