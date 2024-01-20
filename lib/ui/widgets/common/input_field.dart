import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_3/ui/style.dart';

class InputField extends StatefulWidget {
  final TextEditingController? controller;
  String text;
  final double? horizontalContentPadding;
  final double? verticalContentPadding;
  final double? fontSize;
  final Color? fillColor;
  final Color? iconColor;
  final Color? fillTextColor;
  final Color? borderColor;
  final Color? textColor;
  final int? maxLines;
  final int? maxLength;
  final double? heightBgContainer;
  final double? borderRadius;
  final bool autofocus;
  final bool disabled;
  final bool disabledOnlyEdit;
  final bool readOnly;
  final TextCapitalization textCapitalization;
  final VoidCallback? onEditingComplete;
  final VoidCallback? onSuffixIconPress;
  final bool needOnChange;
  final bool needNeumorphic;
  final bool needIconClose;
  final bool autoValidate;
  final void Function(String value)? onChange;
  final VoidCallback? onPress;
  final VoidCallback? onPrefixIconPress;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final FormFieldValidator<String?>? validator;
  final TextInputAction? textInputAction;
  final AutovalidateMode? autovalidateMode;
  final bool expands;
  final TextAlignVertical? textAlignVertical;
  final TextAlign? textAlign;
  final FocusNode? focusNode;
  final String? prefixIcon;
  final String? suffixIcon;
  final String? suffixIconPrivate;
  final String? prefixText;
  final String? suffixText;
  final Widget? suffixWidget;
  bool needErrorStyle;
  bool private;
  bool needChangePrivate;
  final EdgeInsets? iconPadding;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final Color? floatingLabelColor;
  final String? floatinglabelText;
  final bool needIconColor;

  InputField({
    Key? key,
    required this.text,
    this.controller,
    this.maxLines,
    this.maxLength,
    this.validator,
    this.onChange,
    this.disabledOnlyEdit = false,
    this.disabled = false,
    this.autofocus = false,
    this.onEditingComplete,
    this.onSuffixIconPress,
    this.textCapitalization = TextCapitalization.none,
    this.keyboardType,
    this.inputFormatters,
    this.textInputAction,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.needOnChange = false,
    this.needNeumorphic = true,
    this.needIconClose = true,
    this.expands = false,
    this.focusNode,
    this.textAlignVertical,
    this.textAlign,
    this.fontSize,
    this.suffixIcon,
    this.fillColor,
    this.fillTextColor,
    this.onPress,
    this.private = false,
    this.needErrorStyle = true,
    this.needChangePrivate = false,
    this.suffixIconPrivate,
    this.prefixIcon,
    this.borderRadius,
    this.heightBgContainer,
    required this.autoValidate,
    this.horizontalContentPadding,
    this.verticalContentPadding,
    this.prefixText,
    this.suffixText,
    this.borderColor,
    this.readOnly = false,
    this.iconColor,
    this.textColor,
    this.suffixWidget,
    this.onPrefixIconPress,
    this.iconPadding,
    this.floatingLabelBehavior,
    this.floatingLabelColor,
    this.floatinglabelText,
    this.needIconColor = true,
  }) : super(key: key);

  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.heightBgContainer,
      child: TextFormField(
        onChanged: widget.onChange,
        textAlign: widget.textAlign ?? TextAlign.start,
        textAlignVertical: widget.textAlignVertical ?? TextAlignVertical.center,
        expands: widget.expands,
        focusNode: widget.focusNode,
        inputFormatters: widget.inputFormatters,
        keyboardType: widget.keyboardType,
        enabled: !widget.disabled && !widget.disabledOnlyEdit,
        readOnly: widget.readOnly,
        autofocus: widget.autofocus,
        textCapitalization: widget.textCapitalization,
        autovalidateMode: widget.autoValidate ? AutovalidateMode.onUserInteraction : AutovalidateMode.disabled,
        validator: widget.validator,
        controller: widget.controller,
        maxLines: widget.maxLines,
        maxLength: widget.maxLength,
        obscureText: widget.private,
        textInputAction: widget.textInputAction,
        onEditingComplete: widget.onEditingComplete,
        cursorColor: AppColors.primaryBlue,
        style: TextStyle(
            fontFamily: AppFontFamily.primary,
            fontSize: widget.fontSize ?? 12.sp,
            color: widget.textColor ?? Colors.white,
            fontWeight: FontWeight.w500),
        decoration: InputDecoration(
          suffixText: widget.suffixText,
          suffixStyle: TextStyle(
              fontFamily: AppFontFamily.primary,
              fontSize: widget.fontSize ?? 12.sp,
              color: Colors.white,
              fontWeight: FontWeight.w500),
          prefixText: widget.prefixText,

          prefixStyle: TextStyle(
              fontFamily: AppFontFamily.primary,
              fontSize: widget.fontSize ?? 12.sp,
              color: Colors.white,
              fontWeight: FontWeight.w500),
          floatingLabelBehavior: widget.floatingLabelBehavior ?? FloatingLabelBehavior.always,
          labelStyle: TextStyle(
              fontFamily: AppFontFamily.primary,
              color: widget.floatingLabelColor ?? AppColors.greyLight,
              fontSize: 12.sp,
              fontWeight: FontWeight.w400),
          labelText: widget.floatinglabelText,
          // isDense: true,
          contentPadding: EdgeInsets.symmetric(
            horizontal: widget.horizontalContentPadding ?? 16.sp,
            vertical: widget.verticalContentPadding ?? 15.sp,
          ),
          fillColor: widget.fillColor ?? AppColors.black,
          filled: true,
          hintText: widget.text,

          hintStyle: TextStyle(
              fontFamily: AppFontFamily.primary,
              fontSize: widget.fontSize ?? 12.sp,
              color: widget.fillTextColor ?? AppColors.greyLight,
              fontWeight: FontWeight.w500),
          border: _getBorder(),
          disabledBorder: _getBorder(),
          enabledBorder: _getBorder(),
          focusedBorder: _getBorder(focused: true),
          focusedErrorBorder: _getErrorBorder(),
          errorBorder: _getErrorBorder(),
          errorStyle: widget.needErrorStyle
              ? TextStyle(fontFamily: AppFontFamily.primary, height: 0.7, fontSize: 10.sp, color: Colors.red)
              : TextStyle(
                  fontFamily: AppFontFamily.primary,
                  height: 0.1.sp,
                  color: Colors.transparent,
                  fontSize: 0.1), //color error text
          prefixIconConstraints: BoxConstraints(maxHeight: 40.sp, minHeight: 40.sp, maxWidth: 40.sp, minWidth: 40.sp),
          prefixIcon: widget.prefixIcon != null
              ? GestureDetector(
                  onTap: () {
                    if (widget.onPrefixIconPress != null) {
                      widget.onPrefixIconPress!();
                    }
                  },
                  child: Padding(
                    padding: EdgeInsets.only(left: 16.sp, right: 4.sp),
                    child: Center(
                      child: Container(
                        width: 20.sp,
                        height: 20.sp,
                        child: SvgPicture.asset(widget.prefixIcon!,
                            colorFilter: widget.needIconColor
                                ? ColorFilter.mode(widget.iconColor ?? AppColors.white, BlendMode.srcIn)
                                : null),
                      ),
                    ),
                  ),
                )
              : null,
          suffixIconConstraints: BoxConstraints(
              maxHeight: widget.iconPadding == null ? 40.sp : widget.heightBgContainer ?? 0,
              minHeight: 10.sp,
              maxWidth: 40.sp,
              minWidth: 10.sp),
          suffixIcon: Padding(
            padding: widget.iconPadding ?? EdgeInsets.zero,
            child: widget.suffixWidget ??
                (widget.suffixIcon != null
                    ? GestureDetector(
                        onTap: () {
                          if (widget.needChangePrivate) {
                            setState(() {
                              widget.private = !widget.private;
                            });
                          }
                          if (widget.onSuffixIconPress != null) {
                            widget.onSuffixIconPress!();
                          }
                        },
                        child: Container(
                          color: Colors.transparent,
                          child: Padding(
                            padding: EdgeInsets.only(right: 16.sp, left: 4.sp),
                            child: Center(
                              child: Container(
                                // width: 20.sp,
                                // height: 20.sp,
                                color: Colors.transparent,
                                child: SvgPicture.asset(widget.private ? widget.suffixIconPrivate! : widget.suffixIcon!,
                                    colorFilter: widget.needIconColor
                                        ? ColorFilter.mode(widget.iconColor ?? AppColors.white, BlendMode.srcIn)
                                        : null),
                              ),
                            ),
                          ),
                        ),
                      )
                    : null),
          ),
        ),
        onTap: () {
          if (widget.onPress != null) {
            widget.onPress!();
          }
        },
      ),
    );
  }

  InputBorder _getBorder({bool focused = false}) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: widget.borderColor ?? (focused ? AppColors.primaryBlue : AppColors.greyLight),
        width: 0.5.sp,
      ),
      borderRadius: BorderRadius.circular(widget.borderRadius ?? 12.sp),
    );
  }

  InputBorder _getErrorBorder() {
    return OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red, width: 1.sp),
        borderRadius: BorderRadius.circular(widget.borderRadius ?? 10.sp));
  }
}
