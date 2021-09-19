import 'package:flutter/widgets.dart';

class ErrorMessage extends StatelessWidget {
  final dynamic error;

  const ErrorMessage({
    Key? key,
    this.error,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Center(child: Text(error.toString()));
}
