import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lilinet_app/features/comments/presentation/widgets/comment_input.dart';

void main() {
  testWidgets('CommentInput has maxLength of 1000', (WidgetTester tester) async {
    // Build the widget
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CommentInput(
            onSend: (text) {},
            isLoggedIn: true,
          ),
        ),
      ),
    );

    // Find the TextField
    final textFieldFinder = find.byType(TextField);
    expect(textFieldFinder, findsOneWidget);

    // Get the TextField widget
    final TextField textField = tester.widget(textFieldFinder);

    // Verify properties
    expect(textField.maxLength, 1000);
    expect(textField.decoration?.counterText, "");
  });
}
