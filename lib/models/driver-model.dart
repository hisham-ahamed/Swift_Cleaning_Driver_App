class Driver {
  final String id;
  final String? avatarUrl;
  final String? email;
  final String phoneNumber;
  final int driverCode;
  final String password;
  final String? userName;
  final String firstName;
  final String lastName;
  final String date;

  Driver(
      {required this.id,
      this.avatarUrl,
      this.email,
      required this.phoneNumber,
      required this.driverCode,
      required this.password,
      this.userName,
      required this.firstName,
      required this.lastName,
      required this.date});

  factory Driver.fromJson(Map<String, dynamic> json) => Driver(
      id: json['_id'],
      avatarUrl: json['avatar_url'],
      email: json['email'],
      phoneNumber: json['phone_number'],
      driverCode: json['driver_code'],
      password: json['password'],
      userName: json['username'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      date: json['date']);
}

class DriverToJson {
  static Map<String, dynamic> toJson(Driver driver) {
    return {
      "avatar_url": driver.avatarUrl,
      "email": driver.email,
      "phone_number": driver.phoneNumber,
      "driver_code": driver.driverCode,
      "password": driver.password,
      "username": driver.userName,
      "_id": driver.id,
      "first_name": driver.firstName,
      "last_name": driver.lastName,
      "date": driver.date,
    };
  }
}
