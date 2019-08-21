import 'package:flutter/material.dart';
import 'package:qod/blocs/blocs.dart';
import 'package:qod/repositories/repositories.dart';
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
    qouteAPIClient: QouteAPIClient()
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Qoute of the day',
      home: BlocProvider(
        builder: (context) =>
            QuoteBloc(qouteRepository: qouteRepository),
        child: QouteOfTheDay(),
      ),
    );
  }
}

class QouteOfTheDay extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    
    final bloc = BlocProvider.of<QuoteBloc>(context);

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('Quote of the day'),
      ),
      body: Container(
        padding: EdgeInsets.all(40),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        
        decoration:  BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Color(0xffFEAC5E), Color(0xffC779D0), Color(0xff4BC0C8)]
          )  
        ),

        child: Center(child:  BlocBuilder<QuoteBloc, QuoteState>(
          builder: (context, state) {
            if (state is QuoteEmptyState) {
              // fetch qoute 
              bloc.dispatch(FetchQuote());
              return Text("Serving daily quote in a few seconds");
            
            } else if (state is QuoteLoadingState) {
            
              return Text("Fetching your daily quote");
            } else if (state is QuoteLoadedState) {
            
              final qoute = state.quote;
             
              return Text('"${qoute.quote}"\n\n - ${qoute.author}',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontFamily: 'RobotoMono',
                  fontSize: 20));
            } else {
              return Text("Something went wrong");
            }
          }
         )
        ),
      )
    );
  }
}

