import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(const myapp());

class myapp extends StatelessWidget {
  const myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Call Back Shortcut')),
        body: const Center(
          child: LogicalKeySetExample(),
        ),
      ),
    );
  }
}

class IncrementIntent extends Intent {
  const IncrementIntent();
}

class LogicalKeySetExample extends StatefulWidget {
  const LogicalKeySetExample({super.key});

  @override
  State<LogicalKeySetExample> createState() => _LogicalKeySetExampleState();
}

class _LogicalKeySetExampleState extends State<LogicalKeySetExample> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Shortcuts(
      shortcuts: <ShortcutActivator, Intent>{
        LogicalKeySet(LogicalKeyboardKey.keyC): const IncrementIntent(),
      },
      child: Actions(
        actions: <Type, Action<Intent>>{
          IncrementIntent: CallbackAction<IncrementIntent>(
            onInvoke: (IncrementIntent intent) => setState(() {
              count = count + 1;
            }),
          ),
        },
        child: Focus(
          autofocus: true,
          child: Column(
            children: <Widget>[
              const Text('press C to count'),
              Text('count: $count'),
            ],
          ),
        ),
      ),
    );
  }
}
