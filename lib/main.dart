import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:bloc_intro_46/bloc/counter_bloc.dart';
import 'package:bloc_intro_46/bloc/counter_event.dart';
import 'package:bloc_intro_46/bloc/counter_state.dart';
import 'package:bloc_intro_46/color_bloc/color_bloc.dart';
import 'package:bloc_intro_46/color_bloc/color_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CounterBloc>(
          create: (context) => CounterBloc(),
        ),
        BlocProvider<ColorBloc>(
          create: (context) => ColorBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bloc"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<ColorBloc, ColorState>(builder: (context, state) {
            return Container(
              color: state.color,
              width: 200,
              height: 200,
            );
          }),

          const SizedBox(
            height: 30,
          ),
          BlocBuilder<CounterBloc, CounterState>(
              // buildWhen: (previous, current) {
              //   print(previous.counter);
              //   print(current.counter);
              //   return current.counter>=5;
              // },
              builder: (context, state) {
            return Text(
              state.counter.toString(),
              style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            );
          }),

          //use of BlocSelector
          // BlocSelector<CounterBloc,CounterState,bool>(
          //     selector:(state) {
          //       return state.counter>=3?true: false;
          //     },
          //     builder: (context, state) {
          //       return Center(
          //         child: Container(
          //           width: 200,
          //           height: 200,
          //           color: state? Colors.green: Colors.red,
          //         ),
          //       );
          //     },
          // ),

          // use of Bloc Consumer

          // BlocConsumer<CounterBloc,CounterState>(
          //     builder:(context, state) {
          //     return   Text(state.counter.toString(),style:const TextStyle(fontSize: 50,fontWeight: FontWeight.bold),);
          //     },
          //     listener: (context, state) {
          //       if(state.counter>=5){
          //         final snackBar = SnackBar(
          //           /// need to set following properties for best effect of awesome_snackbar_content
          //           elevation: 0,
          //           behavior: SnackBarBehavior.floating,
          //           backgroundColor: Colors.transparent,
          //           content: AwesomeSnackbarContent(
          //             title: 'Working!!!',
          //             message:
          //             'This is an example of Bloc Listener!',
          //
          //             /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
          //             contentType: ContentType.success,
          //           ),
          //         );
          //
          //         ScaffoldMessenger.of(context)
          //           ..hideCurrentSnackBar()
          //           ..showSnackBar(snackBar);
          //       }
          //
          //     },),

          //use of Bloc Listener
          // BlocListener<CounterBloc,CounterState>(
          //   listenWhen: (previous, current) {
          //     return true;
          //   },
          //   listener: (context, state) {
          //
          //   if(state.counter>=5){
          //     final snackBar = SnackBar(
          //       /// need to set following properties for best effect of awesome_snackbar_content
          //       elevation: 0,
          //       behavior: SnackBarBehavior.floating,
          //       backgroundColor: Colors.transparent,
          //       content: AwesomeSnackbarContent(
          //         title: 'Working!!!',
          //         message:
          //         'This is an example of Bloc Listener!',
          //
          //         /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
          //         contentType: ContentType.success,
          //       ),
          //     );
          //
          //     ScaffoldMessenger.of(context)
          //       ..hideCurrentSnackBar()
          //       ..showSnackBar(snackBar);
          //   }
          // },
          //   child: const Text("Bloc Listener"),
          // ),

          const SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FloatingActionButton(
                onPressed: () {
                  context.read<CounterBloc>().add(CounterIncrementEvent());
                  context.read<ColorBloc>().add(CounterIncrementEvent());
                },
                child: const Icon(Icons.add),
              ),
              FloatingActionButton(
                onPressed: () {
                  context.read<CounterBloc>().add(CounterDecrementEvent());
                  context.read<ColorBloc>().add(CounterDecrementEvent());
                },
                child: const Icon(Icons.remove),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
