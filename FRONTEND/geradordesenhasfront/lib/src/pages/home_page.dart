import 'package:flutter/material.dart';
import './login_page.dart';
import './register_page.dart';
import '../../main.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Login OK!'),
            const SizedBox(height: 12),
            FilledButton(
              onPressed: () =>
                  Navigator.pushReplacementNamed(context, '/login'),
              child: const Text('Sair'),
            ),
          ],
        ),
      ),
    );
  }
}
