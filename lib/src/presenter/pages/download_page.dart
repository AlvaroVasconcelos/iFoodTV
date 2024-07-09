import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ifoodtv/src/presenter/constants/app_typography.dart';

import '../constants/app_colors.dart';
import '../widgets/card_horizontal_download_widget.dart';
import '../widgets/input_field_widget.dart';

class DownloadPage extends StatefulWidget {
  const DownloadPage({super.key});

  @override
  State<DownloadPage> createState() => _DownloadPageState();
}

class _DownloadPageState extends State<DownloadPage> with AppTypography {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.black,
          fixedColor: AppColors.grey,
          unselectedLabelStyle: boldCaption2,
          currentIndex: 2,
          onTap: (index) {},
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: AppColors.grey,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                color: AppColors.grey,
              ),
              label: 'Seach',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.download,
                color: AppColors.grey,
              ),
              label: 'Downloads',
            ),
          ],
        ),
        backgroundColor: AppColors.black,
        body: Column(
          children: [
            const InputFieldWidget(),
            const SizedBox(height: 20),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.75,
              child: ListView.separated(
                itemBuilder: (context, index) => CardHorizontalDownloadWidget(
                  imageUrl: 'assets/tile_image.png',
                  title: 'Title',
                  description: 'Description',
                  onTap: () {},
                ),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 20),
                itemCount: 10,
              ),
            )
          ],
        ),
      ),
    );
  }
}
