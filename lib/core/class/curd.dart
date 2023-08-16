import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/class/requeststatus.dart';
import 'package:e_commerce/core/functions/checkinternet.dart';
import 'package:http/http.dart' as http;

class Crud {
  Future<Either<requeststatus, Map>> postData(String url, Map data) async {
    try {
      if (await checkINternet()) {
        var response = await http.post(Uri.parse(url), body: data);
        if (response.statusCode == 200 || response.statusCode == 201) {
          var responsebody = jsonDecode(response.body);
          return Right(responsebody);
        } else {
          print("11111111111111111111111111${response.statusCode}");
          return left(requeststatus.serverFailaur);
        }
      } else {
        return left(requeststatus.offlineFailaur);
      }
    } catch (_) {
      return left(requeststatus.unknown);
    }
  }
}
