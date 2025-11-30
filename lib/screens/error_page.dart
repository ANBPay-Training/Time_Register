import 'package:flutter/material.dart';
import 'package:time_register_flutter/core/constants/routes.dart';

class ErrorPage extends StatelessWidget {
  final String message;
  final bool showHomeButton;
  final VoidCallback? onRetry; // optional

  const ErrorPage({
    super.key,
    required this.message,
    this.showHomeButton = false,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F7F8),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: AnimatedOpacity(
            opacity: 1,
            duration: const Duration(milliseconds: 400),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.sentiment_very_dissatisfied,
                  size: 90,
                  color: Colors.red.shade400,
                ),
                const SizedBox(height: 20),

                Text(
                  "Oops! Something went wrong",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade800,
                  ),
                ),

                const SizedBox(height: 10),

                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
                ),

                const SizedBox(height: 30),

                // Try again button (optional)
                if (onRetry != null)
                  ElevatedButton.icon(
                    onPressed: onRetry,
                    icon: const Icon(Icons.refresh),
                    label: const Text("Try Again"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 12,
                      ),
                    ),
                  ),

                const SizedBox(height: 12),

                // Home button (optional)
                if (showHomeButton)
                  OutlinedButton.icon(
                    onPressed: () => _navigateToHome(context),
                    icon: const Icon(Icons.home),
                    label: const Text("Go to Home"),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 28,
                        vertical: 12,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _navigateToHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      AppRoutes.login,
      (route) => false,
    );
  }
}
