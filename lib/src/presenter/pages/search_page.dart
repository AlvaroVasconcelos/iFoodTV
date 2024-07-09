import 'package:flutter/material.dart';
import 'package:ifoodtv/src/presenter/widgets/card_horizontal_widget.dart';

import '../constants/app_colors.dart';
import '../constants/app_typography.dart';
import '../widgets/input_field_widget.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> with AppTypography {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.black,
        body: Column(
          children: [
            const InputFieldWidget(),
            const SizedBox(height: 20),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.75,
              child: ListView.separated(
                itemBuilder: (context, index) => CardHorizontalWidget(
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
