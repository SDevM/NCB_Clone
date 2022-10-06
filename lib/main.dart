import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/pages/home.page.dart';
import 'package:untitled/shared/clipPaths.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NCB Clone',
      theme: ThemeData(
          primarySwatch: Colors.blue, textTheme: GoogleFonts.latoTextTheme()),
      home: const Scaffold(
        body: Home(title: 'NCB Clone'),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key, String? title}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextStyle bodyText = const TextStyle(fontSize: 12, color: Colors.black);
  bool checkValue = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (layoutContext, constraints) => DecoratedBox(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: Image.asset('images/ncb.png').image)),
              child: DefaultTextStyle(
                style: const TextStyle(fontSize: 20, color: Colors.black),
                child: Stack(
                  children: [
                    ClipPath(
                      clipper: BottomBump(),
                      child: Container(color: Colors.blue.shade600),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Flex(
                        direction: Axis.vertical,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ClipPath(
                            clipper: LoginClip(),
                            child: Container(
                              clipBehavior: Clip.antiAlias,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 40, 20, 20),
                                child: Form(
                                  key: formKey,
                                  child: Column(
                                    children: [
                                      TextField(
                                        style: const TextStyle(
                                          fontSize: 14,
                                        ),
                                        decoration: InputDecoration(
                                          labelStyle: TextStyle(
                                            color: Colors.grey.shade400,
                                          ),
                                          label: const Text('Username'),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      TextField(
                                        style: const TextStyle(fontSize: 14),
                                        decoration: InputDecoration(
                                          labelStyle: TextStyle(
                                              color: Colors.grey.shade400),
                                          label: const Text('Password'),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Checkbox(
                                                  value: checkValue,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      checkValue = value!;
                                                    });
                                                  }),
                                              Text(
                                                'Remember Me',
                                                style: bodyText,
                                              )
                                            ],
                                          ),
                                          Text(
                                            'Forgot Password?',
                                            style: TextStyle(
                                                fontSize: bodyText.fontSize,
                                                color: bodyText.color,
                                                decoration:
                                                    TextDecoration.underline),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          MaterialButton(
                                            color: Colors.yellow,
                                            shape: RoundedRectangleBorder(
                                                side: BorderSide.none,
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            onPressed: () {
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (pageContext) =>
                                                          HomePage()));
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 10,
                                                      horizontal: 20),
                                              child: Row(
                                                children: const [
                                                  Text('TOUCH ID LOGIN  '),
                                                  Icon(Icons.fingerprint)
                                                ],
                                              ),
                                            ),
                                          ),
                                          MaterialButton(
                                            onPressed: () {},
                                            shape: RoundedRectangleBorder(
                                                side: const BorderSide(
                                                  color: Colors.lightBlueAccent,
                                                  width: 2,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: const Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 10),
                                              child: Text(
                                                'Sign In',
                                                style: TextStyle(
                                                    color:
                                                        Colors.lightBlueAccent),
                                              ),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 35),
                            child: SizedBox(
                              height: 65,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  Text("Activate Your Cards  |  ",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: bodyText.fontSize,
                                      )),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      const Icon(
                                        Icons.currency_exchange_sharp,
                                        color: Color(0xFFF6D514),
                                      ),
                                      Text(
                                        "Quick Send",
                                        style: TextStyle(
                                            color: Color(0xFFF6D514),
                                            fontSize: bodyText.fontSize),
                                      ),
                                    ],
                                  ),
                                  Text("  |  More ...",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: bodyText.fontSize,
                                      )),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ));
  }
}
