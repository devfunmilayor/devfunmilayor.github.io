import 'package:devfunmi/core/constants/app_colors.dart';
import 'package:devfunmi/core/constants/app_spacing.dart';
import 'package:devfunmi/core/constants/app_strings.dart';
import 'package:devfunmi/core/constants/app_typography.dart';
import 'package:devfunmi/core/di/injection.dart';
import 'package:devfunmi/widgets/buttons/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hugeicons/hugeicons.dart';
import 'bloc/contact_bloc.dart';
import 'bloc/contact_event.dart';
import 'bloc/contact_state.dart';

class ContactForm extends StatelessWidget {
  const ContactForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ContactBloc>(),
      child: const _ContactFormBody(),
    );
  }
}

class _ContactFormBody extends StatelessWidget {
  const _ContactFormBody();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ContactBloc, ContactState>(
      listenWhen: (prev, curr) => prev.status != curr.status,
      listener: (context, state) {
        if (state.status == ContactStatus.error && state.errorMessage != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage!),
              backgroundColor: AppColors.error,
            ),
          );
        }
      },
      builder: (context, state) {
        if (state.status == ContactStatus.success) {
          return const _SuccessMessage();
        }

        final bloc = context.read<ContactBloc>();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _field(
              label: 'Full Name',
              hint: 'Emmanuel Olufunmilayo',
              onChanged: (v) => bloc.add(ContactEvent.nameChanged(v)),
            ),
            const SizedBox(height: AppSpacing.md),
            _field(
              label: 'Email Address',
              hint: 'you@company.com',
              keyboardType: TextInputType.emailAddress,
              onChanged: (v) => bloc.add(ContactEvent.emailChanged(v)),
            ),
            const SizedBox(height: AppSpacing.md),
            _field(
              label: 'Company / Role (optional)',
              hint: 'Acme Corp · Senior Engineer',
              onChanged: (v) => bloc.add(ContactEvent.companyChanged(v)),
            ),
            const SizedBox(height: AppSpacing.md),
            _field(
              label: 'Message',
              hint: 'What are you working on?',
              maxLines: 5,
              onChanged: (v) => bloc.add(ContactEvent.messageChanged(v)),
            ),
            const SizedBox(height: AppSpacing.xl),
            if (state.status == ContactStatus.error &&
                state.errorMessage != null)
              Padding(
                padding: const EdgeInsets.only(bottom: AppSpacing.md),
                child: Text(
                  state.errorMessage!,
                  style: AppTypography.bodySmall.copyWith(
                    color: AppColors.error,
                  ),
                ),
              ),
            PrimaryButton(
              label: state.status == ContactStatus.submitting
                  ? 'Sending...'
                  : AppStrings.sendMessage,
              icon: state.status == ContactStatus.submitting
                  ? null
                  : HugeIcons.strokeRoundedSent,
              onTap: state.isValid && state.status != ContactStatus.submitting
                  ? () => bloc.add(const ContactEvent.submitted())
                  : null,
              fullWidth: true,
            ),
          ],
        );
      },
    );
  }

  Widget _field({
    required String label,
    String? hint,
    TextInputType? keyboardType,
    int maxLines = 1,
    required void Function(String) onChanged,
  }) {
    return TextField(
      keyboardType: keyboardType,
      maxLines: maxLines,
      onChanged: onChanged,
      style: AppTypography.bodyMedium.copyWith(color: AppColors.textPrimary),
      decoration: InputDecoration(labelText: label, hintText: hint),
    );
  }
}

class _SuccessMessage extends StatelessWidget {
  const _SuccessMessage();

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
          const HugeIcon(
            icon: HugeIcons.strokeRoundedCheckmarkCircle01,
            color: AppColors.accent,
            size: 32,
          ),
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
