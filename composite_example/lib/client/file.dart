import 'package:composite_example/client/ifile.dart';
import 'package:flutter/material.dart';

import 'helpers/file_size_converter.dart';

class File extends StatelessWidget implements IFile {
  final String title;
  final int size;
  final IconData icon;

  const File(this.title, this.size, this.icon);

  @override
  Widget build(BuildContext context) {
    return render(context);
  }

  @override
  int getSize() {
    return size;
  }

  @override
  Widget render(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 16),
        child: ListTile(
          title: Text(
            title,
            style: Theme.of(context).textTheme.bodyText2,
          ),
          leading: Icon(icon),
          trailing: Text(
            FileSizeConverter.bytesToString(size),
            style: Theme.of(context)
                .textTheme
                .bodyText2
                .copyWith(color: Colors.black54),
          ),
          dense: true,
        ));
  }
}