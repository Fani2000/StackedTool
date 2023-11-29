import 'package:observable_flutter/app/app.bottomsheets.dart';
import 'package:observable_flutter/app/app.dialogs.dart';
import 'package:observable_flutter/app/app.locator.dart';
import 'package:observable_flutter/app/app.router.dart';
import 'package:observable_flutter/models/book.dart';
import 'package:observable_flutter/services/api_service.dart';
import 'package:observable_flutter/ui/common/app_strings.dart';
import 'package:observable_flutter/ui/views/home/home_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends FutureViewModel<List<Book>> with FormStateHelper {
  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _navigationServer = locator<NavigationService>();
  final _apiService = locator<ApiService>();

  String get counterLabel => 'Counter is: $_counter';

  int _counter = 0;

  void incrementCounter() {
    _counter++;
    rebuildUi();
  }

  void showDialog() {
    _dialogService.showCustomDialog(
      variant: DialogType.infoAlert,
      title: 'Stacked Rocks!',
      description: 'Give stacked $_counter stars on Github',
    );
    // _navigationServer.pushNamedAndRemoveUntil();
  }

  void showBottomSheet() {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.notice,
      title: ksHomeBottomSheetTitle,
      description: ksHomeBottomSheetDescription,
    );
  }

  @override
  Future<List<Book>> futureToRun() {
    var books = _apiService.getBooks(
        genreType: searchTermValue?.replaceAll(" ", "+") ?? "Percy+Jackson");
    print('😂😂😂BOOKS');
    books.then((value) {
      print("BOOK: $value");
    });
    return books;
  }

  Future<void> navigateToBook(Book book) async {
    await _navigationServer.replaceWithBookDetailsView(book: book);
  }

  // @override
  // void setFormStatus() {}
  Future<void> fetchNewBooks() async {
    await initialise();
  }

  @override
  void onData(List<Book>? data) {
    print("BOOK: ${data?.length}");
    super.onData(data);
  }

  @override
  void onError(error) {
    super.onError(error);
  }
}
