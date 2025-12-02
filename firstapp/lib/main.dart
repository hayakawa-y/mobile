import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pattama Shop',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Pattama Shop'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final TextEditingController price = TextEditingController();
  final TextEditingController amount = TextEditingController();
  final TextEditingController change = TextEditingController();

  double _total = 0;
  double _change = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  void dispose() {
    price.dispose();
    amount.dispose();
    change.dispose();
    super.dispose();
  }

  Widget priceTextField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: price,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'price per item',
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }

  Widget amountTextField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: amount,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'amount of items',
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }

  Widget calculateButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {
          final p = double.tryParse(price.text);
          final q = double.tryParse(amount.text);
          if (p != null && q != null) {
            setState(() {
              _total = p * q;
              _change = 0;
            });
          } else {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('Please input price and amount')));
          }
        },
        child: const Text('Calculate Total'),
      ),
    );
  }

  Widget showTotalText() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Text('total : ${_total.toStringAsFixed(2)} Baht'),
    );
  }

  Widget receiveMoneyTextField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: change,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'get money',
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }

  Widget changeCalculateButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {
          final money = double.tryParse(change.text);
          if (money == null || _total <= 0) {
            return;
          }
          if (money < _total) {
            setState(() {
              _change = 0;
            });
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('money is not enough')));
          } else {
            setState(() {
              _change = money - _total;
            });
          }
        },
        child: const Text('Calculate Change'),
      ),
    );
  }

  Widget showChangeText() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Text('Change : ${_change.toStringAsFixed(2)} Baht'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Text(
              "Change Calculate",
              style: TextStyle(
                fontFamily: "Maa",
                fontSize: 37,
                color: const Color.fromARGB(255, 165, 25, 200),
              ),
            ),

            priceTextField(),
            amountTextField(),
            calculateButton(),
            showTotalText(),
            receiveMoneyTextField(),
            changeCalculateButton(),
            showChangeText(),
          ],
        ),
      ),
    );
  }
}
