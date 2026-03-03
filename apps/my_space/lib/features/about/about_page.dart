import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 80,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  child: Icon(
                    Icons.person,
                    size: 80,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 32),
                Text(
                  'About Me',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                const SizedBox(height: 16),
                Text(
                  'Product Designer & Developer',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  'I\'m a passionate designer and developer specializing in creating beautiful, '
                  'functional applications. With expertise in Flutter, I build cross-platform '
                  'solutions that work seamlessly across mobile, web, and desktop.',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 16),
                Text(
                  'My approach combines clean code, thoughtful architecture, and user-centered '
                  'design to create experiences that people love.',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 32),
                Text(
                  'Skills',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    _buildSkillChip(context, 'Flutter'),
                    _buildSkillChip(context, 'Dart'),
                    _buildSkillChip(context, 'Clean Architecture'),
                    _buildSkillChip(context, 'BLoC'),
                    _buildSkillChip(context, 'UI/UX Design'),
                    _buildSkillChip(context, 'Cross-platform'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSkillChip(BuildContext context, String skill) {
    return Chip(
      label: Text(skill),
      backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
      labelStyle: TextStyle(
        color: Theme.of(context).colorScheme.primary,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
