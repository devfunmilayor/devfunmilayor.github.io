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
    final baseParams = {
      'from_name': message.name,
      'reply_to': message.email,
      'company': message.company.isEmpty ? 'Not provided' : message.company,
      'message': message.message,
      'sent_time': message.sentTime,
    };

    await _datasource.sendNotification({
      ...baseParams,
      'to_email': 'tfunmii@gmail.com',
    });

    // Auto-reply goes to the visitor — to_email is their address.
    try {
      await _datasource.sendAutoReply({
        ...baseParams,
        'to_email': message.email,
      });
    } catch (_) {}
  }
}
