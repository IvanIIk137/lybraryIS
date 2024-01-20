import 'package:task_3/data/models/book_model.dart';

class ReaderModel {
  final String id; //номер читательского билета
  final String firstName;
  final String lastName;
  final String patronymic;
  final String birthday;
  final List<BookModel> takedBooks;
  final List<BookModel> returnedBooks;

  ReaderModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.patronymic,
    required this.birthday,
    required this.takedBooks,
    required this.returnedBooks,
  });

  factory ReaderModel.copyWith({
    required String id,
    required String firstName,
    required String lastName,
    required String patronymic,
    required String birthday,
    required List<BookModel> takedBooks,
    required List<BookModel> returnedBooks,
  }) {
    return ReaderModel(
      id: id,
      firstName: firstName,
      lastName: lastName,
      patronymic: patronymic,
      birthday: birthday,
      takedBooks: takedBooks,
      returnedBooks: returnedBooks,
    );
  }
}

List<ReaderModel> readers = [
  ReaderModel(
    id: '1',
    firstName: 'Иван',
    lastName: 'Петров',
    patronymic: 'Александрович',
    birthday: '15.01.1990',
    takedBooks: [],
    returnedBooks: [],
  ),
  ReaderModel(
    id: '2',
    firstName: 'Ольга',
    lastName: 'Иванова',
    patronymic: 'Сергеевна',
    birthday: '10.02.1990',
    takedBooks: [],
    returnedBooks: [],
  ),
  // Add 8 more instances similarly
  ReaderModel(
    id: '3',
    firstName: 'Дмитрий',
    lastName: 'Сидоров',
    patronymic: 'Владимирович',
    birthday: '20.03.1985',
    takedBooks: [],
    returnedBooks: [],
  ),
  ReaderModel(
    id: '4',
    firstName: 'Анна',
    lastName: 'Кузнецова',
    patronymic: 'Ивановна',
    birthday: '05.05.1992',
    takedBooks: [],
    returnedBooks: [],
  ),
  ReaderModel(
    id: '5',
    firstName: 'Сергей',
    lastName: 'Смирнов',
    patronymic: 'Николаевич',
    birthday: '12.08.1988',
    takedBooks: [],
    returnedBooks: [],
  ),
  ReaderModel(
    id: '6',
    firstName: 'Елена',
    lastName: 'Попова',
    patronymic: 'Михайловна',
    birthday: '30.09.1995',
    takedBooks: [],
    returnedBooks: [],
  ),
  ReaderModel(
    id: '7',
    firstName: 'Владимир',
    lastName: 'Козлов',
    patronymic: 'Игоревич',
    birthday: '17.11.1983',
    takedBooks: [],
    returnedBooks: [],
  ),
  ReaderModel(
    id: '8',
    firstName: 'Наталья',
    lastName: 'Ильина',
    patronymic: 'Петровна',
    birthday: '25.12.1987',
    takedBooks: [],
    returnedBooks: [],
  ),
  ReaderModel(
    id: '9',
    firstName: 'Александр',
    lastName: 'Григорьев',
    patronymic: 'Дмитриевич',
    birthday: '03.04.1993',
    takedBooks: [],
    returnedBooks: [],
  ),
  ReaderModel(
    id: '10',
    firstName: 'Ирина',
    lastName: 'Федорова',
    patronymic: 'Сергеевна',
    birthday: '08.06.1986',
    takedBooks: [],
    returnedBooks: [],
  ),
];
