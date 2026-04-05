import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import '../../core/constants/app_strings.dart';

@injectable
class ContactRemoteDatasource {
  final http.Client _client;

  const ContactRemoteDatasource(this._client);

  static const String _apiUrl = 'https://api.emailjs.com/api/v1.0/email/send';

  Future<void> sendNotification(Map<String, String> params) async {
    final response = await _client.post(
      Uri.parse(_apiUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'service_id': AppStrings.emailJsServiceId,
        'template_id': AppStrings.emailJsTemplateId,
        'user_id': AppStrings.emailJsPublicKey,
        'template_params': params,
      }),
    );
    // EmailJS returns 200 "OK" on success. Treat anything 2xx as success too.
    // Non-2xx means the request was definitely rejected before processing.
    if (response.statusCode >= 400) {
      throw Exception('Failed to send: ${response.statusCode}');
    }
  }

  Future<void> sendAutoReply(Map<String, String> params) async {
    // Best-effort — caller should swallow exceptions from this.
    await _client.post(
      Uri.parse(_apiUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'service_id': AppStrings.emailJsServiceId,
        'template_id': AppStrings.emailJsAutoReplyTemplateId,
        'user_id': AppStrings.emailJsPublicKey,
        'template_params': params,
      }),
    );
  }
}
