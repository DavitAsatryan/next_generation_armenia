import 'package:get/get_utils/src/get_utils/get_utils.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class ValidationUtils {
  static bool isValidPassword(String? password) {
    if (password == null) return false;
    final regexp = RegExp('^'
        '(?=.*\\d)'
        '(?=.*[a-z])'
        '(?=.*[A-Z])'
        '(?=.*\\W)'
        '(?=\\S+\$)'
        '.{8,}'
        '\$');
    return regexp.hasMatch(password);
  }

  static bool isValidEmail(String? email) => GetUtils.isEmail(email ?? '');

  static var maskPhoneNumber = MaskTextInputFormatter(
    mask: '##-###-###',
    filter: {'#': RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );
}
