// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Customer _$CustomerFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['_id', 'phone_primary']);
  return Customer(
    json['_id'] as String,
    json['first_name'] as String,
    json['last_name'] as String,
    json['phone_primary'] as String,
    json['phone_secondary'] as String,
  );
}

Map<String, dynamic> _$CustomerToJson(Customer instance) => <String, dynamic>{
      '_id': instance.id,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'phone_primary': instance.phonePrimary,
      'phone_secondary': instance.phoneSecondary,
    };
