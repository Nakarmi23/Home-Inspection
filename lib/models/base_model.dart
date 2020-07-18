abstract class BaseModel {
  Map<String, dynamic> toJson();
}

abstract class BaseModelWithConditionAndPhotos extends BaseModel {
  String condition;
  List<String> photos;
}

abstract class BaseModelWithCommentAndPhotos extends BaseModel {
  List<String> photos;
  String comment;
}
