import 'package:flutter_test/flutter_test.dart';
import 'package:devfunmi/app.dart';

void main() {
  testWidgets('App renders without crashing', (WidgetTester tester) async {
    await tester.pumpWidget(const DevFunmiApp());
    expect(find.byType(DevFunmiApp), findsOneWidget);
  });
}
