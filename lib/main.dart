//imports
import 'package:flutter/material.dart';

//Executar app
void main() {
  runApp(const MyApp());
}

TextEditingController controllerPeso = TextEditingController();
TextEditingController controllerAltura = TextEditingController();
String resultadoIMC = "";

/*
// Variáveis para armazenar os dados
double peso = 0.0;
double altura = 0.0;
double imc = 0.0;
String classificacao = "";

// Função para calcular IMC
double calcularIMC(double peso, double altura) {
  return imc = peso / (altura * altura);
}

// Função para classificar o IMC
String classificarIMC(double imc) {
  if (imc < 16) {
    classificacao = "Magreza grave";
  } else if (imc <= 17) {
    classificacao = "Magreza moderada";
  } else if (imc <= 18.5) {
    classificacao = "Magreza leve";
  } else if (imc <= 25) {
    classificacao = "Saudável";
  } else if (imc <= 30) {
    classificacao = "Sobrepeso";
  } else if (imc <= 35) {
    classificacao = "Obesidade grau 1";
  } else if (imc <= 39.9) {
    classificacao = "Obesidade grau 2 (severa)";
  } else {
    classificacao = "Obesidade grau 3 (mórbida)";
  }
  return classificacao;
}
*/

//Classe estática - está definindo não será mudado na interface
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculdora de IMC',
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(
      //       seedColor: const Color.fromARGB(255, 40, 40, 40)),
      //   useMaterial3: true,
      // ),
      home: MyHomePage(title: 'Calculadora de IMC'),
    );
  }
}

//Classe dinâmica - define a estrutura e interações
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //Espaço para variáveis e funções

  //Construção da interface
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculadora de IMC"),
        backgroundColor: const Color.fromARGB(255, 40, 40, 40),
        titleTextStyle:
            const TextStyle(color: Color.fromARGB(250, 250, 250, 250)),
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextFormField(
              // Região para digitar o peso
              controller: controllerPeso,
              decoration: const InputDecoration(
                  labelText: "Peso (Kg)", hintText: "Digite seu peso em Kg"),
              keyboardType: const TextInputType.numberWithOptions(),
            ),
            TextFormField(
              // Região para digitar a altura
              controller: controllerAltura,
              decoration: const InputDecoration(
                  labelText: "Altura (m)",
                  hintText: "Digite seu peso em metro"),
              keyboardType: const TextInputType.numberWithOptions(),
            ),

            const SizedBox(
              height: 16,
            ),

            Text(resultadoIMC),

            const SizedBox(
              height: 16,
            ),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      num numAux = (num.parse(controllerPeso.text) /
                          (num.parse(controllerAltura.text) *
                              num.parse(controllerAltura.text)));

                      resultadoIMC = numAux.toStringAsFixed(2);
                    });
                  },
                  child: const Text("Calcular")),
            ),

            // Exibir os resultados
            // Text("Seu IMC é: ${calcularIMC(peso, altura).toStringAsFixed(2)}"),
            // Text("Classificação: ${classificarIMC(imc)}")
          ],
        ),
      )),
    );
  }
}
