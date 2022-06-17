/// ResponseFlag : "S"
/// ResponseMessage : "Record Found"
/// Response : [{"DisplayValue":"BANGALORE MSME","FieldValue":"BLR"},{"DisplayValue":"BANGALORE SCALERATOR","FieldValue":"BLR02"},{"DisplayValue":"CHENNAI SCALERATOR","FieldValue":"CHE02"},{"DisplayValue":"COIMBATORE SCALERATOR","FieldValue":"CMBT02"},{"DisplayValue":"COCHIN SCALERATOR","FieldValue":"COK02"},{"DisplayValue":"HYDERABAD MSME","FieldValue":"HYD"},{"DisplayValue":"MUMBAI MSME","FieldValue":"MUM"},{"DisplayValue":"PUNE MSME","FieldValue":"PUN"}]

class QueryValue {
  QueryValue({
      String? responseFlag, 
      String? responseMessage, 
      List<Response>? response,}){
    _responseFlag = responseFlag;
    _responseMessage = responseMessage;
    _response = response;
}

  QueryValue.fromJson(dynamic json) {
    _responseFlag = json['ResponseFlag'];
    _responseMessage = json['ResponseMessage'];
    if (json['Response'] != null) {
      _response = [];
      json['Response'].forEach((v) {
        _response?.add(Response.fromJson(v));
      });
    }
  }
  String? _responseFlag;
  String? _responseMessage;
  List<Response>? _response;
QueryValue copyWith({  String? responseFlag,
  String? responseMessage,
  List<Response>? response,
}) => QueryValue(  responseFlag: responseFlag ?? _responseFlag,
  responseMessage: responseMessage ?? _responseMessage,
  response: response ?? _response,
);
  String? get responseFlag => _responseFlag;
  String? get responseMessage => _responseMessage;
  List<Response>? get response => _response;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ResponseFlag'] = _responseFlag;
    map['ResponseMessage'] = _responseMessage;
    if (_response != null) {
      map['Response'] = _response?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// DisplayValue : "BANGALORE MSME"
/// FieldValue : "BLR"

class Response {
  Response({
      String? displayValue, 
      String? fieldValue,}){
    _displayValue = displayValue;
    _fieldValue = fieldValue;
}

  Response.fromJson(dynamic json) {
    _displayValue = json['DisplayValue'];
    _fieldValue = json['FieldValue'];
  }
  String? _displayValue;
  String? _fieldValue;
Response copyWith({  String? displayValue,
  String? fieldValue,
}) => Response(  displayValue: displayValue ?? _displayValue,
  fieldValue: fieldValue ?? _fieldValue,
);
  String? get displayValue => _displayValue;
  String? get fieldValue => _fieldValue;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['DisplayValue'] = _displayValue;
    map['FieldValue'] = _fieldValue;
    return map;
  }

}