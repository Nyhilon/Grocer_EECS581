import 'package:grocer_app/app/app.locator.dart';
import 'package:grocer_app/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

// "BUSINESS LOGIC" AND VIEW STATE

class StartUpViewModel extends BaseViewModel {
  final _nagivationService = locator<NavigationService>();

  String title = '';
}
