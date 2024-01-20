import 'package:get/get.dart';

import 'package:task_3/ui/pages/home_page.dart';
import 'package:task_3/ui/pages/readers_page/readers_page.dart';

class AppRoutes {
  static final pages = [
    // plop_page_place - don`t delete this line
    GetPage(name: '/readers', page: () => ReadersPage()),
    GetPage(name: '/home', page: () => HomePage()),
  ];

  static void _navigate(String routeName, bool offOne, bool offAll, {dynamic arguments}) {
    if (offAll) {
      Get.offAllNamed(routeName, arguments: arguments);
    } else if (offOne) {
      Get.offAndToNamed(routeName, arguments: arguments);
    } else {
      Get.toNamed(routeName, arguments: arguments);
    }
  }

  static void goBack<T>({T? result}) {
    Get.back(result: result);
  }

  // plop_method_place - don`t delete this line

  static void goToReaders({bool offOne = false, offAll = false}) => _navigate('/readers', offOne, offAll);

  static void goToHome({bool offOne = false, offAll = false}) => _navigate('/home', offOne, offAll);
}
