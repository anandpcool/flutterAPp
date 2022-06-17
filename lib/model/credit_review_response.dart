class CreditReviewResponse {
  String? responseFlag;
  String? responseMessage;
  List<dynamic>? response;

  CreditReviewResponse(
      {this.responseFlag, this.responseMessage, this.response});

  CreditReviewResponse.fromJson(Map<String, dynamic> json) {
    responseFlag = json['ResponseFlag'];
    responseMessage = json['ResponseMessage'];
    if (json['Response'] != null) {
      response = <dynamic>[];
      json['Response'].forEach((v) {
        response!.add(v);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ResponseFlag'] = this.responseFlag;
    data['ResponseMessage'] = this.responseMessage;
    if (this.response != null) {
      data['Response'] = this.response;
    }
    return data;
  }
}

class Response {
  String? branch;
  String? leadNo;
  String? leadName;
  String? pAN;
  String? constitution;
  String? contactNo;
  String? product;
  int? loanAmount;
  String? industry;
  String? subIndustry;
  int? pDAttachCount;
  String? dSAName;
  String? salesManager;

  Response(
      {this.branch,
      this.leadNo,
      this.leadName,
      this.pAN,
      this.constitution,
      this.contactNo,
      this.product,
      this.loanAmount,
      this.industry,
      this.subIndustry,
      this.pDAttachCount,
      this.dSAName,
      this.salesManager});

  Response.fromJson(Map<String, dynamic> json) {
    branch = json['Branch'];
    leadNo = json['Lead No'];
    leadName = json['Lead Name'];
    pAN = json['PAN'];
    constitution = json['Constitution'];
    contactNo = json['Contact No'];
    product = json['Product'];
    loanAmount = json['Loan Amount'];
    industry = json['Industry'];
    subIndustry = json['Sub Industry'];
    pDAttachCount = json['PD Attach Count'];
    dSAName = json['DSA Name'];
    salesManager = json['Sales Manager'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Branch'] = this.branch;
    data['Lead No'] = this.leadNo;
    data['Lead Name'] = this.leadName;
    data['PAN'] = this.pAN;
    data['Constitution'] = this.constitution;
    data['Contact No'] = this.contactNo;
    data['Product'] = this.product;
    data['Loan Amount'] = this.loanAmount;
    data['Industry'] = this.industry;
    data['Sub Industry'] = this.subIndustry;
    data['PD Attach Count'] = this.pDAttachCount;
    data['DSA Name'] = this.dSAName;
    data['Sales Manager'] = this.salesManager;
    return data;
  }
}