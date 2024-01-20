import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_3/data/models/book_model.dart';
import 'package:task_3/data/models/reader_model.dart';
import 'package:task_3/enums.dart';
import 'package:task_3/routes.dart';
import 'package:task_3/ui/style.dart';
import 'package:task_3/ui/widgets/common/app_container.dart';
import 'package:task_3/ui/widgets/common/app_divider.dart';
import 'package:task_3/ui/widgets/common/app_text.dart';
import 'package:task_3/ui/widgets/common/book_card.dart';
import 'package:task_3/ui/widgets/common/primary_button.dart';

class ReserveOrIssuenceDialog extends StatefulWidget {
  final BookModel book;
  final bool isIssued;
  final List<BookModel> allBooks;
  final List<ReaderModel> readers;
  final Function(ReaderModel reader) onBookIssued;
  const ReserveOrIssuenceDialog({
    super.key,
    required this.book,
    required this.allBooks,
    required this.isIssued,
    required this.readers,
    required this.onBookIssued,
  });

  @override
  State<ReserveOrIssuenceDialog> createState() => _ReserveOrIssuenceDialogState();
}

class _ReserveOrIssuenceDialogState extends State<ReserveOrIssuenceDialog> {
  ReaderModel? _selectedReader;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.sp),
        child: AppContainer(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            BookCard(
              allBooks: [],
              readers: [],
              book: widget.book,
              onBookChange: (value) {},
              onBookIssued: (value) {},
              shorDescription: true,
              disabled: true,
              bgColor: AppColors.blackBck,
            ),
            8.verticalSpace,
            AppText('Выберите читателя'),
            8.verticalSpace,
            SizedBox(
              height: 150.sp,
              child: AppContainer(
                color: AppColors.blackBck,
                child: ListView(
                  children: [
                    ...readers.map(
                      (reader) => GestureDetector(
                        onTap: () {
                          _selectedReader = reader;
                          setState(() {});
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText('${reader.lastName} ${reader.firstName} ${reader.patronymic}',
                                color: _selectedReader?.id == reader.id ? AppColors.primaryBlue : AppColors.white),
                            AppDivider(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            24.verticalSpace,
            PrimaryButton(
                title: 'Добавить',
                onPress: () {
                  if (_selectedReader != null) {
                    final book = BookModel(
                      id: widget.book.id,
                      name: widget.book.name,
                      author: widget.book.author,
                      description: widget.book.description,
                      status: widget.isIssued ? BookStatus.OutOfLibrary : BookStatus.Booked,
                      dateOfPublication: widget.book.dateOfPublication,
                      readNow: _selectedReader,
                    );
                    AppRoutes.goBack(result: book);
                    if (widget.isIssued) {
                      final updatedReader = ReaderModel.copyWith(
                          id: _selectedReader!.id,
                          firstName: _selectedReader!.firstName,
                          lastName: _selectedReader!.lastName,
                          patronymic: _selectedReader!.patronymic,
                          birthday: _selectedReader!.birthday,
                          takedBooks: [..._selectedReader!.takedBooks, book],
                          returnedBooks: [..._selectedReader!.returnedBooks]);
                      widget.onBookIssued(updatedReader);
                    }
                  }
                }),
            8.verticalSpace,
            PrimaryButton(
              title: 'Отмена',
              onPress: () {
                AppRoutes.goBack();
              },
              bgColor: AppColors.red,
            ),
          ],
        )),
      ),
    );
  }
}
