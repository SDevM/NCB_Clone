import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:untitled/shared/clipPaths.dart';
import 'package:untitled/widgets/accordion.widget.dart';
import 'package:untitled/widgets/bigButton.widget.dart';
import 'package:untitled/widgets/bodyRows.widget.dart';

import '../widgets/topRow.widget.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);
  final TextStyle titleStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: Colors.blue.shade700,
  );

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> accounts = [
    {
      'accountNumber': '1234567890',
      'accountBalance': 0.00,
      'accountCurrency': 'JMD',
      'accountType': 'SAVINGS',
    },
  ];

  List<Map<String, dynamic>> cards = [
    {
      'cardNumber': '1234567890',
      'cardType': 'VISA',
      'cardExpiry': '08/24',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (layoutContext, constraints) => Scaffold(
              extendBodyBehindAppBar: true,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                foregroundColor: Colors.white,
                leadingWidth: 400,
                leading: MaterialButton(
                  onPressed: () {},
                  child: Flex(
                    direction: Axis.horizontal,
                    children: [
                      const Expanded(
                          child: Icon(
                        Icons.menu,
                        color: Colors.white,
                        size: 50,
                      )),
                      Expanded(
                          child: Image.asset(
                        'images/logo.png',
                        width: 60,
                      ))
                    ],
                  ),
                ),
                actions: [
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Log out',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ))
                ],
              ),
              body: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: Image.asset('images/ncb.png').image,
                      fit: BoxFit.fitWidth,
                      alignment: const Alignment(0, -1.8)),
                ),
                child: Stack(
                  children: [
                    Container(
                      color: Colors.black.withOpacity(0.15),
                    ),
                    ClipPath(
                      clipper: TopBumpI(),
                      child: Container(
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 60, 20, 0),
                      child: SafeArea(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(bottom: 40),
                              child: Text(
                                'Good Morning, User',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 22),
                              ),
                            ),
                            SizedBox(
                              height: 80,
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 5),
                                child: Flex(
                                  direction: Axis.horizontal,
                                  children: [
                                    BigButton(
                                      bottom: 'Transfer',
                                      top: const Icon(Icons.payments_outlined),
                                      color: Colors.lightBlue.shade300,
                                      textColor: Colors.black,
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 8),
                                    ),
                                    BigButton(
                                      bottom: 'Bill Pay',
                                      top: const Icon(Icons.credit_score),
                                      color: Colors.blue.shade700,
                                      textColor: Colors.white,
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 8),
                                    ),
                                    BigButton(
                                      bottom: 'Top-Up',
                                      top: const Icon(Icons.send_to_mobile),
                                      color: Colors.yellow.shade500,
                                      textColor: Colors.black,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: ListView(
                                children: [
                                  Accordion(
                                    title: 'Bank Accounts',
                                    content: Column(
                                      children: [
                                        TopRow(
                                            widget: widget,
                                            title: 'New Debit Card?',
                                            sub: 'Activate it Here'),
                                        const Icon(
                                          BootstrapIcons.chevron_compact_down,
                                        ),
                                        ...(accounts.isNotEmpty
                                            ? accounts
                                                .map((e) => AccountBodyRow(
                                                      widget: widget,
                                                      e: e,
                                                    ))
                                            : [const Text('')])
                                      ],
                                    ),
                                  ),
                                  Accordion(
                                    title: 'Credit Cards',
                                    content: Column(
                                      children: [
                                        TopRow(
                                            widget: widget,
                                            title: 'New Credit Card?',
                                            sub: 'Activate it Here'),
                                        const Icon(BootstrapIcons
                                            .chevron_compact_down),
                                        ...(cards.isEmpty
                                            ? [
                                                const Text(
                                                    'No credit card accounts present.')
                                              ]
                                            : cards.map(
                                                (e) => CreditBodyRow(
                                                  widget: widget,
                                                  e: e,
                                                ),
                                              ))
                                      ],
                                    ),
                                  ),
                                  const Accordion(
                                    title: 'Investments',
                                    content: Text('Stuff'),
                                  ),
                                  const Accordion(
                                    title: 'Loans',
                                    content: Text('Stuff'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 50),
                                    child: TextButton(
                                      onPressed: () {},
                                      child: const Center(
                                        child: Text(
                                            'Don\'t see all your accounts?'),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ));
  }
}
