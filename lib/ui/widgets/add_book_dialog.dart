import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_3/data/models/book_model.dart';
import 'package:task_3/enums.dart';
import 'package:task_3/routes.dart';
import 'package:task_3/ui/style.dart';
import 'package:task_3/ui/widgets/common/app_container.dart';
import 'package:task_3/ui/widgets/common/app_text.dart';
import 'package:task_3/ui/widgets/common/input_field.dart';
import 'package:task_3/ui/widgets/common/primary_button.dart';

class AddBookDialog extends StatefulWidget {
  final List<BookModel> allBooks;
  final BookModel? editableBook;
  const AddBookDialog({super.key, required this.allBooks, this.editableBook});

  @override
  State<AddBookDialog> createState() => _AddBookDialogState();
}

class _AddBookDialogState extends State<AddBookDialog> {
  final _nameController = TextEditingController();
  final _authorController = TextEditingController();
  final _dateController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    if (widget.editableBook != null) {
      _nameController.text = widget.editableBook!.name;
      _authorController.text = widget.editableBook!.author;
      _dateController.text = widget.editableBook!.dateOfPublication ?? '';
      _descriptionController.text = widget.editableBook!.description ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.sp),
      child: Center(
        child: Form(
          key: _formKey,
          child: AppContainer(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppText('Добавить книгу', fontSize: 20.sp, fontWeight: FontWeight.w600),
                24.verticalSpace,
                InputField(
                  text: '',
                  controller: _nameController,
                  autoValidate: false,
                  floatinglabelText: 'Название',
                  validator: validation,
                ),
                16.verticalSpace,
                InputField(
                  text: '',
                  controller: _authorController,
                  autoValidate: false,
                  floatinglabelText: 'Автор',
                  validator: validation,
                ),
                16.verticalSpace,
                InputField(
                  text: '',
                  controller: _dateController,
                  autoValidate: false,
                  floatinglabelText: 'Дата публикации',
                  validator: validation,
                ),
                16.verticalSpace,
                InputField(
                  text: '',
                  controller: _descriptionController,
                  autoValidate: false,
                  floatinglabelText: 'Описание',
                  validator: validation,
                  maxLines: 10,
                ),
                24.verticalSpace,
                PrimaryButton(
                    title: 'Добавить',
                    onPress: () {
                      if (_formKey.currentState!.validate()) {
                        AppRoutes.goBack(
                            result: BookModel(
                          id: BookModel.newId(widget.allBooks),
                          name: _nameController.text,
                          author: _authorController.text,
                          description: _descriptionController.text,
                          status: BookStatus.InLibrary,
                          dateOfPublication: _dateController.text,
                        ));
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
            ),
          ),
        ),
      ),
    );
  }

  String? validation(String? value) {
    if (value == null || value.replaceAll(RegExp('\\s+'), ' ').trim().isEmpty) {
      return 'Обязательное поле';
    }

    return null;
  }
}
