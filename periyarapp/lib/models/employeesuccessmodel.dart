class EmployeeSuccessModel {
  bool? status;
  String? msg;
  Data? data;

  EmployeeSuccessModel({this.status, this.msg, this.data});

  EmployeeSuccessModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['msg'] = msg;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? status;
  String? sId;
  int? phoneNumber;
  String? role;
  String? password;
  String? userName;
  String? dob;
  String? gender;
  AssiginedUnitId? assiginedUnitId;
  String? assignedTo;
  String? createDate;
  String? updateDate;
  int? iV;

  Data(
      {this.status,
      this.sId,
      this.phoneNumber,
      this.role,
      this.password,
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
    password = json['password'];
    userName = json['userName'];
    dob = json['dob'];
    gender = json['gender'];
    assiginedUnitId = json['assiginedUnitId'] != null
        ? AssiginedUnitId.fromJson(json['assiginedUnitId'])
        : null;
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
    data['password'] = password;
    data['userName'] = userName;
    data['dob'] = dob;
    data['gender'] = gender;
    if (assiginedUnitId != null) {
      data['assiginedUnitId'] = assiginedUnitId!.toJson();
    }
    data['assignedTo'] = assignedTo;
    data['create_date'] = createDate;
    data['update_date'] = updateDate;
    data['__v'] = iV;
    return data;
  }
}

class AssiginedUnitId {
  List<void>? location;
  String? status;
  List<void>? unitincharge;
  String? sId;
  String? type;
  String? name;
  String? description;
  String? createDate;
  String? updateDate;
  int? iV;

  AssiginedUnitId(
      {this.location,
      this.status,
      this.unitincharge,
      this.sId,
      this.type,
      this.name,
      this.description,
      this.createDate,
      this.updateDate,
      this.iV});

  AssiginedUnitId.fromJson(Map<String, dynamic> json) {
    if (json['location'] != null) {
      location = <Null>[];
      json['location'].forEach((v) {
        // location!.add(new Null.fromJson(v));
      });
    }
    status = json['status'];
    if (json['unitincharge'] != null) {
      unitincharge = <Null>[];
      json['unitincharge'].forEach((v) {
        // unitincharge!.add(new Null.fromJson(v));
      });
    }
    sId = json['_id'];
    type = json['type'];
    name = json['name'];
    description = json['description'];
    createDate = json['create_date'];
    updateDate = json['update_date'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (location != null) {
      // data['location'] = this.location!.map((v) => v.toJson()).toList();
    }
    data['status'] = status;
    if (unitincharge != null) {
      // data['unitincharge'] = this.unitincharge!.map((v) => v.toJson()).toList();
    }
    data['_id'] = sId;
    data['type'] = type;
    data['name'] = name;
    data['description'] = description;
    data['create_date'] = createDate;
    data['update_date'] = updateDate;
    data['__v'] = iV;
    return data;
  }
}
