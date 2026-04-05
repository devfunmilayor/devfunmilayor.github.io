import 'package:injectable/injectable.dart';
import '../../domain/entities/contact_message.dart';
import '../../domain/repositories/contact_repository.dart';
import '../datasources/contact_remote_datasource.dart';

@LazySingleton(as: ContactRepository)
class ContactRepositoryImpl implements ContactRepository {
  final ContactRemoteDatasource _datasource;

  const ContactRepositoryImpl(this._datasource);

  @override
  Future<void> sendMessage(ContactMessage message) async {
    final params = {
      'from_name': message.name,
      'reply_to': message.email,
      'company': message.company.isEmpty ? 'Not provided' : message.company,
      'message': message.message,
      'to_email': 'tfunmii@gmail.com',
      'sent_time': message.sentTime,
    };
    await _datasource.sendNotification(params);
    // Auto-reply is best-effort — a template misconfiguration shouldn't
    // show an error to the user when the main notification already succeeded.
    try {
      await _datasource.sendAutoReply(params);
    } catch (_) {}
  }
}
