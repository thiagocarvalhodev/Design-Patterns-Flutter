import 'package:flutter/material.dart';

/// Component
abstract class IFile {
  int getSize();
  Widget render(BuildContext context);
}
