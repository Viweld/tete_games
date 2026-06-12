part of 'support.dart';

@immutable
class SupportAttachment {
  final int id;
  final String fileName;
  final String fileUrl;

  const SupportAttachment({required this.id, required this.fileName, required this.fileUrl});
}
