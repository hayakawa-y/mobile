import 'package:flutter/material.dart';
class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {

  final TextEditingController price = TextEditingController();
  final TextEditingController amount = TextEditingController();
  final TextEditingController change = TextEditingController();

  double _total = 0;
  double _change = 0;

  @override
  void dispose() {
    price.dispose();
    amount.dispose();
    change.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return
    Material(
      child: ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        const Text(
          "Change Calculate",
          style: TextStyle(
            fontFamily: "Maa",
            fontSize: 37,
            color: Color.fromARGB(255, 165, 25, 200),
            backgroundColor: Color.fromARGB(255, 50, 198, 191),
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        Image.asset(
          'assets/cat.png',
          height: 100,
          width: 200,
          fit: BoxFit.contain,
        ),
        const SizedBox(height: 20),
        Image.network(
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRT0wjce5WnR6f7xo79l9HmgAvU26MsKYGRMw&s",
          height: 100,
          width: 200,
          fit: BoxFit.contain,
        ),
        const SizedBox(height: 20),

        TextField(
          controller: price,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'price per item',
          ),
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 8),

        TextField(
          controller: amount,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'amount of items',
          ),
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 8),

        ElevatedButton(
          onPressed: () {
            final p = double.tryParse(price.text);
            final q = double.tryParse(amount.text);
            if (p != null && q != null) {
              setState(() {
                _total = p * q;
                _change = 0;
              });
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Please input price and amount')),
              );
            }
          },
          child: const Text('Calculate Total'),
        ),
        const SizedBox(height: 8),
        Text('total : ${_total.toStringAsFixed(2)} Baht',
            style: const TextStyle(fontSize: 18)),

        const SizedBox(height: 20),

        TextField(
          controller: change,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'get money',
          ),
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 8),

        ElevatedButton(
          onPressed: () {
            final money = double.tryParse(change.text);
            if (money == null || _total <= 0) {
              return;
            }
            if (money < _total) {
              setState(() {
                _change = 0;
              });
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('money is not enough')),
              );
            } else {
              setState(() {
                _change = money - _total;
              });
            }
          },
          child: const Text('Calculate Change'),
        ),
        const SizedBox(height: 8),
        Text('Change : ${_change.toStringAsFixed(2)} Baht',
            style: const TextStyle(fontSize: 18)),
        ],
      )
    );
  }
}