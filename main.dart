
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        '/events': (context) => const Events(),
        '/details': (context) => const Details(),
      },
    );
  }
}

// HOME PAGE
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('College Events')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.event, size: 80),
            const Text('Welcome to College Events!',
                style: TextStyle(fontSize: 22)),
            ElevatedButton(
              onPressed: () =>
                  Navigator.pushNamed(context, '/events'),
              child: const Text('Explore Events'),
            ),
          ],
        ),
      ),
    );
  }
}

// EVENTS PAGE
class Events extends StatelessWidget {
  const Events({super.key});

  final events = const ['Tech Fest', 'Cultural Fest', 'Sports Meet'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Upcoming Events')),
      body: ListView(
        children: events.map((event) => ListTile(
          leading: const Icon(Icons.event),
          title: Text(event),
          trailing: const Icon(Icons.arrow_forward),
          onTap: () => Navigator.pushNamed(
            context, '/details', arguments: event),
        )).toList(),
      ),
    );
  }
}

// EVENT DETAILS PAGE
class Details extends StatelessWidget {
  const Details({super.key});

  @override
  Widget build(BuildContext context) {
    final event = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(title: const Text('Event Details')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.event_available, size: 80),
            Text(event, style: const TextStyle(fontSize: 25)),
            const Text('Welcome to the college event!'),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Back to Events'),
            ),
          ],
        ),
      ),
    );
  }
}
