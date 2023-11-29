import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:observable_flutter/ui/views/home/home_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:observable_flutter/ui/common/app_colors.dart';
import 'package:observable_flutter/ui/common/ui_helpers.dart';
import 'package:stacked/stacked_annotations.dart';

import 'home_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'searchTerm'),
])
class HomeView extends StackedView<HomeViewModel> with $HomeView {
  const HomeView({Key? key}) : super(key: key);

  @override
  void onViewModelReady(HomeViewModel viewModel) {
    syncFormWithViewModel(viewModel);
  }

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Books",
          textAlign: TextAlign.center,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: viewModel.fetchNewBooks,
        child: const Icon(Icons.search),
      ),
      body: SafeArea(
        child: viewModel.isBusy
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: TextField(
                      decoration: const InputDecoration(
                        hintText: "Search",
                      ),
                      controller: searchTermController,
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: viewModel.data?.length,
                      itemBuilder: (context, index) {
                        final book = viewModel.data?[index];
                        return Card(
                          child: ListTile(
                            title: Text(book?.title ?? ""),
                            onTap: () => viewModel.navigateToBook(book!),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
