class EmployeeloginModel {
  bool? status;
  String? token;
  Data? data;
  String? msg;

  EmployeeloginModel({this.status, this.token, this.data, this.msg});

  EmployeeloginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    token = json['token'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['token'] = token;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['msg'] = msg;
    return data;
  }
}

class Data {
  String? status;
  String? sId;
  int? phoneNumber;
  String? role;
  String? userName;
  String? dob;
  String? gender;
  String? assiginedUnitId;
  String? assignedTo;
  String? createDate;
  String? updateDate;
  int? iV;

  Data(
      {this.status,
      this.sId,
      this.phoneNumber,
      this.role,
      this.userName,
      this.dob,
      this.gender,
      this.assiginedUnitId,
      this.assignedTo,
      this.createDate,
      this.updateDate,
      this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    sId = json['_id'];
    phoneNumber = json['phoneNumber'];
    role = json['role'];
    userName = json['userName'];
    dob = json['dob'];
    gender = json['gender'];
    assiginedUnitId = json['assiginedUnitId'];
    assignedTo = json['assignedTo'];
    createDate = json['create_date'];
    updateDate = json['update_date'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['_id'] = sId;
    data['phoneNumber'] = phoneNumber;
    data['role'] = role;
    data['userName'] = userName;
    data['dob'] = dob;
    data['gender'] = gender;
    data['assiginedUnitId'] = assiginedUnitId;
    data['assignedTo'] = assignedTo;
    data['create_date'] = createDate;
    data['update_date'] = updateDate;
    data['__v'] = iV;
    return data;
  }
}
