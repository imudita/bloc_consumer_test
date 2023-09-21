import 'package:bloc_consumer_test/bloc/simple_bloc.dart';
import 'package:bloc_consumer_test/global_key_widget.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockSimpleBloc extends MockBloc<SimpleEvent, SimpleState>
    implements SimpleBloc {}

void main() {
  testWidgets('Test BlocConsumer with GlobalKey', (WidgetTester tester) async {
    final globalKey = GlobalKey<GlobalKeyWidgetState>();
    final simpleBloc = MockSimpleBloc();
    String resultA = '';
    String resultB = '';

    when(() => simpleBloc.state).thenAnswer((_) => SimpleInitial());
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: GlobalKeyWidget(
            key: globalKey,
            simpleBloc: simpleBloc,
            onListenerA: (res) => resultA = res,
            onListenerB: (res) => resultB = res,
          ),
        ),
      ),
    );
    await tester.pump();

    expect(resultA, '');
    expect(resultB, '');
    final context = globalKey.currentContext;
    globalKey.currentState?.blockListener(context, SimpleAState());
    expect(resultA, 'A');
    globalKey.currentState?.blockListener(context, SimpleBState());
    expect(resultB, 'B');
  });
}
