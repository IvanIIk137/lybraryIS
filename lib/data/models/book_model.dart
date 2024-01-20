import 'package:task_3/data/models/reader_model.dart';
import '../../enums.dart';

class BookModel {
  final int id;
  final String name;
  final String author;
  final String? description;
  final BookStatus status;
  final String? dateOfPublication;
  final ReaderModel? readNow;

  BookModel({
    required this.id,
    required this.name,
    required this.author,
    required this.description,
    required this.status,
    required this.dateOfPublication,
    this.readNow,
  });

  factory BookModel.copyWith({
    required int id,
    required String name,
    required String author,
    String? description,
    required BookStatus status,
    String? dateOfPublication,
    ReaderModel? readNow,
  }) {
    return BookModel(
      id: id,
      name: name,
      author: author,
      description: description,
      status: status,
      dateOfPublication: dateOfPublication,
      readNow: readNow,
    );
  }
  static int newId(List<BookModel> allBooks) {
    var newId = 0;
    for (var i in allBooks) {
      if (i.id > newId) {
        newId = i.id;
      }
    }
    return newId + 1;
  }
}

List<BookModel> books = [
  BookModel(
    id: 1,
    name: '1984',
    author: 'George Orwell',
    description:
        'По жанру это роман антиутопия , он актуален до сих пор . После его прочтения заставляет всех нас задуматься и переосмыслить свою жизнь . В романе очень точно описаны все признаки тоталитарного государства - отсутствие свободной прессы , тотальный контроль всего населения и многое другое.',
    status: BookStatus.InLibrary,
    dateOfPublication: '5.01.1980',
  ),
  BookModel(
    id: 2,
    name: 'Хоббит или туда и обратно',
    author: 'Джон Рональд Руэл Толкин',
    description:
        'Хоббит, или Туда и Обратно" - это фэнтезийный роман Дж.Р.Р. Толкиена, рассказывающий о приключениях хоббита по имени Бильбо Бэггинс. История начинается, когда волшебник Гэндальф и группа гномов приглашают Бильбо присоединиться к ним в экспедиции для восстановления потерянного королевства гномов, захваченного драконом Смаугом. Бильбо сталкивается с драконами, гоблинами, эльфами и другими фантастическими созданиями, обретая смелость и умение противостоять темным силам. "Хоббит" часто рассматривается как произведение, предшествующее "Властелину Колец", и предоставляющее читателям увлекательное введение в мир Средиземья',
    status: BookStatus.InLibrary,
    dateOfPublication: '5.01.1991',
  ),
  BookModel(
    id: 3,
    name: 'Властелин колец. Трилогия',
    author: 'Джон Рональд Руэл Толкин',
    description:
        'История развертывается в фэнтезийном мире Средиземья и следует за приключениями Фродо Бэггинса и его друзей, стремящихся уничтожить Кольцо Всевластия, созданное темным волшебником Сауроном. Книга полна волшебства, битв, дружбы и внутренних борьб. Она стала классикой фэнтезийной литературы и оказала значительное влияние на жанр.',
    status: BookStatus.InLibrary,
    dateOfPublication: '15.11.1994',
  ),
];
