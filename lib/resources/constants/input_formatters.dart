part of 'constants.dart';

class InputFormat {
  static final denySpace = <TextInputFormatter>[
    FilteringTextInputFormatter.deny(RegExp(r'\s')),
  ];
}
