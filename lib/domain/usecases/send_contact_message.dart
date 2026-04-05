import 'package:injectable/injectable.dart';
import '../entities/contact_message.dart';
import '../repositories/contact_repository.dart';

@injectable
class SendContactMessage {
  final ContactRepository _repo;

  const SendContactMessage(this._repo);

  Future<void> call(ContactMessage message) => _repo.sendMessage(message);
}
