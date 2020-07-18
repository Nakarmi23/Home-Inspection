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
        ?.map((e) =>
            e == null ? null : Carpentry.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    metalAluminiumWork: (json['metalAluminiumWork'] as List)
        ?.map((e) => e == null
            ? null
            : MetalAluminiumWork.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    cleaning: (json['cleaning'] as List)
        ?.map((e) =>
            e == null ? null : Cleaning.fromJson(e as Map<String, dynamic>))
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
    doorFramesCondition: json['doorFramesCondition'] as bool,
    doorPanelsCondition: json['doorPanelsCondition'] as bool,
    hingesCondition: json['hingesCondition'] as bool,
    holderCondition: json['holderCondition'] as bool,
    otherFixturesCondition: json['otherFixturesCondition'] as bool,
    condition: json['condition'] as String,
    photos: (json['photos'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$DoorToJson(Door instance) => <String, dynamic>{
      'material': instance.material,
      'doorFramesCondition': instance.doorFramesCondition,
      'doorPanelsCondition': instance.doorPanelsCondition,
      'hingesCondition': instance.hingesCondition,
      'holderCondition': instance.holderCondition,
      'otherFixturesCondition': instance.otherFixturesCondition,
      'condition': instance.condition,
      'photos': instance.photos,
    };

Window _$WindowFromJson(Map<String, dynamic> json) {
  return Window(
    material: json['material'] as String,
    doorFramesCondition: json['doorFramesCondition'] as bool,
    doorPanelsCondition: json['doorPanelsCondition'] as bool,
    hingesCondition: json['hingesCondition'] as bool,
    holderCondition: json['holderCondition'] as bool,
    otherFixturesCondition: json['otherFixturesCondition'] as bool,
    condition: json['condition'] as String,
    photos: (json['photos'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$WindowToJson(Window instance) => <String, dynamic>{
      'material': instance.material,
      'doorFramesCondition': instance.doorFramesCondition,
      'doorPanelsCondition': instance.doorPanelsCondition,
      'hingesCondition': instance.hingesCondition,
      'holderCondition': instance.holderCondition,
      'otherFixturesCondition': instance.otherFixturesCondition,
      'condition': instance.condition,
      'photos': instance.photos,
    };

Ceiling _$CeilingFromJson(Map<String, dynamic> json) {
  return Ceiling(
    photos: (json['photos'] as List)?.map((e) => e as String)?.toList(),
    condition: json['condition'] as String,
    paintingCondition: json['paintingCondition'] as bool,
    plasteringCondition: json['plasteringCondition'] as bool,
    falseCeilingsCondition: json['falseCeilingsCondition'] as bool,
    masonProblemCondition: json['masonProblemCondition'] as bool,
    otherProblemCondition: json['otherProblemCondition'] as bool,
  );
}

Map<String, dynamic> _$CeilingToJson(Ceiling instance) => <String, dynamic>{
      'photos': instance.photos,
      'condition': instance.condition,
      'paintingCondition': instance.paintingCondition,
      'plasteringCondition': instance.plasteringCondition,
      'falseCeilingsCondition': instance.falseCeilingsCondition,
      'masonProblemCondition': instance.masonProblemCondition,
      'otherProblemCondition': instance.otherProblemCondition,
    };

Wall _$WallFromJson(Map<String, dynamic> json) {
  return Wall(
    photos: (json['photos'] as List)?.map((e) => e as String)?.toList(),
    condition: json['condition'] as String,
    paintingCondition: json['paintingCondition'] as bool,
    plasteringCondition: json['plasteringCondition'] as bool,
    masonProblemCondition: json['masonProblemCondition'] as bool,
    otherProblemCondition: json['otherProblemCondition'] as bool,
  );
}

Map<String, dynamic> _$WallToJson(Wall instance) => <String, dynamic>{
      'photos': instance.photos,
      'condition': instance.condition,
      'paintingCondition': instance.paintingCondition,
      'plasteringCondition': instance.plasteringCondition,
      'masonProblemCondition': instance.masonProblemCondition,
      'otherProblemCondition': instance.otherProblemCondition,
    };

ElectricalFitting _$ElectricalFittingFromJson(Map<String, dynamic> json) {
  return ElectricalFitting(
    photos: (json['photos'] as List)?.map((e) => e as String)?.toList(),
    condition: json['condition'] as String,
    wiringCondition: json['wiringCondition'] as bool,
    switchesCondition: json['switchesCondition'] as bool,
    lightsCondition: json['lightsCondition'] as bool,
    ceilingFanCondition: json['ceilingFanCondition'] as bool,
    otherAccessoriesCondition: json['otherAccessoriesCondition'] as bool,
  );
}

Map<String, dynamic> _$ElectricalFittingToJson(ElectricalFitting instance) =>
    <String, dynamic>{
      'photos': instance.photos,
      'condition': instance.condition,
      'wiringCondition': instance.wiringCondition,
      'switchesCondition': instance.switchesCondition,
      'lightsCondition': instance.lightsCondition,
      'ceilingFanCondition': instance.ceilingFanCondition,
      'otherAccessoriesCondition': instance.otherAccessoriesCondition,
    };

PestInspection _$PestInspectionFromJson(Map<String, dynamic> json) {
  return PestInspection(
    photos: (json['photos'] as List)?.map((e) => e as String)?.toList(),
    condition: json['condition'] as String,
    surroundingCondition: json['surroundingCondition'] as String,
  );
}

Map<String, dynamic> _$PestInspectionToJson(PestInspection instance) =>
    <String, dynamic>{
      'photos': instance.photos,
      'condition': instance.condition,
      'surroundingCondition': instance.surroundingCondition,
    };

Carpentry _$CarpentryFromJson(Map<String, dynamic> json) {
  return Carpentry(
    photos: (json['photos'] as List)?.map((e) => e as String)?.toList(),
    condition: json['condition'] as String,
  );
}

Map<String, dynamic> _$CarpentryToJson(Carpentry instance) => <String, dynamic>{
      'photos': instance.photos,
      'condition': instance.condition,
    };

MetalAluminiumWork _$MetalAluminiumWorkFromJson(Map<String, dynamic> json) {
  return MetalAluminiumWork(
    photos: (json['photos'] as List)?.map((e) => e as String)?.toList(),
    condition: json['condition'] as String,
  );
}

Map<String, dynamic> _$MetalAluminiumWorkToJson(MetalAluminiumWork instance) =>
    <String, dynamic>{
      'photos': instance.photos,
      'condition': instance.condition,
    };

Cleaning _$CleaningFromJson(Map<String, dynamic> json) {
  return Cleaning(
    photos: (json['photos'] as List)?.map((e) => e as String)?.toList(),
    condition: json['condition'] as String,
  );
}

Map<String, dynamic> _$CleaningToJson(Cleaning instance) => <String, dynamic>{
      'photos': instance.photos,
      'condition': instance.condition,
    };
