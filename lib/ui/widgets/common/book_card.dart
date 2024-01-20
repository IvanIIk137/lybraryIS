import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task_3/data/models/book_model.dart';
import 'package:task_3/data/models/reader_model.dart';
import 'package:task_3/enums.dart';
import 'package:task_3/ui/style.dart';
import 'package:task_3/ui/widgets/book_card_bottomsheet.dart';
import 'package:task_3/ui/widgets/common/app_container.dart';
import 'package:task_3/ui/widgets/common/app_text.dart';
import 'package:task_3/ui/widgets/common/info_row.dart';

class BookCard extends StatelessWidget {
  final BookModel book;
  final bool withStatus;
  final Function(BookModel? newBook) onBookChange;
  final Color? bgColor;
  final bool shorDescription;
  final bool disabled;
  final List<BookModel> allBooks;
  final List<ReaderModel> readers;
  final Function(ReaderModel reader) onBookIssued;
  const BookCard({
    super.key,
    required this.book,
    this.withStatus = false,
    required this.onBookChange,
    this.bgColor,
    this.shorDescription = false,
    this.disabled = false,
    required this.allBooks,
    required this.readers,
    required this.onBookIssued,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (!disabled) {
          final newBook = await Get.bottomSheet(BookCardBottomsheet(
            readers: readers,
            book: book,
            allBooks: allBooks,
            onBookIssued: (reader) => onBookIssued(reader),
          ));
          onBookChange(newBook);
        }
      },
      child: Padding(
        padding: EdgeInsets.only(bottom: 8.sp),
        child: AppContainer(
          color: bgColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InfoRow(name: 'Код издания:', info: book.id.toString()),
              8.verticalSpace,
              InfoRow(name: 'Название:', info: book.name),
              8.verticalSpace,
              InfoRow(name: 'Автор:', info: book.author),
              8.verticalSpace,
              AppText(
                'Описание:',
                fontSize: 12.sp,
                color: AppColors.greyLight,
              ),
              8.verticalSpace,
              AppText(
                book.description ?? '',
                fontSize: 12.sp,
                maxLines: shorDescription ? 3 : 10000,
              ),
              8.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(
                    'Статус:',
                    fontSize: 12.sp,
                    color: AppColors.greyLight,
                  ),
                  AppText(
                    book.status.toName(),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700,
                    color: _statusColor(),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Color _statusColor() {
    switch (book.status) {
      case BookStatus.Booked:
        return AppColors.gold;
      case BookStatus.InLibrary:
        return AppColors.green;
      case BookStatus.OutOfLibrary:
        return AppColors.red;
    }
  }
}
