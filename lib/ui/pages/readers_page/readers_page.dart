import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task_3/controllers/common/app_controller.dart';
import 'package:task_3/routes.dart';
import 'package:task_3/ui/style.dart';
import 'package:task_3/ui/widgets/common/app_text.dart';
import 'package:task_3/ui/widgets/common/header_button.dart';
import 'package:task_3/ui/widgets/common/reader_card.dart';
import 'package:task_3/ui/widgets/layout/page_layout.dart';

class ReadersPage extends StatelessWidget {
  final _controller = Get.find<AppController>();
  ReadersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageLayout(
        child: SafeArea(
      bottom: false,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.sp),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                HeaderButton(
                  onPress: () => AppRoutes.goBack(),
                  icon: 'assets/images/chevron_left.svg',
                ),
                AppText('Читатели', fontSize: 24.sp, fontWeight: FontWeight.w700),
                40.horizontalSpace,
              ],
            ),
          ),
          Expanded(
              child: ListView(
            padding: EdgeInsets.fromLTRB(16.sp, 16.sp, 16.sp, 0),
            children: [
              ..._controller.allReaders.map(
                (reader) => ReaderCard(reader: reader),
              ),
              Space.bottomSafeArea.horizontalSpace,
            ],
          ))
        ],
      ),
    ));
  }
}
