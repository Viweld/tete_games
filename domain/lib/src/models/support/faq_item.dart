part of 'support.dart';

@immutable
class FaqItem {
  final int id;
  final String question;
  final String answer;

  const FaqItem({required this.id, required this.question, required this.answer});
}
