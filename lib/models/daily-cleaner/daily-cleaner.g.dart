// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily-cleaner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DailyCleaner _$DailyCleanerFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const [
    '_id',
    'first_name',
    'last_name',
    'nationality',
    'date'
  ]);
  return DailyCleaner(
    json['avatar_url'] as String,
    json['phone_primary'] as String,
    json['phone_secondary'] as String,
    json['email'] as String,
    json['_id'] as String,
    json['first_name'] as String,
    json['last_name'] as String,
    json['nationality'] as String,
    DateTime.parse(json['date'] as String),
  );
}

Map<String, dynamic> _$DailyCleanerToJson(DailyCleaner instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'avatar_url': instance.avatarUrl,
      'phone_primary': instance.phonePrimary,
      'phone_secondary': instance.phoneSecondary,
      'email': instance.email,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'nationality': instance.nationality,
      'date': instance.date.toIso8601String(),
    };
