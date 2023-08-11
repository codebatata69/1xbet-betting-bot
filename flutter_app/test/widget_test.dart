import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_app/main.dart';

void main() {
  testWidgets('App should run test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that our app is running.
    expect(find.byType(MaterialApp), findsOneWidget);
  });

  testWidgets('Login screen test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: LoginScreen()));

    // Verify the presence of certain widgets
    expect(find.byType(TextFormField), findsNWidgets(2));
    expect(find.byType(RaisedButton), findsOneWidget);
  });

  testWidgets('Register screen test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: RegisterScreen()));

    // Verify the presence of certain widgets
    expect(find.byType(TextFormField), findsNWidgets(3));
    expect(find.byType(RaisedButton), findsOneWidget);
  });

  testWidgets('Product list screen test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: ProductListScreen()));

    // Verify the presence of certain widgets
    expect(find.byType(ListView), findsOneWidget);
  });

  testWidgets('Cart screen test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: CartScreen()));

    // Verify the presence of certain widgets
    expect(find.byType(ListView), findsOneWidget);
    expect(find.byType(RaisedButton), findsOneWidget);
  });

  testWidgets('Checkout screen test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: CheckoutScreen()));

    // Verify the presence of certain widgets
    expect(find.byType(ListView), findsOneWidget);
    expect(find.byType(RaisedButton), findsOneWidget);
  });

  testWidgets('Orders screen test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: OrdersScreen()));

    // Verify the presence of certain widgets
    expect(find.byType(ListView), findsOneWidget);
  });
}