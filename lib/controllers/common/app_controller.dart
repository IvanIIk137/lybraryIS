import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_3/data/models/book_model.dart';
import 'package:task_3/data/models/reader_model.dart';

import 'package:task_3/enums.dart';

class AppController extends GetxController with GetTickerProviderStateMixin {
  final _selectedTab = 'All'.obs;
  String get selectedTab => _selectedTab.value;

  final _books = <BookModel>[].obs;
  List<BookModel> get allBooks => _books;
  final _readers = <ReaderModel>[].obs;
  List<ReaderModel> get allReaders => _readers;
  late TabController tabController;

  @override
  void onInit() {
    super.onInit();
    _initTabController();
    _books.value = books;
    _readers.value = readers;
  }

  void _initTabController() {
    tabController = TabController(length: BookStatus.values.length + 1, vsync: this);
    tabController.addListener(() {
      switch (tabController.index) {
        case 1:
          _selectedTab.value = BookStatus.Booked.convertToString();
          break;
        case 2:
          _selectedTab.value = BookStatus.InLibrary.convertToString();
          break;
        case 3:
          _selectedTab.value = BookStatus.OutOfLibrary.convertToString();
          break;
        default:
          _selectedTab.value = 'All';
      }
    });
  }

  void addBook(BookModel newBook) {
    _books.insert(0, newBook);
  }

  void replaceBook(BookModel? newBook) async {
    if (newBook != null) {
      _books.removeWhere((element) => element.id == newBook.id);
      _books.insert(0, newBook);
    }
  }

  void addOrDeleteBookToReader({required ReaderModel reader}) {
    _readers.removeWhere((element) => element.id == reader.id);
    _readers.insert(0, reader);
  }
}
