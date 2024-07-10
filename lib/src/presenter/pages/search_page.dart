import 'package:flutter/material.dart';
import 'package:value_notifier_plus/value_notifier_plus.dart';

import '../blocs/search_bloc.dart';
import '../constants/app_colors.dart';
import '../constants/app_typography.dart';
import '../widgets/card_horizontal_widget.dart';
import '../widgets/input_field_widget.dart';

class SearchPage extends StatelessWidget with AppTypography {
  final SearchBloc bloc;
  SearchPage({super.key, required this.bloc});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.black,
        body: Column(
          children: [
            InputFieldWidget(
              onChanged: (term) {
                context.of<SearchBloc>().searchMovie(term);
              },
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.75,
              child: ValueNotifierPlusBuilder<SearchBloc, SearchState>(
                notifier: bloc,
                builder: (context, state) {
                  return switch (state) {
                    SearchSuccess() => ListView.separated(
                        itemBuilder: (context, index) => CardHorizontalWidget(
                          imageUrl: state.movies[index].thumbnail,
                          title: state.movies[index].title,
                          description: state.movies[index].description,
                          onTap: () {},
                        ),
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 20),
                        itemCount: state.movies.length,
                      ),
                    SearchFailure() => Center(
                        child: Text(
                          state.failure.description,
                        ),
                      ),
                    SearchInProgress() => const Center(
                        child: CircularProgressIndicator(),
                      ),
                    SearchInitial() => const Center(
                        child: Text('Search for a movie'),
                      ),
                    SearchState() => const SizedBox.shrink(),
                  };
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
