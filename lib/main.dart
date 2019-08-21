import 'package:flutter/material.dart';
import 'package:qod/blocs/blocs.dart';
import 'package:qod/repositories/repositories.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';

class SimpleBlocDelegate extends BlocDelegate {
  @override
  onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }
}

void main() {
   BlocSupervisor.delegate = SimpleBlocDelegate();

  runApp(MyApp());
} 

class MyApp extends StatelessWidget {
  
 final QouteRepository qouteRepository = QouteRepository(
    qouteAPIClient: QouteAPIClient(httpClient: http.Client())
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: BlocProvider(
        builder: (context) =>
            QouteBloc(qouteRepository: qouteRepository),
        child: QouteOfTheDay(),
      ),
    );
  }
}

class QouteOfTheDay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<QouteBloc>(context);

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('Qoute of the day!'),
      ),
      body: Center(
        child:  BlocBuilder<QouteBloc, QouteState>(
          builder: (context, state) {
            if (state is QouteEmpty) {
              // fetch qoute 
              bloc.dispatch(FetchQoute());
              return Text("Hello World! Fetching your Daily Qoute in a few seconds");
            } else if (state is QouteLoading) {
              return Text("Fetching your daily qoute");
            } else if (state is QouteLoaded) {
              final qoute = state.qoute;
              return Container(
                padding: EdgeInsets.all(40),
                child: Text('"${qoute.quote}"\n\n - ${qoute.author}',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontFamily: 'RobotoMono',
                  fontSize: 20)),
              );
            } else {
              return Text("Something went wrong");
            }
          }
        )
      ),
    );
  }
}

