/*import 'package:flutter/material.dart';
import 'package:mwb_project/ui/shared/extensions/custom_sized_box_shared.dart';

import '../../../../../../core/themes/app_colors.dart';
import '../../../../../shared/custom_widgets/custom_button.dart';
import '../../../../../shared/utils.dart';
import '../add_artist_view/add_artist_view.dart';
class BuySongView extends StatefulWidget {
  const BuySongView({super.key});

  @override
  State<BuySongView> createState() => _BuySongViewState();
}

class _BuySongViewState extends State<BuySongView> {
  @override
  Widget build(BuildContext context) {
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
                              name: 'Song name',
                              controller: controller.namecontroller,
                              padding: 30,
                              validater: 'please enter song name'),

                          serviceInfo(
                              name: 'redit card number',
                              controller: controller.numController,
                              padding: 25,
                              validater: 'please enter last name'),

                          serviceInfo(
                            name: 'Gender',
                            controller: controller.descriptionController,
                            padding: 9,
                          ),
                          serviceInfo(
                            name: 'Country',
                            controller: controller.descriptionController,
                            padding: 12,
                          ),


                          screenHeight(30).ph,
                          controller.isLoading
                              ? CircularProgressIndicator(
                            color: AppColors.primaryColor,
                          )
                              : AppButton(
                              color: AppColors.secondaryColor,
                              onTap: () {
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
  }
}
*/