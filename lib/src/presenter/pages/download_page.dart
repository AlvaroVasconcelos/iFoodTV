import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_typography.dart';
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
        backgroundColor: AppColors.black,
        body: Column(
          children: [
            InputFieldWidget(
              onChanged: (term) {},
            ),
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
