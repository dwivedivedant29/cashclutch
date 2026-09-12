import 'package:flutter/material.dart';

void main() {
  runApp(const CashClutchApp());
}

class CashClutchApp extends StatelessWidget {
  const CashClutchApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CashClutch',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _coins = 100;

  final List<Map<String, dynamic>> _offers = const [
    {"title": "State of Survival", "task": "Reach HQ Level 12", "payout": 1200, "tag": "HOT"},
    {"title": "Solitaire Clash", "task": "Play 3 Matches", "payout": 350, "tag": "EASY"},
    {"title": "Quick Survey", "task": "Answer 5 Questions", "payout": 150, "tag": "FAST"}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0C0E14),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0C0E14),
        title: const Text("CashClutch", style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: const Color(0xFF1B1F2D),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: const Color(0xFFFFD043)),
            ),
            child: Center(
              child: Text("🪙 $_coins pts", style: const TextStyle(color: Color(0xFFFFD043), fontWeight: FontWeight.bold)),
            ),
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [Color(0xFF2C1458), Color(0xFF121424)]),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Free Daily Loot", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ElevatedButton(
                  onPressed: () => setState(() => _coins += 25),
                  style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF00FF88), foregroundColor: Colors.black),
                  child: const Text("Claim +25"),
                )
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Text("Featured Offers", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          ..._offers.map((item) => Card(
            color: const Color(0xFF161922),
            margin: const EdgeInsets.only(bottom: 10),
            child: ListTile(
              title: Text(item['title'], style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(item['task'], style: const TextStyle(color: Colors.white54)),
              trailing: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF202637), foregroundColor: const Color(0xFFFFD043)),
                child: Text("+${item['payout']}"),
              ),
            ),
          )),
        ],
      ),
    );
  }
}


