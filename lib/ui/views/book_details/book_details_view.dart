import 'package:flutter/material.dart';
import 'package:observable_flutter/models/book.dart';
import 'package:stacked/stacked.dart';

import 'book_details_viewmodel.dart';

class BookDetailsView extends StackedView<BookDetailsViewModel> {
  final Book book;
  const BookDetailsView({Key? key, required this.book}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    BookDetailsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text("Book Details"),
        leading: IconButton(
          onPressed: viewModel.navigateToBooks,
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite),
          )
        ],
      ),
      body: Container(
        height: double.infinity,
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.network(book.imageLinks!.thumbnail),
              Text(book.description ?? "No Description"),
            ],
          ),
        ),
      ),
    );
  }

  @override
  BookDetailsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      BookDetailsViewModel();
}
