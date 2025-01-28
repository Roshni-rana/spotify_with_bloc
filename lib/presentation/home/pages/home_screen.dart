import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_app/core/theme/app_colors.dart';
import 'package:spotify_app/core/utils/extension.dart';
import 'package:spotify_app/presentation/home/bloc/home_bloc.dart';
import 'package:spotify_app/presentation/home/bloc/home_event.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  List<dynamic> listMusic = [
    "New",
    "Music",
    "Video",
    "Artists",
    "Podcasts",
  ];

  @override
  Widget build(BuildContext context) {
    final booleanBloc = BlocProvider.of<HomeBloc>(context);
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<HomeBloc, bool>(
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                title: Text('Home'),
              ),
              body: Center(
                child: Text('Home Content'),
              ),
            );
          },
        )

        //
        // BlocBuilder<HomeBloc, bool>(
        //   builder: (context, state) {
        //     return Column(
        //       children: [
        //         Row(
        //           children: [
        //             ListMusicCategories()
        //           ],
        //         ),
        //       ],
        //     );
        //   },
        // ),
      ),
    );
  }

  ListMusicCategories() {
    return Expanded(
      child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
        separatorBuilder: (context, i) => 20.widthSizeBox,
        padding: EdgeInsets.only(left: 20, right: 20),
          itemCount: listMusic.length,
          itemBuilder: (context, index) {
            final item = listMusic[index];
            return Column(
              children: [
                Text(item, style: TextStyle(fontWeight: FontWeight.w500),),
                Container(width: 24,
                  height: 4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(5), bottomLeft: Radius.circular(5)),
                  color: AppColors.primary
                ),)
              ],
            );
          },
         ),
    );
  }
}
