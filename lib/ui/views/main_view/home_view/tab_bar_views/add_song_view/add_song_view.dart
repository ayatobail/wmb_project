import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:mwb_project/ui/shared/extensions/custom_sized_box_shared.dart';
import 'package:mwb_project/ui/views/main_view/home_view/tab_bar_views/add_song_view/add_song_controller.dart';
import '../../../../../../core/themes/app_colors.dart';
import '../../../../../shared/custom_widgets/app_text_field.dart';
import '../../../../../shared/custom_widgets/custom_button.dart';
import '../../../../../shared/custom_widgets/custom_drop_down.dart';
import '../../../../../shared/custom_widgets/label_text.dart';
import '../../../../../shared/custom_widgets/title_subtitle_column.dart';
import '../../../../../shared/utils.dart';

class AddSongView extends StatefulWidget {
  const AddSongView({Key? key}) : super(key: key);

  @override
  State<AddSongView> createState() => _AddSongViewState();
}

AddSongController controller = Get.put(AddSongController());

class _AddSongViewState extends State<AddSongView> {
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
                     name: 'Title',
                     controller: controller.titleController,
                     padding: 20,
                     validater: 'please enter title'),

                 serviceInfo(
                     name: 'Type',
                     controller: controller.typeController,
                     padding: 23,
                     validater: 'please enter type'),

                 serviceInfo(
                     name: 'Price',
                     controller: controller.priceController,
                     padding: 29,
                     ),

                     Row(
                       children: [
                         LabelText(labelText: "Artist",padding: 30,),
                         screenWidth(7).pw,
                         AppDropDown(
                           //value: controller.list.value,
                           validator: (value) {
                             // value = context.read<AuthCubit>().phoneController.text;
                             print(value);
                             if (value == '' || value == null) {
                               return 'please select an artist';
                             }
                           },

                           items: controller.artistsList.value,
                           width: screenWidth(2),
                           rounded: 8.0,
                           color: AppColors.grey,
                           key1: "id",
                           key2: "fName",
                           key3:"lName",
                           onChanged: (val) {
                             controller.id = val;

                           },
                         ),
                       ],
                     ),



                 screenHeight(30).ph,
                 controller.isLoading
                     ? CircularProgressIndicator(
                         color: AppColors.primaryColor,
                       )
                     : AppButton(
                         color: AppColors.secondaryColor,
                         onTap: () {
                           controller.addSong();
                         },
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
    String? validater,
    int? lines,
    double? height,
      bool isTextField=true,
      Widget? dropDown,}) {
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
        height: screenHeight(height ?? 19),
        maxLines: lines ?? 1,
        validator: (value) {
          print(value);
          if (value == '' || value == null) {
            return validater;
          }
        },
      ):dropDown!
    ],
  );
}
