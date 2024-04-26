import 'package:flutter/material.dart';

class InicioScreen extends StatefulWidget {
  const InicioScreen({super.key});

  @override
  State<InicioScreen> createState() => _InicioScreenState();
}

class _InicioScreenState extends State<InicioScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _contraController = TextEditingController();
  final TextEditingController _confircontraController = TextEditingController();

  bool isVisibleObscure = false;

  void _submittedForm() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Form entregado correctamente!"),
        ),
      );
    }
  }

  String? validateName(String? value) {
    if (value!.isEmpty) {
      return "Nombre";
    } else if (RegExp(r"^[a-zA-Z]+$").hasMatch(value)) {
      return "Por favor introduzca un nombre valido";
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value!.isEmpty) {
      return "Introduzca su email";
    } else if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9. -]+\.[a-zA-Z]{2,}$")
        .hasMatch(value)) {
      return "Porfavor ingrese un email valido";
    }
    return null;
  }

  String? validatePassword(String? value, String? text) {
    if (value!.isEmpty) {
      return "Ingrese su contraseña";
    } else if (value.length < 6) {
      return "La contraseña debe tener al menos 6 caracteres";
    } else if (!RegExp(r"^[a-zA-Z0-9]+$").hasMatch(value)) {
      return "La contraseña deberia contener unicamente letras y numeros";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image(
              image: AssetImage("assets/Petco.png"),
              height: 150,
            ),
            Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Crear \ Nueva cuenta",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.black45),
                  ),
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person), hintText: "Nombre"),
                  ),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email), hintText: "Correo"),
                  ),
                  TextFormField(
                    controller: _contraController,
                    autocorrect: false,
                    enableSuggestions: false,
                    obscureText: isVisibleObscure,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                isVisibleObscure = !isVisibleObscure;
                              });
                            },
                            icon: isVisibleObscure
                                ? Icon(Icons.visibility_off)
                                : Icon(Icons.visibility)),
                        prefixIcon: Icon(Icons.password),
                        hintText: "Contraseña"),
                  ),
                  TextFormField(
                    controller: _confircontraController,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.password),
                        hintText: "Confirmar Contraseña"),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff690000),
                        minimumSize: Size(400, 50)),
                    onPressed: () {},
                    child: Text(
                      'Crear',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    )));
  }
}
