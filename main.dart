import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  var wtController=TextEditingController();
  var ftController=TextEditingController();
  var inController=TextEditingController();
  var result="";
  var bgColor=Colors.indigo.shade200;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('yourBMI'),
      ),
      body: Container(
        color:bgColor,

        child: Center(
        child: Container(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center ,
            children: [
              Text('BMI', style:TextStyle(fontSize: 34, fontWeight: FontWeight.w700),),
              TextField(
                controller: wtController,
                decoration: InputDecoration(
                  label: Text('Enter Your Weight'),
                  prefixIcon: Icon(Icons.line_weight)
                ),
                keyboardType: TextInputType.number,
              ),

              TextField(
                controller: ftController,
                decoration: InputDecoration(
                    label: Text('Enter Your Height (In feet)'),
                    prefixIcon: Icon(Icons.height)
                ),
                keyboardType: TextInputType.number,
              ),

              SizedBox(height: 11,),
              TextField(
                controller: inController,
                decoration: InputDecoration(
                    label: Text('Enter Your Height (in inches)'),
                    prefixIcon: Icon(Icons.height)
                ),
                keyboardType: TextInputType.number,
              ),

              SizedBox(height: 16, ),
              ElevatedButton(onPressed: (){
                var wt=wtController.text.toString();
                var ft=ftController.text.toString();
                var it=inController.text.toString();
                if(wt!="" && ft!="" && it!=""){
                    var iWt=int.parse(wt);
                    var iFt=int.parse(ft);
                    var iInch=int.parse(it);
                    var totalInch=(iFt*12)+iInch;
                    var totalHeight=(totalInch*2.54)/100;
                    var bmi=iWt/(totalHeight*totalHeight);
                    var msg="";
                    if(bmi>25){
                      msg="You are Overweight!";
                      bgColor=Colors.orange.shade200;
                    }else if(bmi<18){
                      msg="You are UnderWeight";
                      bgColor=Colors.red.shade200;
                    }else{
                      msg="You are healthy!";
                      bgColor=Colors.green.shade200;
                    }
                    setState(() {
                      result="${msg} \nYour BMI is: ${bmi.toStringAsFixed(2)}";
                    });
                }
                else{
                  setState(() {
                    result="Please fill all the required blanks.";
                  });
                }
              }, child: Text('Calculate')),
              Text(result, style: TextStyle(fontSize: 16),)
            ],
          ),
        )
        ),
      )// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
