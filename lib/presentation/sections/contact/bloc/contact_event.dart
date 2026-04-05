import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact_event.freezed.dart';

@freezed
class ContactEvent with _$ContactEvent {
  const factory ContactEvent.nameChanged(String value) = _NameChanged;
  const factory ContactEvent.emailChanged(String value) = _EmailChanged;
  const factory ContactEvent.companyChanged(String value) = _CompanyChanged;
  const factory ContactEvent.messageChanged(String value) = _MessageChanged;
  const factory ContactEvent.submitted() = _Submitted;
}
