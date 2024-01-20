import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_3/ui/style.dart';
import 'package:task_3/ui/widgets/common/app_container.dart';
import 'package:task_3/ui/widgets/common/app_text.dart';
import 'package:task_3/ui/widgets/common/info_row.dart';

import '../../../data/models/reader_model.dart';

class ReaderCard extends StatelessWidget {
  final ReaderModel reader;
  const ReaderCard({super.key, required this.reader});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.sp),
      child: AppContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText('${reader.lastName} ${reader.firstName} ${reader.patronymic}', color: AppColors.white),
            8.verticalSpace,
            InfoRow(name: 'Дата рождения', info: reader.birthday),
            8.verticalSpace,
            AppText(
              'Книги у читателя:',
              fontSize: 12.sp,
              color: AppColors.greyLight,
            ),
            if (reader.takedBooks.isEmpty)
              Padding(padding: EdgeInsets.only(top: 8.sp), child: AppText('Нет задолжностей')),
            if (reader.takedBooks.isNotEmpty) 8.verticalSpace,
            if (reader.takedBooks.isNotEmpty) ...reader.takedBooks.map((e) => AppText(e.name)),
            8.verticalSpace,
            AppText(
              'Прочитанные книги:',
              fontSize: 12.sp,
              color: AppColors.greyLight,
            ),
            if (reader.returnedBooks.isEmpty) Padding(padding: EdgeInsets.only(top: 8.sp), child: AppText('Нет книг')),
            if (reader.returnedBooks.isNotEmpty) 8.verticalSpace,
            if (reader.returnedBooks.isNotEmpty) ...reader.returnedBooks.map((e) => AppText(e.name))
          ],
        ),
      ),
    );
  }
}
