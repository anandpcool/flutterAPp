import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:iboss_flutter/model/branch_response_model.dart';
import 'package:iboss_flutter/utils/date_utils.dart';
import 'package:intl/intl.dart';

import '../../model/credit_review_response.dart';
import '../../services/remote_service.dart';
import '../../utils/custom_color.dart';
import 'package:http/http.dart' as http;

class CreditReview extends StatefulWidget {
  @override
  State<CreditReview> createState() => _CreditReviewState();
}

class _CreditReviewState extends State<CreditReview> {
  List<dynamic>? responseData = [];
  List<BranchValue>? branchCode = [];
  TextEditingController startController = TextEditingController();
  TextEditingController endController = TextEditingController();
  TextEditingController dialogController = TextEditingController();
  var startDate = CustomDateUtils.getDateMinusSevenDays();
  var endDate = CustomDateUtils.getCurrentDate();

  String _selected = "Select Branch";

  @override
  void dispose() {
    super.dispose();
    dialogController.dispose();
    startController.dispose();
    endController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    startController.text = startDate;
    endController.text = endDate;
    dialogController.text = _selected;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(0.0),
            child: Container(
              color: ColorConstants.dividerColor,
              height: 1.0,
            )),
        title: const Text(
          "Credit Review",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
      ),
      body: responseData!.length == 0
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(child: showFilter()),
    );
  }

  @override
  void initState() {
    super.initState();
    getCreditReviewDetails();
    getBranchCode();
  }

  showFilter() {
    return SizedBox(
      width: MediaQuery.of(this.context).size.width,
      //height: MediaQuery.of(this.context).size.height,
      child: Card(
        margin: const EdgeInsets.all(10),
        // color: ColorConstants.indigoBrand,
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const ListTile(
                title: Text(
                  "View Credit Review",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.indigo,
                  ),
                ),
              ),
              Row(
                //  mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: GestureDetector(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          showCursor: false,
                          // cursorHeight: 0,
                          // cursorWidth: 0,
                          enableInteractiveSelection: false,
                          controller: startController,
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
                              labelText: "Start Date",
                              labelStyle: TextStyle(
                                  color: ColorConstants.indigoBrand,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                              hintText: "09-Jun-2016",
                              contentPadding:
                                  EdgeInsets.only(left: 10, right: 10)),
                          keyboardType: TextInputType.none,
                        ),
                      ),
                    ),
                  ),
                  //Padding(padding: EdgeInsets.all(10)),
                  Flexible(
                    child: GestureDetector(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          autofocus: false,
                          showCursor: false,
                          // cursorHeight: 0,
                          // cursorWidth: 0,
                          enableInteractiveSelection: false,
                          controller: endController,
                          decoration: const InputDecoration(
                              // border: OutlineInputBorder(),
                              labelText: "End Date",
                              labelStyle: TextStyle(
                                  color: ColorConstants.indigoBrand,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                              hintText: "09-Jun-2022",
                              contentPadding:
                                  EdgeInsets.only(left: 10, right: 10)),
                          keyboardType: TextInputType.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Flexible(
                child: GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      onTap: () => showCustomDialog(),

                      autofocus: false,
                      showCursor: false,
                      // cursorHeight: 0,
                      // cursorWidth: 0,

                      enableInteractiveSelection: false,
                      controller: dialogController,
                      decoration: const InputDecoration(
                          // labelText: "Select Branch",
                          hintText: "Select Branch",
                          contentPadding: EdgeInsets.all(10)),
                      keyboardType: TextInputType.none,
                    ),
                  ),
                ),
              ),
              Container(
                  padding: const EdgeInsets.only(top: 10),
                  width: MediaQuery.of(context).size.width / 2,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    child: const Text(
                      'Login',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      //Navigator.pushNamed(context, "/otp");
                    },
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Widget showMyUI() {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: responseData!.length,
      itemBuilder: (context, index) {
        Map<String, dynamic> dataResponse = responseData?[index];
        print("Size of lit----${responseData!.length}");
        var keys = dataResponse.keys.toList();
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            elevation: 5,
            child: Column(
              children: [
                SingleChildScrollView(
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: keys.length,
                      itemBuilder: ((context, index1) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 4, bottom: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  keys[index1],
                                  // ignore: prefer_const_constructors
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 4.0, right: 4),
                                child: Text(":"),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  dataResponse[keys[index1]].toString(),
                                  // ignore: prefer_const_constructors
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      })),
                ),
                const Divider(
                  thickness: 2,
                  height: 2,
                  color: ColorConstants.dividerColor,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset("assets/images/icon_applicants.png"),
                      iconSize: 18,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.place_outlined),
                      iconSize: 22,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.call),
                      iconSize: 22,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.remove_red_eye),
                      iconSize: 22,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.camera_alt),
                      iconSize: 22,
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Future getCreditReviewDetails() async {
    HashMap<String, dynamic> map = HashMap();
    HashMap<String, String> requestingString = HashMap();
    requestingString["FromDate"] = "14-Jun-2004";
    requestingString["ToDate"] = "14-Jun-2022";
    requestingString["BranchCode"] = "BLR";
    map["FunctionName"] = "CREDIT_VERIFICATION_DATA";
    map["ProjectName"] = "IBOSS";
    map["ModuleName"] = "CREDIT_DATA";
    map["RequestString"] = requestingString;
    map["UserID"] = "FIN1564";
    map["RequestSource"] = "M";
    map["RequestUniqueID"] = "1";
    print("Hi bottom--------------->");
    final RemoteService _apiClient = RemoteService();
    dynamic dataResponse = await _apiClient.creditReviewList(map);
    Map<String, dynamic> parsedJsonData = jsonDecode(dataResponse);
    var parseData = CreditReviewResponse.fromJson(parsedJsonData);

    if (parseData.responseFlag == "S") {
      print("Success---->");

      setState(() {
        responseData = parseData.response;
      });
    } else {
      print("error---->");
      return null;
    }

    //print("Credit review Data--->$jsonData");
  }

  Future getBranchCode() async {
    HashMap<String, dynamic> map = HashMap();
    HashMap<String, String> requestingString = HashMap();

    map["FunctionName"] = "GET_USER_ACCESS_BRANCHES";
    map["ProjectName"] = "IBOSS";
    map["ModuleName"] = "GET_USER_DEFAULT_VALUES";
    map["RequestString"] = requestingString;
    map["UserID"] = "FIN1564";
    map["RequestSource"] = "M";
    map["RequestUniqueID"] = "1";

    print("Hi branch--------------->");
    final RemoteService _apiClient = RemoteService();
    dynamic dataResponse = await _apiClient.branchList(map);
    Map<String, dynamic> parsedJsonData = jsonDecode(dataResponse);
    var parseData = BranchResponseModel.fromJson(parsedJsonData);
    if (parseData.responseFlag == "S") {
      print("Branch Success---->");
      setState(() {
        branchCode = parseData.response;
      });
    } else {
      print("error---->");
      return null;
    }
  }

  List<BranchValue> getData() {
    return branchCode!.toList();
  }

  showCustomDialog() => showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          insetPadding: EdgeInsets.all(5),
          contentPadding: EdgeInsets.all(0),
          actionsPadding: EdgeInsets.zero,
          title: Text("Branch"),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(this.context, false);
                },
                child: Text("Cancel")),
            TextButton(
              child: Text("Ok"),
              onPressed: () {
                Navigator.pop(this.context, false);
              },
            )
          ],
          content: Container(
            width: double.maxFinite,
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Divider(
                  height: 2,
                  thickness: 2,
                  color: ColorConstants.dividerColor,
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height * 0.6,
                  ),
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: branchCode!.length,
                      itemBuilder: (context, index) {
                        return RadioListTile(
                          title: Text(
                            branchCode![index].displayValue.toString(),
                            style: const TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          value: branchCode![index].displayValue.toString(),
                          groupValue: _selected,
                          controlAffinity: ListTileControlAffinity.trailing,
                          activeColor: ColorConstants.indigoBrand,
                          onChanged: (value) {
                            _selected = value.toString();
                            dialogController.text = _selected;
                            Navigator.pop(context);
                            setState(() {});
                          },
                        );
                      }),
                ),
                const Divider(
                  height: 2,
                  thickness: 2,
                  color: ColorConstants.dividerColor,
                ),
              ],
            ),
          ),
        );
      });

  // void showAlertDialog(BuildContext context) async {
  //   return showDialog(
  //       context: context,
  //       builder: (context) {
  //         return AlertDialog(
  //           title: Text('TextField AlertDemo'),
  //           content: TextField(
  //             decoration: InputDecoration(hintText: "TextField in Dialog"),
  //           ),
  //           actions: <Widget>[
  //             new FlatButton(
  //               child: new Text('SUBMIT'),
  //               onPressed: () {
  //                 Navigator.of(context).pop();
  //               },
  //             )
  //           ],
  //         );
  //       });
  // }

}
