import 'package:flutter/material.dart';

import '../pages/home.page.dart';
import '../shared/utils.miscellaneous.dart';

class AccountBodyRow extends StatelessWidget {
  const AccountBodyRow({Key? key, required this.widget, required this.e}) : super(key: key);

  final HomePage widget;
  final Map<String, dynamic> e;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 15,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  e['accountType'],
                  style: widget.titleStyle,
                ),
                const Text('Account Balance'),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(masker(e['accountNumber'].toString(), 0, 3)),
              Text(e['accountCurrency'] +
                  "   " +
                  e['accountBalance'].toString()),
            ],
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Account Details',
                  style: TextStyle(
                    color: Colors.lightBlue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              IconButton(
                  padding: EdgeInsets.zero,
                  constraints:
                      const BoxConstraints(maxWidth: 30, maxHeight: 30),
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_forward,
                    color: Colors.lightBlue,
                  ))
            ],
          )
        ],
      ),
    );
  }
}

class CreditBodyRow extends StatelessWidget {
  const CreditBodyRow({Key? key, required this.widget, required this.e}) : super(key: key);

  final HomePage widget;
  final Map<String, dynamic> e;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 15,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  e['cardType'],
                  style: widget.titleStyle,
                ),
                const Text('Expiry'),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(masker(e['cardNumber'].toString(), 0, 3)),
              Text(e['cardExpiry']),
            ],
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Card Details',
                  style: TextStyle(
                    color: Colors.lightBlue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              IconButton(
                  padding: EdgeInsets.zero,
                  constraints:
                      const BoxConstraints(maxWidth: 30, maxHeight: 30),
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_forward,
                    color: Colors.lightBlue,
                  ))
            ],
          )
        ],
      ),
    );
  }
}
