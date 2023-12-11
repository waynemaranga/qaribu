import 'package:flutter_test/flutter_test.dart';
import 'package:qaribu/app/app.dart';
import 'package:qaribu/root_layout/view/root_layout.dart';

void main() {
  group('App', () {
    testWidgets('renders RootLayout', (tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(RootLayout), findsOneWidget);
    });
  });
}
