import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: CadastroScreen(),
    );
  }
}

class CadastroScreen extends StatefulWidget {
  @override
  _CadastroScreenState createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _nome;
  String? _email;
  String? _idade;
  String? _genero;
  bool _aceitouTermos = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário de Cadastro'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Nome'),
                onSaved: (value) {
                  _nome = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira seu nome';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'E-mail'),
                keyboardType: TextInputType.emailAddress,
                onSaved: (value) {
                  _email = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira seu e-mail';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              Text('Gênero:'),
              ListTile(
                title: const Text('Masculino'),
                leading: Radio<String>(
                  value: 'Masculino',
                  groupValue: _genero,
                  onChanged: (value) {
                    setState(() {
                      _genero = value;
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('Feminino'),
                leading: Radio<String>(
                  value: 'Feminino',
                  groupValue: _genero,
                  onChanged: (value) {
                    setState(() {
                      _genero = value;
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('Outro'),
                leading: Radio<String>(
                  value: 'Outro',
                  groupValue: _genero,
                  onChanged: (value) {
                    setState(() {
                      _genero = value;
                    });
                  },
                ),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Idade'),
                keyboardType: TextInputType.number,
                onSaved: (value) {
                  _idade = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira sua idade';
                  }
                  return null;
                },
              ),
              CheckboxListTile(
                title: const Text('Aceito os Termos de Serviço'),
                value: _aceitouTermos,
                onChanged: (bool? value) {
                  setState(() {
                    _aceitouTermos = value!;
                  });
                },
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Cadastro realizado com sucesso!'),
                    ));
                  }
                },
                child: Text('Enviar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
