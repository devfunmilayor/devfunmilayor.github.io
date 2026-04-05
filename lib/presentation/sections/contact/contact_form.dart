import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_typography.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/constants/app_strings.dart';
import '../../../widgets/buttons/primary_button.dart';

enum _FormStatus { idle, submitting, success, error }

class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _companyCtrl = TextEditingController();
  final _messageCtrl = TextEditingController();
  _FormStatus _status = _FormStatus.idle;
  String? _errorMsg;

  @override
  void dispose() {
    _nameCtrl.dispose();
    _emailCtrl.dispose();
    _companyCtrl.dispose();
    _messageCtrl.dispose();
    super.dispose();
  }

  String _formattedNow() {
    final now = DateTime.now().toUtc();
    final months = [
      'Jan','Feb','Mar','Apr','May','Jun',
      'Jul','Aug','Sep','Oct','Nov','Dec'
    ];
    final h = now.hour.toString().padLeft(2, '0');
    final m = now.minute.toString().padLeft(2, '0');
    return '${months[now.month - 1]} ${now.day}, ${now.year} at $h:$m UTC';
  }

  Future<void> _submit() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    setState(() => _status = _FormStatus.submitting);

    final params = {
      'from_name': _nameCtrl.text.trim(),
      'reply_to': _emailCtrl.text.trim(),
      'company': _companyCtrl.text.trim().isEmpty
          ? 'Not provided'
          : _companyCtrl.text.trim(),
      'message': _messageCtrl.text.trim(),
      'to_email': AppStrings.email,
      'sent_time': _formattedNow(),
    };

    try {
      final response = await http.post(
        Uri.parse('https://api.emailjs.com/api/v1.0/email/send'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'service_id': AppStrings.emailJsServiceId,
          'template_id': AppStrings.emailJsTemplateId,
          'user_id': AppStrings.emailJsPublicKey,
          'template_params': params,
        }),
      );

      if (response.statusCode == 200) {
        // Send auto-reply to the visitor
        await http.post(
          Uri.parse('https://api.emailjs.com/api/v1.0/email/send'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            'service_id': AppStrings.emailJsServiceId,
            'template_id': AppStrings.emailJsAutoReplyTemplateId,
            'user_id': AppStrings.emailJsPublicKey,
            'template_params': params,
          }),
        );
        setState(() => _status = _FormStatus.success);
      } else {
        setState(() {
          _status = _FormStatus.error;
          _errorMsg = 'Something went wrong. Please try again.';
        });
      }
    } catch (_) {
      setState(() {
        _status = _FormStatus.error;
        _errorMsg = 'Network error. Please check your connection.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_status == _FormStatus.success) {
      return _SuccessMessage();
    }

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _field(
            controller: _nameCtrl,
            label: 'Full Name',
            hint: 'Funmi Layo',
            validator: (v) =>
                (v == null || v.trim().isEmpty) ? 'Name is required' : null,
          ),
          const SizedBox(height: AppSpacing.md),
          _field(
            controller: _emailCtrl,
            label: 'Email Address',
            hint: 'you@company.com',
            keyboardType: TextInputType.emailAddress,
            validator: (v) {
              if (v == null || v.trim().isEmpty) return 'Email is required';
              if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(v.trim())) {
                return 'Enter a valid email';
              }
              return null;
            },
          ),
          const SizedBox(height: AppSpacing.md),
          _field(
            controller: _companyCtrl,
            label: 'Company / Role (optional)',
            hint: 'Acme Corp · Senior Engineer',
          ),
          const SizedBox(height: AppSpacing.md),
          _field(
            controller: _messageCtrl,
            label: 'Message',
            hint: 'What are you working on?',
            maxLines: 5,
            validator: (v) =>
                (v == null || v.trim().isEmpty) ? 'Message is required' : null,
          ),
          const SizedBox(height: AppSpacing.xl),
          if (_status == _FormStatus.error && _errorMsg != null)
            Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.md),
              child: Text(
                _errorMsg!,
                style: AppTypography.bodySmall.copyWith(
                  color: AppColors.error,
                ),
              ),
            ),
          PrimaryButton(
            label: _status == _FormStatus.submitting
                ? 'Sending...'
                : AppStrings.sendMessage,
            icon: _status == _FormStatus.submitting ? null : Icons.send,
            onTap: _status == _FormStatus.submitting ? () {} : _submit,
            fullWidth: true,
          ),
        ],
      ),
    );
  }

  Widget _field({
    required TextEditingController controller,
    required String label,
    String? hint,
    TextInputType? keyboardType,
    int maxLines = 1,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      validator: validator,
      style: AppTypography.bodyMedium.copyWith(color: AppColors.textPrimary),
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
      ),
    );
  }
}

class _SuccessMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.xl),
      decoration: BoxDecoration(
        color: AppColors.accent.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.borderAccent),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.check_circle_outline,
              color: AppColors.accent, size: 32),
          const SizedBox(height: AppSpacing.md),
          Text(
            'Message sent!',
            style: AppTypography.headingS.copyWith(color: AppColors.accent),
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            "Thanks for reaching out. I'll get back to you within 24 hours.",
            style: AppTypography.bodyMedium,
          ),
        ],
      ),
    );
  }
}
