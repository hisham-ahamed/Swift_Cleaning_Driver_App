import 'package:json_annotation/json_annotation.dart';

part 'daily-cleaner.g.dart';

@JsonSerializable()
class DailyCleaner {
  DailyCleaner(
      this.avatarUrl,
      this.phonePrimary,
      this.phoneSecondary,
      this.email,
      this.id,
      this.firstName,
      this.lastName,
      this.nationality,
      this.date);

  @JsonKey(name: '_id')
  final String id;
  @JsonKey(name: 'avatar_url')
  final String avatarUrl;
  @JsonKey(name: 'phone_primary')
  final String phonePrimary;
  @JsonKey(name: 'phone_secondary')
  final String phoneSecondary;
  @JsonKey(name: 'email')
  final String email;
  @JsonKey(name: 'first_name')
  final String firstName;
  @JsonKey(name: 'last_name')
  final String lastName;
  @JsonKey(name: 'nationality')
  final String nationality;
  @JsonKey(name: 'date')
  final DateTime date;
  factory DailyCleaner.fromJson(Map<String, dynamic> json) =>
      _$DailyCleanerFromJson(json);
  Map<String, dynamic> toJson() => _$DailyCleanerToJson(this);
}
