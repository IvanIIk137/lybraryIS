import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task_3/controllers/common/app_controller.dart';
import 'package:task_3/data/models/book_model.dart';
import 'package:task_3/enums.dart';
import 'package:task_3/routes.dart';
import 'package:task_3/ui/widgets/add_book_dialog.dart';
import 'package:task_3/ui/widgets/common/app_tab_bar/app_tab_bar.dart';
import 'package:task_3/ui/widgets/common/app_text.dart';
import 'package:task_3/ui/widgets/common/book_card.dart';
import 'package:task_3/ui/widgets/common/header_button.dart';
import 'package:task_3/ui/widgets/layout/page_layout.dart';

class HomePage extends StatelessWidget {
  final _controller = Get.find<AppController>();
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageLayout(
      child: SafeArea(
        child: Obx(
          () => Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.sp),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText('Книги', fontSize: 24.sp, fontWeight: FontWeight.w700),
                    Row(
                      children: [
                        HeaderButton(
                          onPress: () => AppRoutes.goToReaders(),
                          icon: 'assets/images/user.svg',
                        ),
                        8.horizontalSpace,
                        HeaderButton(
                          onPress: () async {
                            final newBook = await Get.dialog<BookModel?>(AddBookDialog(allBooks: _controller.allBooks));
                            if (newBook != null) {
                              _controller.addBook(newBook);
                            }
                          },
                          icon: 'assets/images/plus.svg',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              AppTapBar(
                tabController: _controller.tabController,
                isScrollable: true,
                options: [
                  Option(label: 'Все', value: 'All'),
                  ...BookStatus.values
                      .map((status) => Option(label: status.toName(), value: status.convertToString()))
                      .toList()
                ],
              ),
              Expanded(
                child: TabBarView(controller: _controller.tabController, children: [
                  ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 16.sp),
                      itemCount: _controller.allBooks.length,
                      itemBuilder: (context, index) {
                        final book = _controller.allBooks[index];
                        return BookCard(
                          readers: _controller.allReaders,
                          book: book,
                          allBooks: _controller.allBooks,
                          withStatus: true,
                          onBookIssued: (reader) => _controller.addOrDeleteBookToReader(reader: reader),
                          onBookChange: (newBook) => _controller.replaceBook(newBook),
                        );
                      }),
                  ...BookStatus.values
                      .map((status) => ListView.builder(
                          padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 16.sp),
                          itemCount: _controller.allBooks.where((element) => element.status == status).length,
                          itemBuilder: (context, index) {
                            final book =
                                _controller.allBooks.where((element) => element.status == status).toList()[index];
                            return BookCard(
                              readers: _controller.allReaders,
                              book: book,
                              onBookIssued: (reader) => _controller.addOrDeleteBookToReader(reader: reader),
                              allBooks: _controller.allBooks,
                              onBookChange: (newBook) => _controller.replaceBook(newBook),
                            );
                          }))
                      .toList()
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
