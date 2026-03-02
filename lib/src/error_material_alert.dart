import 'package:flutter/material.dart';

class ErrorMaterialAlert extends StatelessWidget {
  final String appName;
  final String description;
  final String? errorCloseButtonLabel;
  final String? errorSubtitle;

  const ErrorMaterialAlert({
    super.key,
    required this.appName,
    required this.description,
    this.errorCloseButtonLabel,
    this.errorSubtitle,
  });

  @override
  Widget build(BuildContext context) {
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      backgroundColor: Colors.green,
      foregroundColor: Colors.white,
    );

    Widget closeButton = TextButton(
      style: flatButtonStyle,
      onPressed: () => Navigator.pop(context),
      child: Text(errorCloseButtonLabel ?? 'CLOSE'),
    );

    return AlertDialog(
      title: Text(appName),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (errorSubtitle != null || errorSubtitle == null)
            Text(
              errorSubtitle ?? 'Can\'t perform update.',
              style: const TextStyle(color: Colors.grey),
            ),
          const SizedBox(height: 24.0),
          Text(description),
          const SizedBox(height: 24.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              closeButton,
            ],
          ),
          const SizedBox(height: 16.0),
          const Divider(),
          const SizedBox(height: 16.0),
          Image.asset(
            'packages/native_updater/images/google_play.png',
            width: 120.0,
          ),
        ],
      ),
    );
  }
}
