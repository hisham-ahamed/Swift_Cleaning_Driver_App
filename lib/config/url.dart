class Url {
  static String baseUrl = 'https://swift-cleaning-backend.herokuapp.com/';
  // static String baseUrl = 'http://localhost:3000/';
  // static String baseUrl = 'http://10.0.2.2:3000/';
  static String driverLogin = Url.baseUrl + 'api/login/driver';
  static String driverOrder = Url.baseUrl + 'api/driver/orders';
  static String dailyCleaningOrder = Url.baseUrl + 'api/daily-cleaning';
}
