import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pretty_http_logger/pretty_http_logger.dart';

import '../../constant/colors.dart';
import '../../constant/consolidate-portfolio/api_end_point.dart';
import '../../model/consolidated-portfolio/LatestSIPResponse.dart';
import '../../utils/app_utils.dart';
import '../../utils/base_class.dart';
import '../../widget/loading.dart';
import '../../widget/no_data.dart';

class CPLatestSIPPage extends StatefulWidget {
  const CPLatestSIPPage({Key? key}) : super(key: key);

  @override
  BaseState<CPLatestSIPPage> createState() => CPLatestSIPPageState();
}

class CPLatestSIPPageState extends BaseState<CPLatestSIPPage> {
  bool _isLoading = false;
  List<SipStpDetails> listData =
  List<SipStpDetails>.empty(growable: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 60,
          automaticallyImplyLeading: false,
          backgroundColor: appBg,
          elevation: 0,
          centerTitle: false,
          title: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(right: 8),
                  child: Image.asset('assets/images/ic_back_arrow.png', width: 30, height: 30),
                ),
              ),
              const Expanded(
                  child: Text(
                    "Latest SIP - Last 30 Days",
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 18, color: blue, fontWeight: FontWeight.w600),
                  )),
            ],
          )),
      backgroundColor: const Color(0XffEDEDEE),
      body: SafeArea(
        top: false,
        child:  _isLoading
            ? const LoadingWidget()
            : Container(
          margin: const EdgeInsets.only(top: 8),
          child: Column(
            children: [
              Expanded(
                  child: Padding(
                      padding: const EdgeInsets.only(left: 6, right: 6),
                      child: Stack(
                        children: [
                          listData.isNotEmpty
                              ? Column(children: [
                            Container(
                              padding: const EdgeInsets.only(left: 8,right: 8,top: 14,bottom: 14),
                              decoration: const BoxDecoration(
                                  color:semiBlue,
                                  borderRadius: BorderRadius.only(topLeft:Radius.circular(8),topRight: Radius.circular(8))),
                              child: Row(
                                children: const [
                                  Expanded(
                                      flex: 2,
                                      child: Text('Fund Name',
                                          style: TextStyle(
                                              color: blue,
                                              fontSize: 16,
                                              fontWeight:
                                              FontWeight.w600))),
                                  Expanded(
                                      flex: 1,
                                      child: Text('Folio No',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: blue,
                                              fontSize: 16,
                                              fontWeight:
                                              FontWeight.w600))),
                                  Expanded(
                                      flex: 1,
                                      child: Text('Tran Date',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: blue,
                                              fontSize: 16,
                                              fontWeight:
                                              FontWeight.w600))),
                                  Expanded(
                                      flex: 1,
                                      child: Text('Amount',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: blue,
                                              fontSize: 16,
                                              fontWeight:
                                              FontWeight.w600))),
                                ],
                              ),
                            ),
                            Container(
                              child: _itemList(),
                            ),
                          ])
                              : const MyNoDataWidget(msg: "No data found."),
                        ],
                      )))
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _getLatestSIPData();
  }

  ListView _itemList() {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: const AlwaysScrollableScrollPhysics(),
        primary: false,
        padding: EdgeInsets.zero,
        itemCount: listData.length,
        itemBuilder: (ctx, index) => (Container(
          alignment: Alignment.center,
          width: double.infinity,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 8,right: 8,top: 14,bottom: 14),
                decoration: BoxDecoration(
                    color: index % 2 == 0 ? white : semiBlue,
                    borderRadius: index == listData.length - 1 ? const BorderRadius.only(bottomLeft:Radius.circular(8),bottomRight: Radius.circular(8)) : const BorderRadius.all(Radius.circular(0))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    index == listData.length - 1
                        ? Row(
                      children: [
                        Expanded(
                            flex: 2,
                            child: Text(
                                toDisplayCase(listData[index]
                                    .schemeName
                                    .toString()),
                                style: const TextStyle(
                                    color: black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700))),
                        const Expanded(
                            flex: 1,
                            child: Text("",
                                style: TextStyle(
                                    color: black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w200))),
                        const Expanded(
                            flex: 1,
                            child: Text("",
                                style: TextStyle(
                                    color: black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w200))),
                        Expanded(
                            flex: 1,
                            child: Text(
                                listData[index].amount.toString(),
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    color: black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700))),
                      ],
                    )
                        : Row(
                      children: [
                        Expanded(
                            flex: 2,
                            child: Text(
                                toDisplayCase(listData[index]
                                    .schemeName
                                    .toString()),
                                style: const TextStyle(
                                    color: black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700))),
                        Expanded(
                            flex: 1,
                            child: Text(
                                listData[index].folioNo.toString(),
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    color: black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w200))),
                        Expanded(
                            flex: 1,
                            child: Text(
                                listData[index].tranDate.toString(),
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    color: black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w200))),
                        Expanded(
                            flex: 1,
                            child: Text(
                                listData[index].amount.toString(),
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    color: black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w200))),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        )));
  }

  _getLatestSIPData() async {
    setState(() {
      _isLoading = true;
    });
    HttpWithMiddleware http = HttpWithMiddleware.build(middlewares: [
      HttpLogger(logLevel: LogLevel.BODY),
    ]);

    final url = Uri.parse(API_URL_CP+latestTransaction);
    Map<String, String> jsonBody = {
      'user_id': sessionManagerPMS.getUserId().trim(),
    };

    final response = await http.post(url, body: jsonBody);
    final statusCode = response.statusCode;
    final body = response.body;
    Map<String, dynamic> user = jsonDecode(body);
    var dataResponse = LatestSipResponse.fromJson(user);

    if (statusCode == 200 && dataResponse.success == 1) {
      try {
        if(dataResponse.sipStpDetails != null){
          listData = dataResponse.sipStpDetails!;
          setState(() {
            _isLoading = false;
          });
        }

      } catch (e) {
        setState(() {
          _isLoading = false;
        });
        if (kDebugMode) {
          print(e);
        }
      }
    } else {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void castStatefulWidget() {
    widget is CPLatestSIPPage;
  }
}
