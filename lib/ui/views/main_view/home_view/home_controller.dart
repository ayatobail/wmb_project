
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import '../../../../core/enums/message_type.dart';
import '../../../../core/services/base_controller.dart';
import '../../../shared/custom_widgets/custom_toast.dart';


/*class HomeController extends BaseController {
  TextEditingController fromController = TextEditingController();
  TextEditingController toController = TextEditingController();
  TextEditingController adultsController = TextEditingController();
  TextEditingController kidsController = TextEditingController();
  TextEditingController infantsController = TextEditingController();
  RxString departTime = "".obs;
  RxString returntTime = "".obs;
  String classType = "";
  RxBool loader = false.obs;
  List<String> suggestions=<String>["dubai","erbil","doha","erland"];
  RxList<String> filterdSuggestions=<String>[].obs;
  final GlobalKey<FormState> formKey1 = GlobalKey<FormState>();

  RxList<AirLinesModel> tripsList = <AirLinesModel>[].obs;

  void searchOneWayTrip() {
    if (formKey1.currentState!.validate()){
loader.value=true;
    runFutureFunctionWithLoading(
        function: TripsRepository()
            .onwaySearch(
                fromController.text,
                toController.text,
                departTime.value,
                adultsController.text ,
                kidsController.text,
                infantsController.text,
                classType)
            .then((value) {
      value.fold((l) {
        loader.value=true;
        CustomToast.showMessage(message: l, messageType: MessageType.REJECTED);
      }, (r) {
        loader.value=false;
        r.airlines!.forEach((element) {
          tripsList.add(element);
        });
        Get.to(
            FlightList(places: tripsList,from:fromController.text ,to: toController.text,)
        );

      });
    }));}
  }

  void filterSuggestions(String input){
    filterdSuggestions.value=suggestions.where((suggestion) => suggestion.contains(input)).toList();
  }



  /*void roundTrip() {
    if (formKey1.currentState!.validate()){
      loader.value=true;
      runFutureFunctionWithLoading(
          function: TripsRepository()
              .roundTripSearch(
              fromController.text,
              toController.text,
              departTime.value,
              returntTime.value,
              adultsController.text ,
              kidsController.text,
              infantsController.text,
              classType)
              .then((value) {
            value.fold((l) {
              loader.value=true;
              CustomToast.showMessage(message: l, messageType: MessageType.REJECTED);
            }, (r) {
              loader.value=false;
              tripsList.addAll(r);
              Get.to(
                  FlightList(places: tripsList,from:fromController.text ,to: toController.text,)
              );
            });
          }));}
  }*/
}
*/