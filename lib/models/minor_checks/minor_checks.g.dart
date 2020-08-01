// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'minor_checks.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MinorChecks _$MinorChecksFromJson(Map<String, dynamic> json) {
  return MinorChecks(
    doors: (json['doors'] as List)
        ?.map(
            (e) => e == null ? null : Door.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    window: (json['window'] as List)
        ?.map((e) =>
            e == null ? null : Window.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    ceiling: (json['ceiling'] as List)
        ?.map((e) =>
            e == null ? null : Ceiling.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    wall: (json['wall'] as List)
        ?.map(
            (e) => e == null ? null : Wall.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    electricalFitting: (json['electricalFitting'] as List)
        ?.map((e) => e == null
            ? null
            : ElectricalFitting.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    pestInspection: (json['pestInspection'] as List)
        ?.map((e) => e == null
            ? null
            : PestInspection.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    carpentry: (json['carpentry'] as List)
        ?.map((e) => e == null
            ? null
            : ImageAndComment.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    metalAluminiumWork: (json['metalAluminiumWork'] as List)
        ?.map((e) => e == null
            ? null
            : ImageAndComment.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    cleaning: (json['cleaning'] as List)
        ?.map((e) => e == null
            ? null
            : ImageAndComment.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$MinorChecksToJson(MinorChecks instance) =>
    <String, dynamic>{
      'doors': instance.doors?.map((e) => e?.toJson())?.toList(),
      'window': instance.window?.map((e) => e?.toJson())?.toList(),
      'ceiling': instance.ceiling?.map((e) => e?.toJson())?.toList(),
      'wall': instance.wall?.map((e) => e?.toJson())?.toList(),
      'electricalFitting':
          instance.electricalFitting?.map((e) => e?.toJson())?.toList(),
      'pestInspection':
          instance.pestInspection?.map((e) => e?.toJson())?.toList(),
      'carpentry': instance.carpentry?.map((e) => e?.toJson())?.toList(),
      'metalAluminiumWork':
          instance.metalAluminiumWork?.map((e) => e?.toJson())?.toList(),
      'cleaning': instance.cleaning?.map((e) => e?.toJson())?.toList(),
    };

Door _$DoorFromJson(Map<String, dynamic> json) {
  return Door(
    material: json['material'] as String,
    doorFramesCondition: json['doorFramesCondition'] == null
        ? null
        : MinorChecksCondition.fromJson(
            json['doorFramesCondition'] as Map<String, dynamic>),
    doorPanelsCondition: json['doorPanelsCondition'] == null
        ? null
        : MinorChecksCondition.fromJson(
            json['doorPanelsCondition'] as Map<String, dynamic>),
    hingesCondition: json['hingesCondition'] == null
        ? null
        : MinorChecksCondition.fromJson(
            json['hingesCondition'] as Map<String, dynamic>),
    holderCondition: json['holderCondition'] == null
        ? null
        : MinorChecksCondition.fromJson(
            json['holderCondition'] as Map<String, dynamic>),
    otherFixturesCondition: json['otherFixturesCondition'] == null
        ? null
        : MinorChecksCondition.fromJson(
            json['otherFixturesCondition'] as Map<String, dynamic>),
    comment: json['comment'] as String,
    photos: (json['photos'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$DoorToJson(Door instance) => <String, dynamic>{
      'material': instance.material,
      'doorFramesCondition': instance.doorFramesCondition?.toJson(),
      'doorPanelsCondition': instance.doorPanelsCondition?.toJson(),
      'hingesCondition': instance.hingesCondition?.toJson(),
      'holderCondition': instance.holderCondition?.toJson(),
      'otherFixturesCondition': instance.otherFixturesCondition?.toJson(),
      'photos': instance.photos,
      'comment': instance.comment,
    };

Window _$WindowFromJson(Map<String, dynamic> json) {
  return Window(
    material: json['material'] as String,
    hingesCondition: json['hingesCondition'] == null
        ? null
        : MinorChecksCondition.fromJson(
            json['hingesCondition'] as Map<String, dynamic>),
    holderCondition: json['holderCondition'] == null
        ? null
        : MinorChecksCondition.fromJson(
            json['holderCondition'] as Map<String, dynamic>),
    otherFixturesCondition: json['otherFixturesCondition'] == null
        ? null
        : MinorChecksCondition.fromJson(
            json['otherFixturesCondition'] as Map<String, dynamic>),
    comment: json['comment'] as String,
    photos: (json['photos'] as List)?.map((e) => e as String)?.toList(),
  )
    ..windowFramesCondition = json['windowFramesCondition'] == null
        ? null
        : MinorChecksCondition.fromJson(
            json['windowFramesCondition'] as Map<String, dynamic>)
    ..windowPanelsCondition = json['windowPanelsCondition'] == null
        ? null
        : MinorChecksCondition.fromJson(
            json['windowPanelsCondition'] as Map<String, dynamic>);
}

Map<String, dynamic> _$WindowToJson(Window instance) => <String, dynamic>{
      'material': instance.material,
      'windowFramesCondition': instance.windowFramesCondition?.toJson(),
      'windowPanelsCondition': instance.windowPanelsCondition?.toJson(),
      'hingesCondition': instance.hingesCondition?.toJson(),
      'holderCondition': instance.holderCondition?.toJson(),
      'otherFixturesCondition': instance.otherFixturesCondition?.toJson(),
      'comment': instance.comment,
      'photos': instance.photos,
    };

Ceiling _$CeilingFromJson(Map<String, dynamic> json) {
  return Ceiling(
    photos: (json['photos'] as List)?.map((e) => e as String)?.toList(),
    comment: json['comment'] as String,
    paintingCondition: json['paintingCondition'] == null
        ? null
        : MinorChecksCondition.fromJson(
            json['paintingCondition'] as Map<String, dynamic>),
    plasteringCondition: json['plasteringCondition'] == null
        ? null
        : MinorChecksCondition.fromJson(
            json['plasteringCondition'] as Map<String, dynamic>),
    falseCeilingsCondition: json['falseCeilingsCondition'] == null
        ? null
        : MinorChecksCondition.fromJson(
            json['falseCeilingsCondition'] as Map<String, dynamic>),
    masonProblemCondition: json['masonProblemCondition'] == null
        ? null
        : MinorChecksCondition.fromJson(
            json['masonProblemCondition'] as Map<String, dynamic>),
    otherProblemCondition: json['otherProblemCondition'] == null
        ? null
        : MinorChecksCondition.fromJson(
            json['otherProblemCondition'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CeilingToJson(Ceiling instance) => <String, dynamic>{
      'paintingCondition': instance.paintingCondition?.toJson(),
      'plasteringCondition': instance.plasteringCondition?.toJson(),
      'falseCeilingsCondition': instance.falseCeilingsCondition?.toJson(),
      'masonProblemCondition': instance.masonProblemCondition?.toJson(),
      'otherProblemCondition': instance.otherProblemCondition?.toJson(),
      'photos': instance.photos,
      'comment': instance.comment,
    };

Wall _$WallFromJson(Map<String, dynamic> json) {
  return Wall(
    photos: (json['photos'] as List)?.map((e) => e as String)?.toList(),
    comment: json['comment'] as String,
    paintingCondition: json['paintingCondition'] == null
        ? null
        : MinorChecksCondition.fromJson(
            json['paintingCondition'] as Map<String, dynamic>),
    plasteringCondition: json['plasteringCondition'] == null
        ? null
        : MinorChecksCondition.fromJson(
            json['plasteringCondition'] as Map<String, dynamic>),
    masonProblemCondition: json['masonProblemCondition'] == null
        ? null
        : MinorChecksCondition.fromJson(
            json['masonProblemCondition'] as Map<String, dynamic>),
    otherProblemCondition: json['otherProblemCondition'] == null
        ? null
        : MinorChecksCondition.fromJson(
            json['otherProblemCondition'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$WallToJson(Wall instance) => <String, dynamic>{
      'paintingCondition': instance.paintingCondition?.toJson(),
      'plasteringCondition': instance.plasteringCondition?.toJson(),
      'masonProblemCondition': instance.masonProblemCondition?.toJson(),
      'otherProblemCondition': instance.otherProblemCondition?.toJson(),
      'photos': instance.photos,
      'comment': instance.comment,
    };

ElectricalFitting _$ElectricalFittingFromJson(Map<String, dynamic> json) {
  return ElectricalFitting(
    photos: (json['photos'] as List)?.map((e) => e as String)?.toList(),
    comment: json['comment'] as String,
    age: json['age'] as int,
    wiringCondition: json['wiringCondition'] == null
        ? null
        : MinorChecksCondition.fromJson(
            json['wiringCondition'] as Map<String, dynamic>),
    switchesCondition: json['switchesCondition'] == null
        ? null
        : MinorChecksCondition.fromJson(
            json['switchesCondition'] as Map<String, dynamic>),
    lightsCondition: json['lightsCondition'] == null
        ? null
        : MinorChecksCondition.fromJson(
            json['lightsCondition'] as Map<String, dynamic>),
    ceilingFanCondition: json['ceilingFanCondition'] == null
        ? null
        : MinorChecksCondition.fromJson(
            json['ceilingFanCondition'] as Map<String, dynamic>),
    otherAccessoriesCondition: json['otherAccessoriesCondition'] == null
        ? null
        : MinorChecksCondition.fromJson(
            json['otherAccessoriesCondition'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ElectricalFittingToJson(ElectricalFitting instance) =>
    <String, dynamic>{
      'wiringCondition': instance.wiringCondition?.toJson(),
      'switchesCondition': instance.switchesCondition?.toJson(),
      'lightsCondition': instance.lightsCondition?.toJson(),
      'ceilingFanCondition': instance.ceilingFanCondition?.toJson(),
      'otherAccessoriesCondition': instance.otherAccessoriesCondition?.toJson(),
      'age': instance.age,
      'photos': instance.photos,
      'comment': instance.comment,
    };

PestInspection _$PestInspectionFromJson(Map<String, dynamic> json) {
  return PestInspection(
    photos: (json['photos'] as List)?.map((e) => e as String)?.toList(),
    comment: json['comment'] as String,
    surroundingCondition: json['surroundingCondition'] as String,
  );
}

Map<String, dynamic> _$PestInspectionToJson(PestInspection instance) =>
    <String, dynamic>{
      'surroundingCondition': instance.surroundingCondition,
      'comment': instance.comment,
      'photos': instance.photos,
    };
