import 'package:driverapp/models/customer/customer.dart';
import 'package:driverapp/models/daily-cleaner/daily-cleaner.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order.g.dart';

@JsonSerializable()
class OrderData {
  OrderData(
      this.id,
      this.area,
      this.dailyCleanerList,
      this.orderNumber,
      this.customer,
      this.orderDay,
      this.orderMonth,
      this.orderYear,
      this.shift,
      this.location,
      this.hourlyPrice,
      this.termsOfPayment,
      this.user,
      this.date);

  @JsonKey(name: '_id')
  final String id;
  @JsonKey(name: 'area')
  final String area;
  @JsonKey(name: 'daily_cleaners_list')
  final List<DailyCleaner> dailyCleanerList;
  @JsonKey(name: 'order_number')
  final String orderNumber;
  @JsonKey(name: 'customer')
  final Customer customer;
  @JsonKey(name: 'order_day')
  final int orderDay;
  @JsonKey(name: 'order_month')
  final int orderMonth;
  @JsonKey(name: 'order_year')
  final int orderYear;
  @JsonKey(name: 'shift')
  final String shift;
  @JsonKey(name: 'location')
  final String location;
  @JsonKey(name: 'hourly_price')
  final String hourlyPrice;
  @JsonKey(name: 'terms_of_payment')
  final String termsOfPayment;
  @JsonKey(name: 'user')
  final String user;
  @JsonKey(name: 'date')
  final DateTime date;

  factory OrderData.fromJson(Map<String, dynamic> json) =>
      _$OrderDataFromJson(json);

  Map<String, dynamic> toJson() => _$OrderDataToJson(this);
}
