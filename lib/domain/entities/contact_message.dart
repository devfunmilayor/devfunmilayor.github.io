import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact_message.freezed.dart';

@freezed
class ContactMessage with _$ContactMessage {
  const factory ContactMessage({
    required String name,
    required String email,
    required String company,
    required String message,
    required String sentTime,
  }) = _ContactMessage;
}
