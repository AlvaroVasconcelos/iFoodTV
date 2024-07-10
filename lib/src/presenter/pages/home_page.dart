import 'package:flutter/material.dart';
import 'package:value_notifier_plus/value_notifier_plus.dart';

import '../blocs/home_bloc.dart';
import '../constants/app_colors.dart';
import '../constants/app_typography.dart';
import '../widgets/button/icon_button_widget.dart';
import '../widgets/button/small_button_widget.dart';
import '../widgets/button/text_button_widget.dart';
import '../widgets/button/user_button_widget.dart';
import '../widgets/button/vertical_button_widget.dart';
import '../widgets/card_vertical_widget.dart';
import '../widgets/logo/logo_large_lettermark_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.bloc});
  final HomeBloc bloc;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AppTypography {
  @override
  void initState() {
    super.initState();
    widget.bloc.fetchMovies();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          alignment: Alignment.topCenter,
          children: [
            Image.asset(
              "assets/home_background.png",
              alignment: Alignment.center,
              fit: BoxFit.fill,
              height: double.infinity,
            ),
            Container(
              color: Colors.black.withOpacity(0.2),
            ),
            Column(
              children: [
                Row(
                  children: [
                    const LogoLargeLettermarkWidget(),
                    const Spacer(),
                    IconButtonWidget(
                      icon: const Icon(
                        Icons.cast,
                        color: AppColors.white,
                      ),
                      onTap: () {},
                    ),
                    const SizedBox(width: 20),
                    UserButtonWidget(
                      onTap: () {},
                    ),
                    const SizedBox(width: 20),
                  ],
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButtonWidget(
                      label: "Tv Shows",
                      onTap: () {},
                    ),
                    TextButtonWidget(
                      label: "Movies",
                      onTap: () {},
                    ),
                    TextButtonWidget(
                      label: "Categories",
                      onTap: () {},
                    ),
                  ],
                ),
                const Spacer(),
                Center(
                  child: Text(
                    "Exciting - Reality TV - Competition",
                    style: boldLabel2,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    VerticalButtonWidget(
                      icon: const Icon(
                        Icons.add,
                        color: AppColors.white,
                      ),
                      text: Text(
                        'My List',
                        style: mediumCaption1,
                      ),
                      onTap: () {},
                    ),
                    SmallButtonWidget(
                      icon: const Icon(
                        Icons.play_arrow,
                        color: AppColors.black,
                      ),
                      text: Text(
                        'Play',
                        style: boldLabel3.copyWith(color: AppColors.black),
                      ),
                      onTap: () {},
                    ),
                    VerticalButtonWidget(
                      icon: const Icon(
                        Icons.info_outline,
                        color: AppColors.white,
                      ),
                      text: Text(
                        'Info',
                        style: mediumCaption1,
                      ),
                      onTap: () {},
                    )
                  ],
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Continue Watching for Vasconcelos.dev",
                    style: boldLabel2,
                  ),
                ),
                SizedBox(
                  height: 212,
                  child: ValueNotifierPlusBuilder<HomeBloc, HomePageState>(
                      notifier: context.of<HomeBloc>()!,
                      builder: (context, state) {
                        return switch (state) {
                          HomePageInitialState() => const SizedBox.shrink(),
                          HomePageLoadingState() => const Center(
                              child: CircularProgressIndicator(),
                            ),
                          HomePageLoadedState() => ListView.separated(
                              padding: EdgeInsets.zero,
                              scrollDirection: Axis.horizontal,
                              itemCount: state.movies.length,
                              separatorBuilder: (context, index) =>
                                  const SizedBox(width: 20),
                              itemBuilder: (context, index) {
                                final movie = state.movies[index];
                                return CardVerticalWidget(
                                  imageUrl: movie.thumbnail,
                                  onTap: () {},
                                );
                              },
                            ),
                          HomePageErrorState() => Center(
                              child: Text(state.error.description),
                            ),
                          HomePageState() => const Center(
                              child: Text('Unknown state'),
                            ),
                        };
                      }),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
