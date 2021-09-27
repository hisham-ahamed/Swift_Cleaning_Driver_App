// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderData _$OrderDataFromJson(Map<String, dynamic> json) {
  print('Hisham');
  return OrderData(
    json['_id'] as String,
    json['area'] as String,
    (json['daily_cleaners_list'] as List<dynamic>)
        .map<DailyCleaner>(
            (e) => DailyCleaner.fromJson(e as Map<String, dynamic>))
        .toList(),
    json['order_number'] as String,
    Customer.fromJson(json['customer'] as Map<String, dynamic>),
    json['order_day'] as int,
    json['order_month'] as int,
    json['order_year'] as int,
    json['shift'] as String,
    json['location'] as String,
    json['hourly_price'] as String,
    json['terms_of_payment'] as String,
    json['user'] as String,
    DateTime.parse(json['date'] as String),
  );
}

Map<String, dynamic> _$OrderDataToJson(OrderData instance) => <String, dynamic>{
      '_id': instance.id,
      'area': instance.area,
      'daily_cleaners_list': instance.dailyCleanerList,
      'order_number': instance.orderNumber,
      'customer': instance.customer,
      'order_day': instance.orderDay,
      'order_month': instance.orderMonth,
      'order_year': instance.orderYear,
      'shift': instance.shift,
      'location': instance.location,
      'hourly_price': instance.hourlyPrice,
      'terms_of_payment': instance.termsOfPayment,
      'user': instance.user,
      'date': instance.date.toIso8601String(),
    };
