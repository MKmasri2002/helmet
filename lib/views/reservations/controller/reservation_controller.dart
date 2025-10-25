import 'package:get/get.dart';

class ReservationController extends GetxController {
  var showAll = false.obs;
void toggleShowAll() {
  showAll.value = !showAll.value;
  update(); 
}
  String getTime({required String date}) {
    DateTime parsedDate = DateTime.parse(date);
    String formattedDate =
        "${parsedDate.year}-${parsedDate.month.toString().padLeft(2, '0')}-${parsedDate.day.toString().padLeft(2, '0')}  ${parsedDate.hour}:${parsedDate.minute.toString().padLeft(2, '0')}${parsedDate.hour >= 12 ? 'PM' : 'AM'}";
    return formattedDate;
  }
}
