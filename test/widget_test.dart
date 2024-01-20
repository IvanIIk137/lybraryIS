import 'package:flutter_test/flutter_test.dart';
import 'package:task_3/main.dart';

void main() {
  testWidgets('First test', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
  });
}
