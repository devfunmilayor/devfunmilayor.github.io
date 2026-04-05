import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact_state.freezed.dart';

enum ContactStatus { idle, submitting, success, error }

@freezed
class ContactState with _$ContactState {
  const ContactState._();

  const factory ContactState({
    @Default('') String name,
    @Default('') String email,
    @Default('') String company,
    @Default('') String message,
    @Default(ContactStatus.idle) ContactStatus status,
    String? errorMessage,
  }) = _ContactState;

  bool get isValid =>
      name.trim().isNotEmpty &&
      message.trim().isNotEmpty &&
      RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email.trim());
}
