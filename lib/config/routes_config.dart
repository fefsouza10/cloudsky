import 'package:cloudsky/pages/home/home_page.dart';
import 'package:get/get.dart';

class RoutesConfig {
  static List<GetPage> routes() =>
      [GetPage(name: '/', page: () => const HomePage())];
}
