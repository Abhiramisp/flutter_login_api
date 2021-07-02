// import 'package:api_login/logic/models/user_model.dart';

import '../models/response_model.dart';
import 'package:dio/dio.dart';

class ApiServices {
  var url = "http://35.154.136.230:8080/accounts/login/";

  Future<ResponseModel?> loginRequest(phonenumber, password) async {
    try {
      var dio = Dio();
      Response response = await dio
          .post(url, data: {'phone_number': phonenumber, 'password': password});

      if (response.statusCode == 200) {
        ResponseModel responseData = ResponseModel.fromJson(response.data);

        print(response);
        print(responseData);
        return responseData;
      }
    } catch (Exception) {
      print('exception');
    }
  }

  // Future<UserModel?> getUser(body) async {
  //   try {
  //     var dio = Dio();
  //     Response response = await dio.post(url, data: body);

  //     if (response.statusCode == 200) {
  //       UserModel responseData = UserModel.fromJson(response.data);

  //       return responseData;
  //     }
  //   } catch (Exception) {
  //     print('exception');
  //   }
  // }
}
