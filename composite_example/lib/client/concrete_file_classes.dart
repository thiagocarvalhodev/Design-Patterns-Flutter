import 'package:composite_example/client/file.dart';
import 'package:flutter/material.dart';

class AudioFile extends File {
  AudioFile(String title, int size) : super(title, size, Icons.music_note);
}

class ImageFile extends File {
  ImageFile(String title, int size) : super(title, size, Icons.image);
}

class TextFile extends File {
  TextFile(String title, int size) : super(title, size, Icons.description);
}

class VideoFile extends File {
  VideoFile(String title, int size) : super(title, size, Icons.movie);
}
