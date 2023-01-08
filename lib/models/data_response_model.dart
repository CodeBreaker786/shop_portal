 

 
class DataResponseModel {
  DataResponseModel(this.status, this.data, this.errorMessage);

  factory DataResponseModel.fromJson(Map<String, dynamic> json) {
    return DataResponseModel(json['status'] ?? false,
        json['data'] as dynamic ?? [], json['message'].toString());
  }

  final dynamic data;
  final bool status;
  final String errorMessage;
  // final List<DataResponseErrorModel> errors;
}
