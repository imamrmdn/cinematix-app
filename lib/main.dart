import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import './bloc/blocs.dart';
import './services/services.dart';
import './ui/screens/screens.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return StreamProvider.value(
      value: AuthServices.userStream,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => ScreenBloc(OnInitialScreen())),
          BlocProvider(create: (_) => UserBloc(UserInitial())),
          BlocProvider(create: (_) => ThemeBloc(ThemeState(ThemeData()))),
          BlocProvider(create: (_) => MovieBloc()..add(FetchMovies())),
          BlocProvider(create: (_) => TicketBloc())
        ],
        child: BlocBuilder<ThemeBloc, ThemeState>(
          builder: (_, themeState) => MaterialApp(
            theme: themeState.themeData,
            debugShowCheckedModeBanner: false,
            home: Wrapper(),
          ),
        ),
      ),
    );
  }
}
