class BranchResponseModel {
  String? responseFlag;
  String? responseMessage;
  List<BranchValue>? response;

  BranchResponseModel({this.responseFlag, this.responseMessage, this.response});

  BranchResponseModel.fromJson(Map<String, dynamic> json) {
    responseFlag = json['ResponseFlag'];
    responseMessage = json['ResponseMessage'];
    if (json['Response'] != null) {
      response = <BranchValue>[];
      json['Response'].forEach((v) {
        response!.add(BranchValue.fromJson(v));
      });
    }
  //    List<BranchResponseModel>? fromJsonList(List list) {
  //   if (list == null) return null;
  //   return list.map((item) => BranchResponseModel.fromJson(item)).toList();
  // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ResponseFlag'] = this.responseFlag;
    data['ResponseMessage'] = this.responseMessage;
    if (this.response != null) {
      data['Response'] = this.response!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BranchValue {
  String? displayValue;
  String? fieldValue;

  BranchValue({this.displayValue, this.fieldValue});

  BranchValue.fromJson(Map<String, dynamic> json) {
    displayValue = json['DisplayValue'];
    fieldValue = json['FieldValue'];

 
  }

  

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['DisplayValue'] = this.displayValue;
    data['FieldValue'] = this.fieldValue;
    return data;
  }

   String userAsString() {
    return 'Anand';
  }
}