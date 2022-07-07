class LoginResponseModel {
  String? status;
  String? message;
  String? data;

  LoginResponseModel(this.data, this.message, this.status);

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    data = json['data'];
    status = json['status'];
    message = json['message'];
  }
}
