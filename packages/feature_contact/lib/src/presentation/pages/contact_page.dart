import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/contact_bloc.dart';
import '../bloc/contact_event.dart';
import '../bloc/contact_state.dart';

/// Contact page with a validated form.
class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _subjectController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _subjectController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      context.read<ContactBloc>().add(ContactEvent.submitRequested(
            name: _nameController.text,
            email: _emailController.text,
            subject: _subjectController.text,
            message: _messageController.text,
          ));
    }
  }

  void _reset() {
    _nameController.clear();
    _emailController.clear();
    _subjectController.clear();
    _messageController.clear();
    context.read<ContactBloc>().add(const ContactEvent.resetRequested());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ContactBloc, ContactState>(
      listener: (context, state) {
        if (state is ContactSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Message sent successfully! 🎉'),
              behavior: SnackBarBehavior.floating,
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is ContactSuccess) {
          return _SuccessView(onSendAnother: _reset);
        }

        final isSubmitting = state is ContactSubmitting;
        final fieldErrors =
            state is ContactError ? state.fieldErrors : null;

        return CustomScrollView(
          slivers: [
            SliverAdaptivePadding(
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SectionHeader(
                      title: 'Contact',
                      subtitle: 'Get in touch — I\'d love to hear from you',
                    ),
                    const SizedBox(height: AppSpacing.md),

                    // Error banner
                    if (state is ContactError && fieldErrors == null)
                      Padding(
                        padding:
                            const EdgeInsets.only(bottom: AppSpacing.md),
                        child: ErrorView(
                          message: state.message,
                          onRetry: _submit,
                        ),
                      ),

                    // Form
                    ResponsiveBuilder(
                      compact: (_) => _ContactForm(
                        formKey: _formKey,
                        nameController: _nameController,
                        emailController: _emailController,
                        subjectController: _subjectController,
                        messageController: _messageController,
                        fieldErrors: fieldErrors,
                        isSubmitting: isSubmitting,
                        onSubmit: _submit,
                        isCompact: true,
                      ),
                      expanded: (_) => ConstrainedBox(
                        constraints:
                            const BoxConstraints(maxWidth: 700),
                        child: _ContactForm(
                          formKey: _formKey,
                          nameController: _nameController,
                          emailController: _emailController,
                          subjectController: _subjectController,
                          messageController: _messageController,
                          fieldErrors: fieldErrors,
                          isSubmitting: isSubmitting,
                          onSubmit: _submit,
                          isCompact: false,
                        ),
                      ),
                    ),

                    const SizedBox(height: AppSpacing.xxl),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _ContactForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController subjectController;
  final TextEditingController messageController;
  final Map<String, String>? fieldErrors;
  final bool isSubmitting;
  final VoidCallback onSubmit;
  final bool isCompact;

  const _ContactForm({
    required this.formKey,
    required this.nameController,
    required this.emailController,
    required this.subjectController,
    required this.messageController,
    required this.fieldErrors,
    required this.isSubmitting,
    required this.onSubmit,
    required this.isCompact,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Name & email row (side by side on wide screens)
          if (isCompact) ...[
            _buildField(
              controller: nameController,
              label: 'Name',
              hint: 'Your name',
              icon: Icons.person_outline,
              error: fieldErrors?['name'],
            ),
            const SizedBox(height: AppSpacing.md),
            _buildField(
              controller: emailController,
              label: 'Email',
              hint: 'your@email.com',
              icon: Icons.email_outlined,
              keyboardType: TextInputType.emailAddress,
              error: fieldErrors?['email'],
            ),
          ] else
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: _buildField(
                    controller: nameController,
                    label: 'Name',
                    hint: 'Your name',
                    icon: Icons.person_outline,
                    error: fieldErrors?['name'],
                  ),
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: _buildField(
                    controller: emailController,
                    label: 'Email',
                    hint: 'your@email.com',
                    icon: Icons.email_outlined,
                    keyboardType: TextInputType.emailAddress,
                    error: fieldErrors?['email'],
                  ),
                ),
              ],
            ),
          const SizedBox(height: AppSpacing.md),

          // Subject
          _buildField(
            controller: subjectController,
            label: 'Subject',
            hint: 'What\'s this about?',
            icon: Icons.subject,
            error: fieldErrors?['subject'],
          ),
          const SizedBox(height: AppSpacing.md),

          // Message
          _buildField(
            controller: messageController,
            label: 'Message',
            hint: 'Your message...',
            icon: Icons.message_outlined,
            maxLines: 6,
            error: fieldErrors?['message'],
          ),
          const SizedBox(height: AppSpacing.lg),

          // Submit button
          SizedBox(
            height: 48,
            child: FilledButton.icon(
              onPressed: isSubmitting ? null : onSubmit,
              icon: isSubmitting
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                  : const Icon(Icons.send),
              label: Text(isSubmitting ? 'Sending...' : 'Send Message'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    TextInputType? keyboardType,
    int maxLines = 1,
    String? error,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: Icon(icon),
        errorText: error,
      ),
      keyboardType: keyboardType,
      maxLines: maxLines,
      textInputAction:
          maxLines > 1 ? TextInputAction.newline : TextInputAction.next,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return '$label is required';
        }
        return null;
      },
    );
  }
}

class _SuccessView extends StatelessWidget {
  final VoidCallback onSendAnother;

  const _SuccessView({required this.onSendAnother});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Padding(
        padding: AppSpacing.paddingLg,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.check_circle_outline,
              size: 64,
              color: theme.colorScheme.primary,
            ),
            const SizedBox(height: AppSpacing.lg),
            Text(
              'Message Sent!',
              style: theme.textTheme.headlineMedium,
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              'Thanks for reaching out. I\'ll get back to you soon!',
              style: theme.textTheme.bodyLarge?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSpacing.xl),
            OutlinedButton.icon(
              onPressed: onSendAnother,
              icon: const Icon(Icons.refresh),
              label: const Text('Send Another'),
            ),
          ],
        ),
      ),
    );
  }
}
