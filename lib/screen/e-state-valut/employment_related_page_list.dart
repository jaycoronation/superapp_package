import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pretty_http_logger/pretty_http_logger.dart';
import '../../../constant/colors.dart';
import '../../../utils/base_class.dart';
import '../../constant/e-state-valut/api_end_point.dart';
import '../../model/CommanResponse.dart';
import '../../model/e-state-vault/EmploymentRelatedResponse.dart';
import '../../utils/app_utils.dart';
import '../../utils/my_toolbar.dart';
import '../../widget/loading.dart';
import '../../widget/no_data.dart';
import 'add_employment_related.dart';

class EmploymentRelatedListPage extends StatefulWidget {
  const EmploymentRelatedListPage({Key? key}) : super(key: key);

  @override
  _EmploymentRelatedListPageState createState() => _EmploymentRelatedListPageState();
}

class _EmploymentRelatedListPageState extends BaseState<EmploymentRelatedListPage> {
  bool _isLoading = false;
  List<EmploymentRelatedDetails> listData = List<EmploymentRelatedDetails>.empty(growable: true);

  @override
  void initState() {
    super.initState();
    if (isOnline) {
      _getApiData();
    } else {
      noInterNet(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: appBg,
      appBar: AppBar(
        toolbarHeight: 55,
        automaticallyImplyLeading: false,
        title: const MyToolBar(pageName: "Employment Related"),
        centerTitle: false,
        elevation: 0,
        backgroundColor: appBg,
      ),
      body: SafeArea(
        top: false,
        child: _isLoading
            ? const LoadingWidget()
            : Column(
                children: [
                  Expanded(
                      child: Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: Stack(
                            children: [
                              listData.isNotEmpty ? Container(
                                child: _itemList(),
                              ) : const MyNoDataWidget(msg: "No data found."),
                              Positioned(
                                  bottom: 40,
                                  right: 10,
                                  child: InkWell(
                                    onTap: ()
                                    {
                                      _redirectAdd(EmploymentRelatedDetails(),false);
                                    },
                                    child: Container(
                                    width: 48,
                                    height: 48,
                                    decoration: const BoxDecoration(color: blue, borderRadius: BorderRadius.all(Radius.circular(10))),
                                    child: const Icon(Icons.add, color: white, size: 32)),
                                  ))
                            ],
                          )))
                ],
              ),
      )
    );
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
          color: white,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(15),
                margin: const EdgeInsets.only(top: 8, bottom: 8),
                decoration: const BoxDecoration(color: semiBlue, borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Spacer(),
                        GestureDetector(
                          onTap: (){
                            _redirectAdd(listData[index],true);
                          },
                          child: Container(
                            width: 32,
                            height: 32,
                            decoration: const BoxDecoration(color: grayLight, borderRadius: BorderRadius.all(Radius.circular(30))),
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Image.asset('assets/images/fin_plan_ic_edit_gray.png', width: 24, height: 24, color: black),
                            ),
                          ),
                        ),
                        const Gap(10),
                        InkWell(
                          onTap: (){
                            deleteListData(listData[index], index);
                          },
                          child: Container(
                              width: 32,
                              height: 32,
                              decoration: const BoxDecoration(color: grayLight, borderRadius: BorderRadius.all(Radius.circular(30))),
                              child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: Image.asset('assets/images/fin_plan_ic_delete_black.png', width: 24, height: 24, color: black),
                              )),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Expanded(flex: 2, child: Text(
                          "Type, Name and Amount",
                          style: TextStyle(color: black, fontSize: 16, fontWeight: FontWeight.w600),
                        )),
                        const Text(
                          " : ",
                          style: TextStyle(color: black, fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                        Expanded(flex: 4, child: Text(
                          checkValidString(listData[index].typeNatureAmount),
                          style: const TextStyle(color: black, fontSize: 16, fontWeight: FontWeight.w600),
                        )),
                      ],
                    ),
                    Gap(4),
                    Row(
                      children: [
                        const Expanded(flex: 2, child: Text(
                          "Holder Name",
                          style: TextStyle(color: black, fontSize: 16, fontWeight: FontWeight.w500),
                        )),
                        const Text(
                          " : ",
                          style: TextStyle(color: black, fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                        Expanded(flex: 4, child: Text(
                          checkValidString(listData[index].holderName),
                          style: const TextStyle(color: black, fontSize: 16, fontWeight: FontWeight.w500),
                        )),
                      ],
                    ),
                    Gap(4),
                    Row(
                      children: [
                        const Expanded(flex: 2, child: Text(
                          "Company",
                          style: TextStyle(color: black, fontSize: 16, fontWeight: FontWeight.w500),
                        )),
                        const Text(
                          " : ",
                          style: TextStyle(color: black, fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                        Expanded(flex: 4, child: Text(
                          checkValidString(listData[index].company),
                          style: const TextStyle(color: black, fontSize: 16, fontWeight: FontWeight.w500),
                        )),
                      ],
                    ),
                    Gap(4),
                    Row(
                      children: [
                        const Expanded(flex: 2, child: Text(
                          "Contact Person",
                          style: TextStyle(color: black, fontSize: 16, fontWeight: FontWeight.w500),
                        )),
                        const Text(
                          " : ",
                          style: TextStyle(color: black, fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                        Expanded(flex: 4, child: Text(
                          checkValidString(listData[index].contact),
                          style: const TextStyle(color: black, fontSize: 16, fontWeight: FontWeight.w500),
                        )),
                      ],
                    ),
                    Gap(4),
                    Row(
                      children: [
                        const Expanded(flex: 2, child: Text(
                          "Nominee Name",
                          style: TextStyle(color: black, fontSize: 16, fontWeight: FontWeight.w500),
                        )),
                        const Text(
                          " : ",
                          style: TextStyle(color: black, fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                        Expanded(flex: 4, child: Text(
                          checkValidString(listData[index].nomineeName),
                          style: const TextStyle(color: black, fontSize: 16, fontWeight: FontWeight.w500),
                        )),
                      ],
                    ),
                    Gap(4),
                    Row(
                      children: [
                        const Expanded(flex: 2, child: Text(
                          "Phone",
                          style: TextStyle(color: black, fontSize: 16, fontWeight: FontWeight.w500),
                        )),
                        const Text(
                          " : ",
                          style: TextStyle(color: black, fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                        Expanded(flex: 4, child: Text(
                          checkValidString(listData[index].phone),
                          style: const TextStyle(color: black, fontSize: 16, fontWeight: FontWeight.w500),
                        )),
                      ],
                    ),
                    Gap(4),
                    Row(
                      children: [
                        const Expanded(flex: 2, child: Text(
                          "Address",
                          style: TextStyle(color: black, fontSize: 16, fontWeight: FontWeight.w500),
                        )),
                        const Text(
                          " : ",
                          style: TextStyle(color: black, fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                        Expanded(flex: 4, child: Text(
                          checkValidString(listData[index].address),
                          style: const TextStyle(color: black, fontSize: 16, fontWeight: FontWeight.w500),
                        )),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        )));
  }

  Future<void> _redirectAdd(EmploymentRelatedDetails listData, bool isFor) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddEmploymentRelatedPage(listData, isFor)),
    );
    print("result ===== $result");
    if (result == "success") {
      setState(() {
      });
      _getApiData();
    }
  }

  _getApiData() async {
    setState(() {
      _isLoading = true;
    });
    HttpWithMiddleware http = HttpWithMiddleware.build(middlewares: [
      HttpLogger(logLevel: LogLevel.BODY),
    ]);

    final url = Uri.parse(API_URL_VAULT + employmentRelatedList);
    Map<String, String> jsonBody = {'user_id': sessionManagerVault.getUserId().trim()};

    final response = await http.post(url, body: jsonBody);
    final statusCode = response.statusCode;
    final body = response.body;
    Map<String, dynamic> user = jsonDecode(body);
    var dataResponse = EmploymentRelatedResponse.fromJson(user);

    if (statusCode == 200 && dataResponse.success == 1)
    {
      try {
        if (dataResponse.employmentRelatedDetails != null) {
          listData = dataResponse.employmentRelatedDetails!;
          setState(() {
            _isLoading = false;
          });
        }
      } catch (e) {
        listData = [];
        showSnackBar(dataResponse.message, context);
        setState(() {
          _isLoading = false;
        });
        print(e);
      }
    }
    else {
      listData = [];
      //showSnackBar(dataResponse.message, context);
      _redirectAdd(EmploymentRelatedDetails(), false);
      setState(() {
        _isLoading = false;
      });
    }
  }

  void deleteListData(EmploymentRelatedDetails data, int index) {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: white,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12))),
      builder: (BuildContext context) {
        return Wrap(
          children: [
            Container(
              margin: const EdgeInsets.all(15),
              decoration:
              const BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12)), color: white),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 2,
                    width: 40,
                    alignment: Alignment.center,
                    color: black,
                    margin: const EdgeInsets.only(top: 10, bottom: 10),
                  ),
                  Container(
                      margin: const EdgeInsets.only(top: 10, bottom: 10),
                      child: const Text('Delete?', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800, color: black))),
                  Container(
                    margin: const EdgeInsets.only(top: 10, bottom: 15),
                    child: const Text('Are you sure you want to delete this entry?',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: black)),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 15, right: 15, bottom: 12, top: 20),
                    child: Row(
                      children: [
                        Expanded(
                            child: SizedBox(
                                height: kButtonHeight,
                                child: TextButton(
                                  style: ButtonStyle(
                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          side: const BorderSide(width: 1, color: blue),
                                          borderRadius: BorderRadius.circular(kBorderRadius),
                                        ),
                                      ),
                                      backgroundColor: MaterialStateProperty.all<Color>(white)),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text("Cancel", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: blue)),
                                ))),
                        const Gap(20),
                        Expanded(
                          child: SizedBox(
                            height: kButtonHeight,
                            child: TextButton(
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(kBorderRadius),
                                    ),
                                  ),
                                  backgroundColor: MaterialStateProperty.all<Color>(blue)),
                              onPressed: () {
                                Navigator.pop(context);
                                setState(() {
                                  deleteData(index);
                                });
                              },
                              child: const Text("Delete", style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: white)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Gap(30)
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  void deleteData(int index) async {
    HttpWithMiddleware http = HttpWithMiddleware.build(middlewares: [
      HttpLogger(logLevel: LogLevel.BODY),
    ]);

    final url = Uri.parse(API_URL_VAULT + deleteEmploymentRelated);

    Map<String, String> jsonBody = {
      'employment_related_id': listData[index].employmentRelatedId.toString(),
    };

    final response = await http.post(url, body: jsonBody);
    final statusCode = response.statusCode;

    final body = response.body;
    Map<String, dynamic> user = jsonDecode(body);
    var dataResponse = CommanResponse.fromJson(user);

    if (statusCode == 200 && dataResponse.success == 1) {
      showSnackBar(dataResponse.message, context);

      setState(() {
        listData.removeAt(index);
        _isLoading = false;
      });

    } else {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void castStatefulWidget() {
    widget is EmploymentRelatedListPage;
  }

  @override
  void dispose() {
    super.dispose();
  }
}
