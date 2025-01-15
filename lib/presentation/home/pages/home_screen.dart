import 'package:flutter/material.dart';
import 'package:spotify_app/core/theme/app_colors.dart';
import 'package:spotify_app/core/utils/extension.dart';

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
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            ListMusicCategories()
          ],
        ),
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
                Text(item),
                Container(width: 60,
                  height: 4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  color: AppColors.primary.withOpacity(0.2)
                ),)
              ],
            );
          },
         ),
    );
  }
}
