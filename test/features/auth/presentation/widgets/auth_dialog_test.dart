import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lilinet_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:lilinet_app/features/auth/presentation/bloc/auth_event.dart';
import 'package:lilinet_app/features/auth/presentation/bloc/auth_state.dart';
import 'package:lilinet_app/features/auth/presentation/widgets/auth_dialog.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthBloc extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

void main() {
  late MockAuthBloc mockAuthBloc;

  setUp(() {
    mockAuthBloc = MockAuthBloc();
  });

  Widget createWidgetUnderTest() {
    return MaterialApp(
      home: BlocProvider<AuthBloc>(
        create: (_) => mockAuthBloc,
        child: const Scaffold(
          body: AuthDialog(),
        ),
      ),
    );
  }

  testWidgets('renders correctly and toggles password visibility', (tester) async {
    when(() => mockAuthBloc.state).thenReturn(AuthInitial());

    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pumpAndSettle();

    final passwordFieldFinder = find.widgetWithText(TextFormField, 'Password');
    expect(passwordFieldFinder, findsOneWidget);

    // Initial state: Obscured
    // TextFormField builds a TextField internally. We find that TextField.
    final textFieldFinder = find.descendant(
      of: passwordFieldFinder,
      matching: find.byType(TextField),
    );
    final textField = tester.widget<TextField>(textFieldFinder);
    expect(textField.obscureText, isTrue);

    // Find visibility icon (initially 'visibility')
    // Wait, if obscured is true, icon should be visibility (eye open) or visibility_off (eye closed)?
    // Usually:
    // obscured=true -> show "visibility" icon (to click and see) OR "visibility_off" (representing hidden state)?
    // My code:
    // icon: Icon(_isObscured ? Icons.visibility : Icons.visibility_off),
    // So if obscured (default), icon is visibility.

    final visibilityIconFinder = find.byIcon(Icons.visibility);
    expect(visibilityIconFinder, findsOneWidget);

    // Tap it
    await tester.tap(visibilityIconFinder);
    await tester.pump();

    // Toggled state: Not obscured
    final textFieldToggled = tester.widget<TextField>(textFieldFinder);
    expect(textFieldToggled.obscureText, isFalse);

    // Icon should change to visibility_off
    final visibilityOffIconFinder = find.byIcon(Icons.visibility_off);
    expect(visibilityOffIconFinder, findsOneWidget);

    // Tap again to hide
    await tester.tap(visibilityOffIconFinder);
    await tester.pump();

    final textFieldHidden = tester.widget<TextField>(textFieldFinder);
    expect(textFieldHidden.obscureText, isTrue);
  });

  testWidgets('validates password length', (tester) async {
    when(() => mockAuthBloc.state).thenReturn(AuthInitial());

    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pumpAndSettle();

    // Enter short password
    await tester.enterText(find.widgetWithText(TextFormField, 'Password'), '1234567');
    await tester.enterText(find.widgetWithText(TextFormField, 'Username'), 'user123');

    // Tap Continue
    await tester.tap(find.text('Continue'));
    await tester.pump();

    // Expect validation error
    expect(find.text('Password must be at least 8 characters'), findsOneWidget);

    // Enter valid password
    await tester.enterText(find.widgetWithText(TextFormField, 'Password'), '12345678');
    await tester.tap(find.text('Continue'));
    await tester.pump();

    // Expect no validation error
    expect(find.text('Password must be at least 8 characters'), findsNothing);
  });
}
