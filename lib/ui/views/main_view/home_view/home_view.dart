import 'package:flutter/material.dart';
import 'package:mwb_project/core/utils/app_sizes.dart';
import 'package:mwb_project/ui/views/main_view/home_view/tab_bar_views/add_artist_view/add_artist_view.dart';
import 'package:mwb_project/ui/views/main_view/home_view/tab_bar_views/add_song_view/add_song_view.dart';
import '../../../shared/custom_widgets/custom_bar.dart';
import '../../../shared/custom_widgets/tab_bar_component.dart';


class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: SizedBox(
          height: context.height * 1,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Stack(
                  children: [
                    const CustomBar(title: ''),
                    Positioned(
                        top: context.height * 0.19,
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child:  DefaultTabController(
                          length: 2,
                          child: Column(
                            children: [
                              TabBarComponent(),
                              Expanded(
                                child: TabBarView(
                                    children: [
                                      AddSongView(),
                                      AddArtistView(),
                                    ]),
                              ),
                            ],
                          ),
                        ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
