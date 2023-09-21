import 'package:bloc_consumer_test/bloc/simple_bloc.dart';
import 'package:bloc_consumer_test/when_listen_widget.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class MockSimpleBloc extends MockBloc<SimpleEvent, SimpleState>
    implements SimpleBloc {}

void main() {
  testWidgets('Test BlocConsumer with whenListen', (WidgetTester tester) async {
    final simpleBloc = MockSimpleBloc();
    String resultA = '';
    String resultB = '';
    whenListen(
      simpleBloc,
      Stream.fromIterable([
        SimpleAState(),
        SimpleBState(),
      ]),
      initialState: SimpleInitial(),
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: WhenListenWidget(
            simpleBloc: simpleBloc,
            onListenerA: (res) => resultA = res,
            onListenerB: (res) => resultB = res,
          ),
        ),
      ),
    );
    await tester.pump();
    expect(resultA, 'A');
    expect(resultB, 'B');
  });
}
