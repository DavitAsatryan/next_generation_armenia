import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:next_generation_armenia/core/presantation/utilities/typography/text_theme.dart';
import 'package:next_generation_armenia/core/presantation/widgets/base/base_stateless_state.dart';

class CustomTextField extends BaseStatelessWidget {
  final String hint;
  final String? labelText;
  final bool isPasswordField;
  TextEditingController? controller;
  String? initialValue;
  String? errorText;
  String? obscuringCharacter;

  List<TextInputFormatter>? inputFormatters;
  bool hidePassword;
  bool? isValidSuffixIcon;
  int? maxLines;
  int? minLines;
  Color? suffixIconColor;
  FocusNode? focusNode;
  Widget? prefixIcon;
  Widget? suffixIcon;
  Color? textColor;
  Color? cursorColor;
  int? maxLength;
  bool showSuccessIcon;
  bool showErrorIcon;
  bool showBorders;
  bool enabled;
  bool readOnly;
  bool ignoring;
  double borderWidth;
  double borderRadius;
  TextCapitalization? textCapitalization;
  TextInputType? keyboardType;
  TextStyle? labelStyle;
  TextStyle? style;
  Color? borderColor;
  Function()? togglePasswordVisibility;
  Function()? onTap;
  Function(String)? onSubmitted;
  ValueChanged<String>? onChanged;

  CustomTextField({
    super.key,
    required this.hint,
    this.labelText,
    this.isPasswordField = false,
    this.controller,
    this.isValidSuffixIcon,
    this.errorText,
    this.obscuringCharacter,
    this.suffixIconColor,
    this.initialValue,
    this.focusNode,
    this.maxLines = 1,
    this.minLines = 1,
    this.borderWidth = 0.5,
    this.labelStyle,
    this.style,
    this.textColor,
    this.maxLength,
    this.textCapitalization,
    this.prefixIcon,
    this.suffixIcon,
    this.borderRadius = 10,
    this.keyboardType,
    this.showBorders = true,
    this.enabled = true,
    this.readOnly = false,
    this.hidePassword = false,
    this.showSuccessIcon = false,
    this.showErrorIcon = false,
    this.ignoring = false,
    this.inputFormatters,
    this.onTap,
    this.onChanged,
    this.togglePasswordVisibility,
    this.borderColor,
    this.cursorColor,
    this.onSubmitted,
  });
  @override
  Widget baseBuild(BuildContext context) {
    if (controller?.text != initialValue && initialValue != null) {
      controller?.text = initialValue ?? '';
    }
    return IgnorePointer(
      ignoring: ignoring,
      child: TextField(
        style: style ??
            fonts.titleMedium?.copyWith(
              color: textColor ?? colors.duskyBlueColor,
            ),
        keyboardType: keyboardType,
        focusNode: focusNode,
        textInputAction: TextInputAction.done,
        enabled: enabled,
        controller: controller,
        readOnly: readOnly,
        maxLines: maxLines,
        minLines: minLines,
        cursorColor: cursorColor ?? colors.duskyBlueColor,
        maxLength: maxLength,
        inputFormatters: inputFormatters,
        obscureText: isPasswordField ? hidePassword : false,
        textCapitalization: textCapitalization ?? TextCapitalization.sentences,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.always,
            errorText: errorText,
            labelStyle: labelStyle,
            labelText: labelText,
            hintText: hint,
            hintStyle: fonts.textRegular
                .copyWith(fontSize: 16, color: colors.duskyBlueColor),
            filled: true,
            fillColor: colors.mainBackgroundColor,
            border: InputBorder.none,
            counterText: '',
            contentPadding: const EdgeInsets.symmetric(
              vertical: 5,
              horizontal: 16,
            ),
            prefixIcon: prefixIcon,
            suffixIcon: isValidSuffixIcon == true
                ? Container(
                    padding: const EdgeInsets.all(15),
                    child: GestureDetector(
                      onTap: togglePasswordVisibility,
                      child: Image.asset(
                        "lib/core/presantation/utilities/assets/icons/show_password_icon.png",
                        color: colors.duskyBlueColor,
                      ),
                    ),
                  )
                : suffixIcon,
            errorBorder: showBorders
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(borderRadius),
                    ),
                    borderSide: BorderSide(
                      width: borderWidth,
                      color: errorText != null
                          ? colors.errorColor
                          : colors.duskyBlueColor,
                    ),
                  )
                : null,
            enabledBorder: showBorders
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(borderRadius),
                    ),
                    borderSide: BorderSide(
                        width: borderWidth,
                        color: borderColor ?? colors.duskyBlueColor),
                  )
                : null,
            focusedErrorBorder: showBorders
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(borderRadius),
                    ),
                    borderSide: BorderSide(
                      width: borderWidth,
                      color: errorText != null
                          ? colors.errorColor
                          : colors.duskyBlueColor,
                    ),
                  )
                : null,
            focusedBorder: showBorders
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(borderRadius),
                    ),
                    borderSide: BorderSide(
                      width: borderWidth,
                      color: errorText != null
                          ? colors.errorColor
                          : borderColor ??
                              colors.duskyBlueColor.withOpacity(0.80),
                    ),
                  )
                : null),
        onChanged: (value) {
          onChanged?.call(value);
        },
        onTap: onTap,
        onSubmitted: onSubmitted,
      ),
    );
  }
}
