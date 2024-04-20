

class CommonResponseModel<T> {
  int? statusCode;
  T? data;
  String? message;

  CommonResponseModel.fromJson(dynamic json) {

    this.statusCode = json['statusCode'];
    // this.statusCode = json['response']['code'];

    if (statusCode.toString().startsWith("2"))
      // if (statusCode == 200)
        {
      json['response'] is String?this.data=json['response'] :
        json['response'] is List?this.data = json['response']:
      //this.data = json['response']['data'];
      json['response'].containsKey('data')?this.data=json['response']['data']['aggregation']
          :this.data = json['response'];

    }
    else {
      if (json['response'] != null &&
          json['response'] is Map &&
          // json['response']['title'] != null
          json['response']['message'] != null) {
        // this.message = json['response']['title'];
        this.message = json['response']['message'];
      } else {
        this.message=json['response']['title'];
      }
    }
  }

  bool get getStatus => statusCode.toString().startsWith("2");
// bool get getStatus => statusCode == 200 ;
}
