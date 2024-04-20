import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:mwb_project/ui/shared/custom_widgets/app_drop_down.dart';
import 'package:mwb_project/ui/shared/extensions/custom_sized_box_shared.dart';
import 'package:mwb_project/ui/views/main_view/home_view/tab_bar_views/add_artist_view/add_artist_controller.dart';
import '../../../../../../core/themes/app_colors.dart';
import '../../../../../shared/custom_widgets/app_text_field.dart';
import '../../../../../shared/custom_widgets/custom_button.dart';
import '../../../../../shared/custom_widgets/label_text.dart';
import '../../../../../shared/utils.dart';

class AddArtistView extends StatefulWidget {
  const AddArtistView({Key? key}) : super(key: key);

  @override
  State<AddArtistView> createState() => _AddArtistViewState();
}

AddArtistController controller = Get.put(AddArtistController());

class _AddArtistViewState extends State<AddArtistView> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Card(
          elevation: 4,
          color: Colors.white,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(18), topLeft: Radius.circular(18))),
          child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: SingleChildScrollView(
                  child: Form(
                      key: controller.formKey1,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            serviceInfo(
                                name: 'First name',
                                controller: controller.firstNameController,
                                padding: 19,
                                validater: 'please enter first name'),

                            serviceInfo(
                                name: 'Last name',
                                controller: controller.lastNameController,
                                padding: 16,
                                validater: 'please enter last name'),
                            Row(
                              children: [
                                LabelText(labelText: "Gender",padding: 20,),
                                screenWidth(5.5).pw,
                                AppDropDown(
                                  items: ["Male", "Female"],
                                  width: screenWidth(2),
                                  color: AppColors.grey,
                                  onChanged: (val){
                                    controller.gender=val;
                                  },
                                ),
                              ],
                            ),



                            serviceInfo(
                              name: 'Country',
                              controller: controller.countryController,
                              padding: 8.7,
                            ),

                            screenHeight(30).ph,
                            controller.isLoading
                                ? CircularProgressIndicator(
                                    color: AppColors.primaryColor,
                                  )
                                : AppButton(
                                    color: AppColors.secondaryColor,
                                    onTap: () {controller.addArtist();},
                                    buttonText: 'Add'),

                            SizedBox(
                              height: screenWidth(4),
                            )

                            // Align(
                            //     alignment: Alignment.bottomRight,
                            //     child: FloatingActionButton(onPressed: (){},child: Icon(Icons.search),))
                          ],
                        ),
                      )))));
    });
  }
}

Widget serviceInfo(
    {required String name,
    required TextEditingController controller,
    required double padding,
      bool isTextField=true,
      Widget? dropDown,
    String? validater,
    int? lines,
    double? height}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      LabelText(
        labelText: name,
        padding: 20,
      ),
      screenWidth(padding).pw,
      isTextField?
      AppTextField(
        controller: controller,
        width: screenWidth(2),
        height: screenHeight(19),
        maxLines: lines ?? 1,
        validator: (value) {
          print(value);
          if (value == '' || value == null) {
            return validater;
          }
        },
      ):dropDown!,
      Spacer(),
    ],
  );
}
