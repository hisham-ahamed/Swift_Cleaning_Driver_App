import 'package:driverapp/config/constants.dart';
import 'package:driverapp/config/url.dart';
import 'package:driverapp/models/global-data.dart';
import 'package:driverapp/screens/login-screen.dart';
import 'package:driverapp/screens/view-orders.dart';
import 'package:driverapp/services/http-service.dart';
import 'package:driverapp/services/screen-service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool reload = false;
  DateTime _dateSelected = DateTime.now();
  final _storage = FlutterSecureStorage();
  int index = 0;
  late String orderUrl;
  List<dynamic> dataList = [];
  List<dynamic> originalDataList = [];
  String dropdownValue = 'None';

  Future<List<dynamic>> _futureFunction(String url) async {
    List<dynamic> dataList = await HttpService.get(url);
    return dataList;
  }

  Widget _navigation(int index) {
    switch (index) {
      case 0:
        return Container(
          width: double.infinity,
          height: Screen.height * 0.7,
          child: dataList.length != 0
              ? ListView.builder(
                  itemCount: dataList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ViewOrder(
                                        data: dataList,
                                        index: index,
                                      )));
                        },
                        child: Container(
                            width: double.infinity,
                            color: Color(0xFFD1D9E0),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        '#' + dataList[index]['order_number'],
                                        style: TextStyle(
                                            fontSize: 15.0,
                                            color: dataList[index]
                                                        ['driver_cancel_status']
                                                    as bool
                                                ? Colors.red
                                                : dropdownValue == "Cancelled"
                                                    ? Colors.red
                                                    : dataList[index][
                                                                'driver_delivered_status']
                                                            as bool
                                                        ? Colors.green
                                                        : kPrimaryColor,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Spacer(),
                                      Icon(
                                        Icons.filter_none,
                                        size: 16.0,
                                      ),
                                      SizedBox(width: 10.0),
                                      Text(
                                        dataList[index]['shift'],
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          color: kPrimaryColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Divider(),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.directions,
                                        size: 20.0,
                                      ),
                                      SizedBox(width: 10.0),
                                      Text(
                                        dataList[index]['area'],
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          color: kPrimaryColor,
                                        ),
                                      ),
                                      Spacer(),
                                      Icon(
                                        Icons.location_on_outlined,
                                        size: 20.0,
                                      ),
                                      SizedBox(width: 10.0),
                                    ],
                                  ),
                                  Divider(),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.person_outline,
                                        size: 20.0,
                                      ),
                                      SizedBox(width: 10.0),
                                      Text(
                                        '${dataList[index]['customer']['phone_primary']}',
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          color: kPrimaryColor,
                                        ),
                                      ),
                                      Spacer(),
                                      Icon(
                                        Icons.call,
                                        size: 20.0,
                                      ),
                                      SizedBox(width: 10.0),
                                    ],
                                  ),
                                  Divider(
                                    color: kPrimaryColor,
                                    thickness: 1.0,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.calendar_today_outlined,
                                        size: 20.0,
                                      ),
                                      SizedBox(width: 10.0),
                                      Text(
                                        dataList[index]['order_day']
                                                .toString() +
                                            '/' +
                                            dataList[index]['order_month']
                                                .toString() +
                                            '/' +
                                            dataList[index]['order_year']
                                                .toString(),
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          color: kPrimaryColor,
                                        ),
                                      ),
                                      Spacer(),
                                      Icon(
                                        Icons.more_horiz,
                                        size: 20.0,
                                      ),
                                      SizedBox(width: 10.0),
                                    ],
                                  ),
                                ],
                              ),
                            )),
                      ),
                    );
                  })
              : Center(
                  child: Text('No Deliveries Today'),
                ),
        );
      case 1:
        List<dynamic> _allCleaners = [];
        dataList.forEach((element) {
          List<dynamic> _cleaners = element['daily_cleaners_list'];
          List<dynamic> _cleanerData = _cleaners
              .map((e) => {
                    "shift": element['shift'],
                    "name": '${e['first_name']} ${e['last_name']}',
                  })
              .toList();
          _allCleaners..addAll(_cleanerData);
        });
        return Container(
          width: double.infinity,
          height: Screen.height * 0.7,
          child: _allCleaners.length != 0
              ? ListView.builder(
                  itemCount: _allCleaners.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        width: double.infinity,
                        height: Screen.height * 0.05,
                        color: Color(0xFFD1D9E0),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: Icon(Icons.face),
                            ),
                            Text(_allCleaners[index]['name'].toString()),
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(right: 5.0),
                              child: Icon(
                                Icons.filter_none,
                                size: 16.0,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 15.0),
                              child:
                                  Text(_allCleaners[index]['shift'].toString()),
                            )
                          ],
                        ),
                      ),
                    );
                  })
              : Center(child: Text('No Deliveries Today')),
        );
      default:
        return Center(child: Text('No Deliveries Today'));
    }
  }

  // initFn() async {
  //   print('trigger');
  //   List<OrderData> orderData = await DriverFunctions.getOrders(
  //       'http://10.0.2.2:3000/api/driver/orders/60cd950be04a000a9c073546?year=2021&month=7&date=10');
  //   print(orderData.length);
  // }

  @override
  void initState() {
    // this.initFn();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    orderUrl = Url.driverOrder +
        '/${GlobalData.driver!.id}?year=${_dateSelected.year}&month=${_dateSelected.month - 1}&date=${_dateSelected.day}';
    return Scaffold(
      backgroundColor: Color(0xFFE3EBF3),
      appBar: AppBar(
        actions: [
          TextButton(
            child: Icon(Icons.refresh, color: Colors.white),
            onPressed: () {
              setState(() {
                this.reload = true;
              });
              Future.delayed(Duration(seconds: 1)).then((value) => {
                    setState(() {
                      this.reload = false;
                    })
                  });
            },
          ),
          TextButton(
            child: Icon(Icons.logout, color: Colors.white),
            onPressed: () => showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: const Text('Log Out!'),
                content: const Text('Do you really wish to log out?'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Cancel'),
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () async {
                      await _storage.delete(key: 'Driver');
                      Navigator.pop(context);
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                    },
                    child: const Text('OK'),
                  ),
                ],
              ),
            ),
          )
        ],
        backgroundColor: kAccentColor,
        title: Text('All Orders'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.receipt), label: 'Orders'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: 'Cleaners'),
          // BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings')
        ],
        onTap: (int value) {
          setState(() {
            index = value;
          });
        },
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      child: Text(
                        '${_dateSelected.day}/${_dateSelected.month}/${_dateSelected.year}',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: kPrimaryColor,
                        ),
                      ),
                      onPressed: () async {
                        final _datePicked = await showDatePicker(
                            context: context,
                            initialDate: _dateSelected,
                            firstDate: DateTime(2015, 1),
                            lastDate: DateTime(2100));
                        if (_datePicked != null && _datePicked != _dateSelected)
                          setState(() {
                            _dateSelected = _datePicked;
                          });
                      },
                    ),
                    DropdownButton<String>(
                      value: dropdownValue,
                      elevation: 16,
                      onChanged: (String? newValue) {
                        dropdownValue = newValue!;

                        setState(() {});
                      },
                      items: <String>['None', 'First Shift', 'Second Shift']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ]),
            ),
            Container(
                child: !reload
                    ? FutureBuilder(
                        future: _futureFunction(orderUrl),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.hasData) {
                            dataList = snapshot.data;
                            originalDataList = snapshot.data;
                            if (dropdownValue != 'None') {
                              if (dropdownValue == 'First Shift')
                                dataList = dataList
                                    .where((element) =>
                                        element['shift'] == 'First Shift')
                                    .toList();
                              if (dropdownValue == 'Second Shift')
                                dataList = dataList
                                    .where((element) =>
                                        element['shift'] == 'Second Shift')
                                    .toList();
                            }
                            return _navigation(index);
                          } else
                            return Center(
                                child: CircularProgressIndicator(
                                    color: kPrimaryColor));
                        },
                      )
                    : Text('Reloading..')),
          ],
        ),
      ),
    );
  }
}
