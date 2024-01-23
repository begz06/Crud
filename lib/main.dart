import 'package:crud_example/presentation/blocs/auth_bloc/Auth/auth_bloc.dart';
import 'package:crud_example/presentation/blocs/auth_bloc/boards/boards_bloc.dart';
import 'package:crud_example/presentation/screens/pages/auth/auth_page.dart';
import 'package:crud_example/utils/import.dart';

import 'config/contants.dart';


void main() async {
  await GetStorage.init();
  final box = GetStorage();
  final bool isLoggedIn = box.hasData(Config.token);
  runApp(MyApp(isLoggedIn: isLoggedIn));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  const MyApp({super.key, required this.isLoggedIn});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) => AuthBloc(),
        child: isLoggedIn ? BlocProvider(
          create: (context) => BoardsBloc()..add(GetBoardList()),
          child: HomePage(),
        ) : RegistrationPage(),
      ),
    );
  }
}

