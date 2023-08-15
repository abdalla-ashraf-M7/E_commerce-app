import 'package:e_commerce/core/class/requeststatus.dart';

handlingData(response) {
  if (response is requeststatus) {
    return response;
  } else {
    return requeststatus.success;
  }
}
