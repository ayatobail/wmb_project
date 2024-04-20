import 'package:flutter/material.dart';
import 'package:mwb_project/core/data/models/apis/songs_model.dart';
import 'package:mwb_project/core/themes/app_colors.dart';
import 'package:mwb_project/ui/views/main_view/songs_view/songs_controller.dart';
import 'package:mwb_project/ui/views/song_details_view/song_details_view.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import '../../../core/enums/message_type.dart';
import '../../shared/custom_widgets/colored_text.dart';
import '../../shared/custom_widgets/custom_toast.dart';
import '../../shared/utils.dart';
import '../main_view/songs_view/songs_view.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class SongsSearchView extends StatefulWidget {
  const SongsSearchView({super.key, required this.controller});
final SongsController controller;
  @override
  State<SongsSearchView> createState() => _SongsSearchViewState();
}
class _SongsSearchViewState extends State<SongsSearchView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(title: Text('Search song')),
      body: Column(
          children: [
          const SizedBox(height: 20),


            Autocomplete<SongsModel>(
              optionsBuilder: (TextEditingValue textEditingValue) {
                if (textEditingValue.text == "") {
                  return Iterable<SongsModel>.empty();
                }
                return widget.controller.songsList.where((suggestion) =>
                    suggestion.title!.toLowerCase().contains(textEditingValue.text.toLowerCase())).toList();
              },
              fieldViewBuilder: (context, textEditingController, focusNode,
                  onFieldSubmitted) =>
                  Container(
                    margin: EdgeInsets.all(20),
                    child: TextField(
                      onSubmitted: (val) {
                        CustomToast.showMessage(
                            message: "no results", messageType: MessageType.REJECTED);
                      //searchController.searchSongs(val);
                      },
                      controller: textEditingController,
                      focusNode: focusNode,
                      textInputAction:TextInputAction.search,
                      cursorColor:  AppColors.primaryColor,
                      decoration: const InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        labelText: 'search song',
                        labelStyle: TextStyle(color: AppColors.primaryColor,),
                        focusedBorder:UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColors.grey),
                        ),
                        prefixIcon: Icon(Icons.search,color: AppColors.primaryColor,),
                        focusColor: AppColors.primaryColor,
                      ),
                    ),
                  ),
              displayStringForOption:(SongsModel song)=>song.title!,
              optionsViewBuilder: ((context, onSelected, options) =>
                  Align(
                      alignment: Alignment.topLeft,
                      child: SizedBox(width: screenWidth(1),
                        child: Card(elevation:0,color: AppColors.backgroundColor,child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children:
                          options.map((e) => InkWell(
                              onTap: (){onSelected(e); Get.to(SongDetailsView(song:e ,));},/*widget.controller.fromController.text=e;*/
                              child: ListTile(title: Text(e.title!),))).toList(),

                        ),),)



                  )),
              /* AppTextField(
                      controller:widget.controller.fromController,
                      width: context.width * 0.35,

                    ),*/


            ),




        ])
    ));
  }
}
