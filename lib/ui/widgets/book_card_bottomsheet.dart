import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task_3/data/models/reader_model.dart';
import 'package:task_3/enums.dart';
import 'package:task_3/routes.dart';
import 'package:task_3/ui/style.dart';
import 'package:task_3/ui/widgets/common/app_container.dart';
import 'package:task_3/ui/widgets/common/app_divider.dart';
import 'package:task_3/ui/widgets/common/primary_button.dart';
import 'package:task_3/ui/widgets/reserve_or_issuence_dialog.dart';

import '../../data/models/book_model.dart';

class BookCardBottomsheet extends StatelessWidget {
  final BookModel book;
  final List<BookModel> allBooks;
  final List<ReaderModel> readers;
  final Function(ReaderModel reader) onBookIssued;
  const BookCardBottomsheet(
      {super.key, required this.book, required this.allBooks, required this.readers, required this.onBookIssued});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.sp),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppContainer(
            padding: EdgeInsets.symmetric(vertical: 8.sp),
            child: Column(
              children: [
                if (book.status == BookStatus.InLibrary)
                  Column(
                    children: [
                      PrimaryButton(
                        title: 'Выдать',
                        bgColor: AppColors.black,
                        onPress: () async {
                          final newBook = await Get.dialog<BookModel>(ReserveOrIssuenceDialog(
                            book: book,
                            allBooks: allBooks,
                            readers: readers,
                            isIssued: true,
                            onBookIssued: (reader) => onBookIssued(reader),
                          ));
                          AppRoutes.goBack(result: newBook);
                        },
                      ),
                      AppDivider(),
                      PrimaryButton(
                        title: 'Забронировать',
                        bgColor: AppColors.black,
                        onPress: () async {
                          final newBook = await Get.dialog<BookModel>(ReserveOrIssuenceDialog(
                            book: book,
                            allBooks: allBooks,
                            readers: readers,
                            isIssued: false,
                            onBookIssued: (reader) => onBookIssued(reader),
                          ));
                          AppRoutes.goBack(result: newBook);
                        },
                      ),
                    ],
                  ),
                if (book.status == BookStatus.Booked)
                  Column(
                    children: [
                      PrimaryButton(
                        title: 'Выдать',
                        bgColor: AppColors.black,
                        onPress: () async {
                          final newBook = await Get.dialog<BookModel>(ReserveOrIssuenceDialog(
                            book: book,
                            allBooks: allBooks,
                            readers: readers,
                            isIssued: true,
                            onBookIssued: (reader) => onBookIssued(reader),
                          ));
                          AppRoutes.goBack(result: newBook);
                        },
                      ),
                      AppDivider(),
                      PrimaryButton(
                        title: 'Cнять резерв',
                        bgColor: AppColors.black,
                        onPress: () => AppRoutes.goBack(
                          result: _bookModel(BookStatus.InLibrary),
                        ),
                      ),
                    ],
                  ),
                if (book.status == BookStatus.OutOfLibrary)
                  Column(
                    children: [
                      PrimaryButton(
                          title: 'Принять книгу',
                          bgColor: AppColors.black,
                          onPress: () {
                            final newBook = _bookModel(BookStatus.InLibrary);
                            var readerWhoReturn = readers.firstWhere((element) => element.id == newBook.readNow!.id);
                            var updatedWhoReturn = ReaderModel.copyWith(
                                id: readerWhoReturn.id,
                                firstName: readerWhoReturn.firstName,
                                lastName: readerWhoReturn.lastName,
                                patronymic: readerWhoReturn.patronymic,
                                birthday: readerWhoReturn.birthday,
                                takedBooks: readerWhoReturn.takedBooks,
                                returnedBooks: [...readerWhoReturn.returnedBooks, book]);
                            onBookIssued(updatedWhoReturn);
                            AppRoutes.goBack(result: newBook);
                          }),
                    ],
                  ),
              ],
            ),
          ),
          10.verticalSpace,
          PrimaryButton(
            title: 'Отмена',
            bgColor: AppColors.black,
            onPress: () => AppRoutes.goBack(),
          ),
          Space.bottomSafeArea.verticalSpace,
        ],
      ),
    );
  }

  BookModel _bookModel(BookStatus status) {
    return BookModel.copyWith(
      id: book.id,
      name: book.name,
      author: book.author,
      status: status,
      description: book.description,
      dateOfPublication: book.dateOfPublication,
      readNow: book.readNow,
    );
  }
}
