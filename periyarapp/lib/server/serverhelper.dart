import 'dart:convert';
import 'dart:developer';
import 'dart:io';
// ignore: depend_on_referenced_packages

import 'package:http/http.dart' as http;
import 'package:periyarapp/keep/localstorage.dart';

class ServerHelper {
  //localmine
//   static const ip = 'http://192.168.54.45:5055';
//  static const imageIp = 'http://192.168.54.45:5055/file/get/';
  //localmine
  //server
  // static const ip = 'https://churchapi.leopardtechlabs.in';
  // static const imageIp = 'https://churchapi.leopardtechlabs.in/file/get/';

  ///ajo chtn
  static const ip = 'http://192.168.51.186:4300';
  static const imageIp = 'http://192.168.51.186:4300/file/get/';
  //51 110
//org

  static Future<dynamic> post(url, data) async {
    var token = await LocalStorage.getToken();
    log(token);
    log(url.toString());

    Map sendData = {};
    if (data?.isNotEmpty ?? false) {
      sendData.addAll(data);
    }
    var body = json.encode(sendData);
    dynamic response;
    try {
      response = await http.post(Uri.parse(ip + url),
          headers: {"Content-Type": "application/json", "token": token ?? ""},
          body: body);

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        var error = {
          "status": false,
          "msg": "Invalid Request - statusCode ${response.statusCode}"
        };
        return error;
      }
    } on Exception catch (e) {
      log('Server exception $e');
      // throw NoHostException();
    }
  }

  static Future<dynamic> get(url) async {
    try {
      var token = await LocalStorage.getToken();
      log(token.toString());
      log(token);

      log(url.toString());
      var response = await http.get(
        Uri.parse(ip + url),
        headers: {"Content-Type": "application/json", "token": token ?? ""},
      );
      if (response.statusCode == 200) {
        log(response.contentLength.toString());
        return jsonDecode(response.body);
      } else {
        var error = {
          "status": false,
          "msg": "Invalid Request",
        };
        return error;
      }
    } on Exception catch (e) {
      log(e.toString());
      // throw NoHostException();
    }
  }

  static Future<dynamic> uploadFile(
      File file, String? planId, promocode, finalAmount) async {
    log("Plan ID $planId");
    try {
      String token = await LocalStorage.getToken();
      var headers = {'token': token};
      var uri = Uri.parse(
          '$ip/user/level3/buy/plan?planId=$planId&promocode=$promocode&finalAmonut=$finalAmount');
      var request = http.MultipartRequest("POST", uri);
      var multipartFile = http.MultipartFile.fromBytes(
          'photo', file.readAsBytesSync(),
          filename: file.path);
      request.files.add(multipartFile);
      request.headers.addAll(headers);

      var response = await request.send();
      if (response.statusCode == 200) {
        log(response.contentLength.toString());
        return true;
      } else {
        // var error = {
        //   "status": false,
        //   "msg": "Invalid Request",
        // };
        return false;
      }
    } catch (e) {
      log('File upload error: $e');
    }
  }

  static Future<dynamic> uploadgalleryfiles(bool? isphotoavailable, file,
      String? name, data, dynamic route, List<String> image) async {
    Map<String, String>? sendData = {};

    if (data?.isNotEmpty ?? false) {
      sendData.addAll(data);
    }
    // var body = json.encode(sendData);
    try {
      var token = await LocalStorage.getToken();
      Map<String, String> headers = {
        "Content-Type": "application/json",
        "token": token ?? ""
      };
      var uri = Uri.parse(ip + route);
      // http.MultipartFile multipartFile;

      var request = http.MultipartRequest('POST', uri);
      // if (isphotoavailable == true) {
      //   request.files.add(http.MultipartFile.fromBytes(
      //       'image', File(file).readAsBytesSync(),
      //       filename: file.split('/').last));
      // }
      if (image.isNotEmpty) {
        for (String image in image) {
          request.files.add(http.MultipartFile.fromBytes(
              'photo', File(image).readAsBytesSync(),
              filename: image.split('/').last));
        }
      }

      request.headers.addAll(headers);
      request.fields.addAll(sendData);
      http.Response response =
          await http.Response.fromStream(await request.send());
      if (jsonDecode(response.body)['status']) {
        log(jsonDecode(response.body).toString());
        return jsonDecode(response.body);
      } else {
        return jsonDecode(response.body);
      }
    } catch (e) {
      log('File upload error: $e');
      return {
        'status': false,
        'msg': 'Invalid Request',
      };
    }
  }

  static Future<dynamic> uploadphoto(
    File file,
    String? id,
    dynamic route,
  ) async {
    Map<String, String>? sendData = {"id": id!};

    try {
      var token = await LocalStorage.getToken();
      Map<String, String> headers = {
        "Content-Type": "application/json",
        "token": token ?? ""
      };
      var uri = Uri.parse(ip + route);
      // http.MultipartFile multipartFile;

      var request = http.MultipartRequest('POST', uri);

      var multipartFile = http.MultipartFile.fromBytes(
          'image', file.readAsBytesSync(),
          filename: file.path);
      request.files.add(multipartFile);
      request.headers.addAll(headers);
      request.fields.addAll(sendData);
      http.Response response =
          await http.Response.fromStream(await request.send());
      if (jsonDecode(response.body)['status']) {
        log(jsonDecode(response.body).toString());
        return jsonDecode(response.body);
      } else {
        return jsonDecode(response.body);
      }

      // var response = await request.send();
      // if (response.statusCode == 200) {
      //   log(response.contentLength.toString());
      //   return true;
      // } else {
      //   // var error = {
      //   //   "status": false,
      //   //   "msg": "Invalid Request",
      //   // };
      //   return false;
      // }
    } catch (e) {
      log('File upload error: $e');
    }
  }

  static Future<dynamic> uploadgeneralfiles(bool? isphotoavailable, file,
      String? name, data, dynamic route, List<String> image) async {
    Map<String, String>? sendData = {};

    if (data?.isNotEmpty ?? false) {
      sendData.addAll(data);
    }
    // var body = json.encode(sendData);
    try {
      var token = await LocalStorage.getToken();
      Map<String, String> headers = {
        "Content-Type": "application/json",
        "token": token ?? ""
      };
      var uri = Uri.parse(ip + route);
      // http.MultipartFile multipartFile;

      var request = http.MultipartRequest('POST', uri);
      // if (isphotoavailable == true) {
      //   request.files.add(http.MultipartFile.fromBytes(
      //       'image', File(file).readAsBytesSync(),
      //       filename: file.split('/').last));
      // }
      if (image.isNotEmpty) {
        for (String image in image) {
          request.files.add(http.MultipartFile.fromBytes(
              'image', File(image).readAsBytesSync(),
              filename: image.split('/').last));
        }
      }

      request.headers.addAll(headers);
      request.fields.addAll(sendData);
      http.Response response =
          await http.Response.fromStream(await request.send());
      if (jsonDecode(response.body)['status']) {
        log(jsonDecode(response.body).toString());
        return jsonDecode(response.body);
      } else {
        return jsonDecode(response.body);
      }
    } catch (e) {
      log('File upload error: $e');
      return {
        'status': false,
        'msg': 'Invalid Request',
      };
    }
  }

  static Future<dynamic> uploadReciept(
      File file, String? id, bool? isadditional) async {
    try {
      String token = await LocalStorage.getToken();
      var headers = {'token': token};
      var uri = isadditional == false
          ? Uri.parse('$ip/purchase/upload/image?id=$id')
          : Uri.parse('$ip/purchase/additional/payment/upload/recipt?id=$id');
      var request = http.MultipartRequest("POST", uri);
      var multipartFile = http.MultipartFile.fromBytes(
          'photo', file.readAsBytesSync(),
          filename: file.path);
      request.files.add(multipartFile);
      request.headers.addAll(headers);

      var response = await request.send();
      if (response.statusCode == 200) {
        log(response.contentLength.toString());
        return true;
      } else {
        // var error = {
        //   "status": false,
        //   "msg": "Invalid Request",
        // };
        return false;
      }
    } catch (e) {
      log('File upload error: $e');
    }
  }
}
