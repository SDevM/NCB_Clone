import 'dart:ui';

Path invertPath(Path path, Size size) => Path.combine(
      PathOperation.difference,
      Path()..addRect(Offset.zero & size),
      path,
    );

String masker(String subject, int start, int end) {
  return subject.replaceRange(start, end, '*' * (end - start));
}
