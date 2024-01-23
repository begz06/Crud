import '../../../../utils/import.dart';
import '../../../blocs/auth_bloc/Auth/auth_bloc.dart';
import '../../../blocs/auth_bloc/boards/boards_bloc.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration Page'),
      ),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state,) {
          if (state.isLoggedIn ?? false) {
            Navigator.of(context).maybePop();
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (_) =>
                    BlocProvider(
                      create: (context) => BoardsBloc()..add(GetBoardList()),
                      child: const HomePage(),
                    )), (route) => false);
          } else if (state.isLoading ?? false) {
            showDialog(
                barrierDismissible: false,
                context: context,
                builder: (_) => const Center(
                  child: CircularProgressIndicator(),));
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: 'Login'),
                  controller: _phoneController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your login';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(labelText: 'Password'),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a password';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),

                SizedBox(height: 24.0),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      context.read<AuthBloc>().add(AuthLoginEvent(
                          login: _phoneController.text,
                          password: _passwordController.text));
                    }
                  },
                  child: Text('Sign Up'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
