import 'dart:convert';

import 'package:mwb_project/app/app_config.dart';
import 'package:mwb_project/core/data/models/apis/auth_model.dart';

import 'package:mwb_project/core/enums/data_type.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesRepository {
  SharedPreferences globalSharedPreferences = Get.find();
  //!--- Keys ----
  String PREF_FIRST_LOGIN = 'first_login';
  String PREF_USER_INFO = 'user_info';


  // String PREF_COLLEGE_LOGIN = 'college_login';

  void setLogin(bool value) {
    setPreference(
      dataType: DataType.BOOL,
      key: PREF_FIRST_LOGIN,
      value: value,
    );
  }

  bool getLogin() {
    if (globalSharedPreferences.containsKey(PREF_FIRST_LOGIN)) {
      return getPreference(key: PREF_FIRST_LOGIN);
    } else {
      return false;
    }
  }






  void clearTokenInfo() {
    globalSharedPreferences.clear();
  }

  void setUserInfo(LogInModel value) {
    setPreference(
      dataType: DataType.STRING,
      key: PREF_USER_INFO,
      value: jsonEncode(value.toJson()),
    );
  }

  LogInModel? getUserInfo() {
    if (globalSharedPreferences.containsKey(PREF_USER_INFO)) {
      return LogInModel.fromJson(
          jsonDecode(getPreference(key: PREF_USER_INFO)));
    } else {
      return null;
    }
  }



  // void setSpecializationsLogin(SpecializationsModel value) {
  //   setPreference(
  //     dataType: DataType.STRING,
  //     key: PREF_COLLEGE_LOGIN,
  //     value: jsonEncode(value.toJson()),
  //   );
  // }

  // SpecializationsModel? getSpecializationsLogin() {
  //   if (globalSharedPreferences.containsKey(PREF_COLLEGE_LOGIN)) {
  //     return SpecializationsModel.fromJson(
  //         jsonDecode(getPreference(key: PREF_COLLEGE_LOGIN)));
  //   } else {
  //     return null;
  //   }
  // }

  //?--

  //!--- Main Function ----
  setPreference({
    required DataType dataType,
    required String key,
    required dynamic value,
  }) async {
    switch (dataType) {
      case DataType.INT:
        await globalSharedPreferences.setInt(key, value);
        break;
      case DataType.BOOL:
        await globalSharedPreferences.setBool(key, value);
        break;
      case DataType.DOUBLE:
        await globalSharedPreferences.setDouble(key, value);
        break;
      case DataType.STRING:
        await globalSharedPreferences.setString(key, value);
        break;
      case DataType.STRINGLIST:
        await globalSharedPreferences.setStringList(key, value);
        break;
      default:
        break;
    }
  }

  getPreference({required String key}) {
    return globalSharedPreferences.get(key);
  }
}
