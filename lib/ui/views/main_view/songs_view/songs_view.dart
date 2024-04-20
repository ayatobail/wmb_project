import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mwb_project/core/utils/app_sizes.dart';
import 'package:mwb_project/ui/views/main_view/songs_view/songs_controller.dart';
import 'package:mwb_project/ui/views/songs_search_view/songs_search_view.dart';
import '../../../../core/themes/app_colors.dart';
import '../../../shared/custom_widgets/app_text_field.dart';
import '../../../shared/custom_widgets/colored_text.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_core/get_core.dart';
import '../../../shared/utils.dart';
import '../../song_details_view/song_details_view.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class SongsView extends StatefulWidget {
  const SongsView({Key? key, required this.controller}) : super(key: key);
  final SongsController controller;

  @override
  _SongsViewState createState() => _SongsViewState();
}

class _SongsViewState extends State<SongsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Songs'),
          scrolledUnderElevation: 0,
        ),
        body: SizedBox(
              height: context.height,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 0),
                child: Column(
                  children: [
                    InkWell(
                      onTap: ()=>Get.to(SongsSearchView(controller: widget.controller,)),
                      child: AppTextField(
                        enable: false,
                        inputActionType: TextInputAction.search,
                        hintText: "search",
                        labelText: "search",
                        size: screenWidth(25),
                        round: screenWidth(1),
                        width: screenWidth(1),
                        prefIcon: Icons.search,

                      ),
                    ),

                    Expanded(
                      child: Obx(()
                        {return widget.controller.isLoading
                            ? Center(
                          child: CircularProgressIndicator(
                            color: AppColors.primaryColor,
                          ),
                        )
                            :
                        ListView.builder(
                            shrinkWrap: true,
                            itemCount: widget.controller.songsList.length,
                            itemBuilder: (context, index) {
                              return Card(
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: AppColors.lightGreyColor,
                                        style: BorderStyle.solid),
                                    borderRadius: BorderRadius.circular(12)),
                                color: AppColors.backgroundColor,
                                margin: EdgeInsets.all(8),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8.0, horizontal: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          serviceInfo(
                                            name: 'Song Title:',
                                            value:widget.controller.songsList[index].title!
                                          ),
                                          ColoredText(
                                            text: "${widget.controller.songsList[index].artist!.fName!} ${widget.controller.songsList[index].artist!.lName!}",
                                            textColor: AppColors.textColor,
                                            size: screenWidth(23),
                                          ),
                        
                                          ColoredText(
                                            text: "${widget.controller.songsList[index].price} \$",
                                            textColor: AppColors.textColor,
                                            size: screenWidth(23),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                                screenWidth(1)),
                                            child: Image(
                                                image: ResizeImage(
                                                    AssetImage(
                                                        "assets/images/song.jpg"),
                                                    width: 90,
                                                    height: 90)),
                                          ),
                                          InkWell(
                                            onTap:()=>Get.to(SongDetailsView(song: widget.controller.songsList[index],)),
                                            child: ColoredText(
                                              text: 'view details',
                                              textColor: AppColors.secondaryColor,
                                              size: screenWidth(28),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              );
                            });}
                      ),
                    )
                  ],
                ),
              )));
  }
}

Widget serviceInfo(
    {required String name, required String value, Color? color}) {
  return Row(
    children: [
      ColoredText(
          size: screenWidth(23), text: name, textColor: AppColors.primaryColor),
      ColoredText(
          size: screenWidth(23),
          text: value,
          textColor: color ?? AppColors.secondaryColor),
    ],
  );
}
