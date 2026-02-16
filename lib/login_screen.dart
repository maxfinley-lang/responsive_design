import 'package:flutter/material.dart';
import 'package:responsive_design/profile_card.dart';
import 'package:responsive_design/auth_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _passHidden = true;

  final _formKey = GlobalKey<FormState>();
  final AuthService _authService = AuthService();

  final _usernameController = TextEditingController();
  final _passwrodController = TextEditingController();

  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _header(),
                const SizedBox(height: 40),
                _username(),
                const SizedBox(height: 20),
                _password(),
                const SizedBox(height: 20),
                _isLoading ? const CircularProgressIndicator() : _loginButton(),
              ],
            ),
          ),
        ),
      ),
    );
  } // build

  Widget _header() {
    return const Text(
      'Welcome Back',
      style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
      textAlign: TextAlign.center,
    );
  }

  Widget _username() {
    return TextFormField(
      controller: _usernameController, // todo
      decoration: const InputDecoration(
        labelText: 'Username',
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.person_2),
      ),
      validator: (value) {
        if(value == null || value.trim().isEmpty){
          return 'Please enter your username and password';
        }
        return null;
      }, // todo
    );
  }

  Widget _password() {
    return TextFormField(
      controller: _passwrodController, //todo
      obscureText: _passHidden,
      decoration: InputDecoration(
        labelText: 'Password',
        border: const OutlineInputBorder(),
        prefixIcon: const Icon(Icons.lock),
        suffixIcon: IconButton(
          icon: Icon(_passHidden ? Icons.visibility_off : Icons.visibility),
          onPressed: () {
            setState(() {
              _passHidden = !_passHidden;
            });
          },
        ),
      ),
       validator: (value) {
        if(value == null || value.trim().isEmpty){
          return 'Please enter your username and password';
        }
        return null;
      }
    );
  }

  //login button
  Widget _loginButton() {
    return ElevatedButton(
      onPressed: _submitLogin,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 16),
        textStyle: const TextStyle(fontSize: 18),
      ),
      child: const Text('Login'),
    );
  }
  void _submitLogin() async {
    if(!_formKey.currentState!.validate()) return;
    setState(() => _isLoading = true);
    final email = _usernameController.text.trim();
    final password = _passwrodController.text.trim();

    try{
      await _authService.signIn(email:email, password:password);

      if(!mounted) return;

      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const ProfileCard()),);
    }
    catch(e){
      if(!mounted) return; //todo error pop up(Toast)

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
          backgroundColor: Colors.red,

        ),);
    }
    finally{
      if(mounted){
        setState(() => _isLoading);
      }
    }
  }
}
