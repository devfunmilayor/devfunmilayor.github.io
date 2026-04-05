import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../domain/entities/contact_message.dart';
import '../../../../domain/usecases/send_contact_message.dart';
import 'contact_event.dart';
import 'contact_state.dart';

@injectable
class ContactBloc extends Bloc<ContactEvent, ContactState> {
  final SendContactMessage _sendMessage;

  ContactBloc(this._sendMessage) : super(const ContactState()) {
    on<ContactEvent>((event, emit) => event.map(
          nameChanged: (e) => emit(state.copyWith(name: e.value)),
          emailChanged: (e) => emit(state.copyWith(email: e.value)),
          companyChanged: (e) => emit(state.copyWith(company: e.value)),
          messageChanged: (e) => emit(state.copyWith(message: e.value)),
          submitted: (_) => _onSubmitted(emit),
        ));
  }

  Future<void> _onSubmitted(Emitter<ContactState> emit) async {
    if (!state.isValid) return;
    emit(state.copyWith(status: ContactStatus.submitting, errorMessage: null));
    try {
      final now = DateTime.now().toUtc();
      final months = [
        'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
        'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
      ];
      final h = now.hour.toString().padLeft(2, '0');
      final m = now.minute.toString().padLeft(2, '0');
      final sentTime =
          '${months[now.month - 1]} ${now.day}, ${now.year} at $h:$m UTC';

      await _sendMessage(ContactMessage(
        name: state.name.trim(),
        email: state.email.trim(),
        company: state.company.trim(),
        message: state.message.trim(),
        sentTime: sentTime,
      ));
      emit(state.copyWith(status: ContactStatus.success));
    } catch (e) {
      emit(state.copyWith(
        status: ContactStatus.error,
        errorMessage: 'Something went wrong. Please try again.',
      ));
    }
  }
}
