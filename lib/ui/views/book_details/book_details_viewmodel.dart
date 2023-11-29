import 'package:observable_flutter/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class BookDetailsViewModel extends BaseViewModel {
  final _navigatorService = NavigationService();

  Future<void> navigateToBooks() async {
    await _navigatorService.replaceWithHomeView();
  }
}
