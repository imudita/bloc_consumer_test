import 'package:bloc_consumer_test/bloc/simple_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WhenListenWidget extends StatefulWidget {
  final Function(String) onListenerA;
  final Function(String) onListenerB;
  final SimpleBloc simpleBloc;

  const WhenListenWidget({
    super.key,
    required this.onListenerA,
    required this.onListenerB,
    required this.simpleBloc,
  });

  @override
  State<WhenListenWidget> createState() => _WhenListenWidgetState();
}

class _WhenListenWidgetState extends State<WhenListenWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      bloc: widget.simpleBloc,
      listener: (context, state) {
        if (state is SimpleAState) {
          widget.onListenerA('A');
        }
        if (state is SimpleBState) {
          widget.onListenerB('B');
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                widget.simpleBloc.add(SimpleAEvent());
              },
            ),
            IconButton(
              icon: const Icon(Icons.plus_one),
              onPressed: () {
                widget.simpleBloc.add(SimpleBEvent());
              },
            )
          ],
        );
      },
    );
  }
}
