import 'package:driverapp/config/constants.dart';
import 'package:driverapp/config/url.dart';
import 'package:driverapp/services/http-service.dart';
import 'package:driverapp/services/screen-service.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

class ViewOrder extends StatefulWidget {
  final List<dynamic> data;
  final int index;
  const ViewOrder({Key? key, required this.data, required this.index})
      : super(key: key);

  @override
  _ViewOrderState createState() => _ViewOrderState();
}

class _ViewOrderState extends State<ViewOrder> {
  List<Widget> _allCleanerNames = [];
  bool visible = false;
  String dropdownValue = 'Delivered';
  String _advanceAmount = "0";
  bool driverCancelStatus = false;
  bool driverDeliveredStatus = true;
  @override
  Widget build(BuildContext context) {
    driverDeliveredStatus = !driverCancelStatus;
    if (_advanceAmount == "") _advanceAmount = "0";
    // if (dropdownValue != "Cancelled")
    //   driverCancelStatus =
    //       widget.data[widget.index]['driver_cancel_status'] as bool;
    List<dynamic> cleaners = widget.data[widget.index]['daily_cleaners_list'];
    _allCleanerNames.clear();
    cleaners.forEach((e) {
      _allCleanerNames.add(Text('${e['first_name']} ${e['last_name']}'));
    });
    return Scaffold(
      appBar: AppBar(
        title: Text('View Order'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    '#' + widget.data[widget.index]['order_number'].toString(),
                    style: TextStyle(
                        fontSize: 20.0,
                        color: widget.data[widget.index]['driver_cancel_status']
                                as bool
                            ? Colors.red
                            : dropdownValue == "Cancelled"
                                ? Colors.red
                                : widget.data[widget.index]
                                        ['driver_delivered_status'] as bool
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
                    widget.data[widget.index]['shift'].toString(),
                    style: TextStyle(
                      fontSize: 14.0,
                      color: kPrimaryColor,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30.0),
              Divider(thickness: 1.0),
              Row(
                children: [
                  Icon(
                    Icons.calendar_today_outlined,
                    size: 16.0,
                  ),
                  SizedBox(width: 20.0),
                  Text(
                    widget.data[widget.index]['order_day'].toString() +
                        '/' +
                        widget.data[widget.index]['order_month'].toString() +
                        '/' +
                        widget.data[widget.index]['order_year'].toString(),
                    style: TextStyle(
                      fontSize: 14.0,
                      color: kPrimaryColor,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.0),
              Divider(thickness: 1.0),
              GestureDetector(
                onTap: () async {
                  await UrlLauncher.launch(
                      '${widget.data[widget.index]['location']}');
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.directions,
                      size: 20.0,
                    ),
                    SizedBox(width: 10.0),
                    Text(
                      widget.data[widget.index]['area'],
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
              ),
              SizedBox(height: 10.0),
              Divider(thickness: 1.0),
              Row(
                children: [
                  Icon(
                    Icons.person_outline,
                    size: 16.0,
                  ),
                  SizedBox(width: 20.0),
                  Text(
                    widget.data[widget.index]['customer']['first_name']
                            .toString() +
                        ' ' +
                        widget.data[widget.index]['customer']['last_name']
                            .toString(),
                    style: TextStyle(
                      fontSize: 14.0,
                      color: kPrimaryColor,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.0),
              Divider(thickness: 1.0),
              GestureDetector(
                onTap: () async {
                  await UrlLauncher.launch(
                      'tel://${widget.data[widget.index]['customer']['phone_primary']}');
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.person_outline,
                      size: 20.0,
                    ),
                    SizedBox(width: 20.0),
                    Text(
                      '${widget.data[widget.index]['customer']['phone_primary']}',
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
              ),
              SizedBox(height: 10.0),
              Divider(thickness: 1.0),
              Row(
                children: [
                  Icon(
                    Icons.monetization_on_rounded,
                    size: 16.0,
                  ),
                  SizedBox(width: 20.0),
                  Text(
                    'Hourly Price ' +
                        widget.data[widget.index]['hourly_price'].toString(),
                    style: TextStyle(
                      fontSize: 14.0,
                      color: kPrimaryColor,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.0),
              Divider(thickness: 1.0),
              Row(
                children: [
                  Icon(
                    Icons.monetization_on_rounded,
                    size: 16.0,
                  ),
                  SizedBox(width: 20.0),
                  Text(
                    'Total Price ' +
                        '${int.parse(widget.data[widget.index]["hourly_price"]) * _allCleanerNames.length}',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: kPrimaryColor,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.0),
              Divider(thickness: 1.0),
              Row(
                children: [
                  Icon(
                    Icons.work,
                    size: 16.0,
                  ),
                  SizedBox(width: 20.0),
                  Text(
                    'Terms Of Payment ',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: kPrimaryColor,
                    ),
                  ),
                  Spacer(),
                  Text(widget.data[widget.index]['terms_of_payment'].toString(),
                      style: TextStyle(
                        fontSize: 14.0,
                        color: kPrimaryColor,
                      ))
                ],
              ),
              SizedBox(height: 10.0),
              Divider(thickness: 1.0),
              Row(
                children: [
                  Icon(
                    Icons.contact_page_outlined,
                    size: 16.0,
                  ),
                  SizedBox(width: 20.0),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: _allCleanerNames),
                ],
              ),
              SizedBox(height: 10.0),
              Divider(thickness: 1.0),
              Row(
                children: [
                  Icon(
                    Icons.contact_page_outlined,
                    size: 16.0,
                  ),
                  SizedBox(width: 20.0),
                  Flexible(
                    child: DropdownButton<String>(
                      value: dropdownValue,
                      isExpanded: true,
                      elevation: 16,
                      onChanged: (String? newValue) {
                        dropdownValue = newValue!;
                        if (dropdownValue == 'Cancelled')
                          driverCancelStatus = true;
                        else
                          driverCancelStatus = false;
                        if (dropdownValue != 'Advance and Deliver')
                          _advanceAmount = "0";
                        // print(driverCancelStatus);
                        setState(() {});
                      },
                      items: <String>[
                        'Advance and Deliver',
                        'Cancelled',
                        'Delivered'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
              Divider(thickness: 1.0),
              Visibility(
                visible: dropdownValue == "Advance and Deliver",
                child: TextField(
                  decoration: InputDecoration(hintText: 'Advance Amount'),
                  onChanged: (value) {
                    this._advanceAmount = value;
                  },
                ),
              ),
              SizedBox(height: 15.0),
              Visibility(
                visible: !visible,
                child: GestureDetector(
                  onTap: () async {
                    if (_advanceAmount == "") _advanceAmount = "0";
                    // print(widget.data[widget.index]['_id'].toString());
                    // print(widget.data[widget.index]['driver_cancel_status']);
                    // print(this._advanceAmount);
                    Map<String, dynamic> _data = {
                      "driver_cancel_status": driverCancelStatus,
                      "driver_delivered_status": driverDeliveredStatus,
                      "advance_amount": _advanceAmount
                    };
                    // print(_data);
                    setState(() {
                      this.visible = true;
                    });
                    String _url = Url.dailyCleaningOrder +
                        '/${widget.data[widget.index]['_id'].toString()}';

                    await HttpService.patch(_url, _data);
                    Navigator.pop(context);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: kPrimaryColor,
                    ),
                    padding: EdgeInsets.all(8.0),
                    width: double.infinity,
                    height: Screen.height * 0.065,
                    child: Center(
                      child: Text(
                        'Save',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: visible,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: kPrimaryColor,
                  ),
                  padding: EdgeInsets.all(8.0),
                  width: double.infinity,
                  height: Screen.height * 0.065,
                  child: Center(
                    child: Text(
                      'Loading..',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
