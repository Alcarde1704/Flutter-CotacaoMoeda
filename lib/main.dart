import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const MyHomePage(title: 'Conversão de moedas'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextStyle style_title =
      TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold);
  TextStyle style_button = TextStyle(
      fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.white);
  TextStyle style = TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold);

  TextEditingController real_controller = TextEditingController();
  List<String> _cotacoes = [''];

  double contador = 0;

  String moeda = '';

  void incrementaContador(double valor) {
    contador = contador + valor;
  }

  double cotacaoMoedaDolar() {
    var real = double.parse(real_controller.text);
    var cotacao = real / 4.66;

    if (cotacao > 1) {
      moeda = 'Dólares';
      _cotacoes.add('Cotacao Dólar - de $real Reais para $cotacao $moeda');
    } else {
      moeda = 'Dólar';
      _cotacoes.add('Cotacao Dólar - de $real Reais para $cotacao $moeda');
    }
    incrementaContador(real);
    return cotacao;
  }

  double cotacaoMoedaEuro() {
    var real = double.parse(real_controller.text);
    var cotacao = real / 5.02;

    if (cotacao > 1) {
      moeda = 'Euros';
      _cotacoes.add('Cotacao Euro - de $real Reais para $cotacao $moeda');
    } else {
      moeda = 'Euro';
      _cotacoes.add('Cotacao Euro - de $real Reais para $cotacao $moeda');
    }
    incrementaContador(real);
    return cotacao;
  }

  double cotacaoMoedaPeso() {
    var real = double.parse(real_controller.text);
    var cotacao = real / 0.041;

    if (cotacao > 1) {
      moeda = 'Pesos Argentinos';
      _cotacoes.add('Cotacao Peso - de $real Reais para $cotacao $moeda');
    } else {
      moeda = 'Pesos Argentinos';
      _cotacoes.add('Cotacao Peso - de $real Reais para $cotacao $moeda');
    }
    incrementaContador(real);
    return cotacao;
  }

  @override
  Widget build(BuildContext context) {
    final real_field = TextField(
      controller: real_controller,
      obscureText: false,
      decoration: InputDecoration(
          icon: Icon(Icons.monetization_on_outlined),
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Valor em real",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final cotaDolarButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.purple,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(20.0),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      SegundaTela(cotacaoMoedaDolar(), moeda)));
        },
        child: Text(
          'Cotar em dólar',
          style: style_button,
        ),
      ),
    );

    final cotaEuroButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.purple,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(20.0),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      SegundaTela(cotacaoMoedaEuro(), moeda)));
        },
        child: Text(
          'Cotar em Euro',
          style: style_button,
        ),
      ),
    );

    final cotaPesoButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.purple,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(20.0),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      SegundaTela(cotacaoMoedaPeso(), moeda)));
        },
        child: Text(
          'Cotar em Peso',
          style: style_button,
        ),
      ),
    );

    final relatorioButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.purple,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(20.0),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => TerceiraTela(_cotacoes)));
        },
        child: Text(
          'Relatório',
          style: style_button,
        ),
      ),
    );

    
    return Scaffold(
      appBar: AppBar(
        
        title: Text(widget.title),
      ),
      body: Center(
          
          child:
             

              Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 70.0,
              child: Text(
                'Conversão de moedas',
                style: style_title,
              ),
            ),
            SizedBox(height: 70.0, child: real_field),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: SizedBox(child: cotaDolarButton),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: SizedBox(child: cotaEuroButton),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: SizedBox(child: cotaPesoButton),
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: SizedBox(
                  child: Text(
                'Total cotado até agora: $contador',
                style: style,
              )),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: SizedBox(child: relatorioButton),
            ),
          ],
        ),
      )),
      
    );
  }
}

class SegundaTela extends StatelessWidget {
  TextStyle style_button = TextStyle(
      fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.white);

  final double cotacao_moeda;
  final String moeda;
  SegundaTela(this.cotacao_moeda, this.moeda);

  @override
  Widget build(BuildContext context) {
    final voltaButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.purple,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(20.0),
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text(
          'Voltar',
          style: style_button,
        ),
      ),
    );
    return Scaffold(
      appBar: AppBar(title: Text('Realizada conversão')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Conversão feita! verifique abaixo:',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: SizedBox(
                child: Text('Valor: $cotacao_moeda $moeda'),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: SizedBox(child: voltaButton),
            )
          ],
        ),
      ),
    );
  }
}

class TerceiraTela extends StatelessWidget {
  TextStyle style_button = TextStyle(
      fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.white);

  List<String> _cotacoes = [];
  TerceiraTela(this._cotacoes);

  @override
  Widget build(BuildContext context) {
    final voltaButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.purple,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(20.0),
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text(
          'Voltar',
          style: style_button,
        ),
      ),
    );
    return Scaffold(
      appBar: AppBar(title: Text('Relatórios de cotações')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Relatório:',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(15.0, 0, 15.0, 0),
              child: SizedBox(
                child: Column(
                    children: _cotacoes
                        .map((element) => Card(
                              child: Column(
                                children: <Widget>[Text(element)],
                              ),
                            ))
                        .toList()),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: voltaButton,
            )
          ],
        ),
      ),
    );
  }
}
