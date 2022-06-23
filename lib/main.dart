import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String> _list = ['PX', 'REM', 'EM', 'PERCEN', 'BASE'];

  late final TextEditingController leftTextController;
  late final TextEditingController rightTextController;
  late final TextEditingController textController;

  late bool isLeft;
  late String leftDropDownValue;
  late String rightDropDownValue;

  @override
  void initState() {
    super.initState();
    leftTextController = TextEditingController();
    rightTextController = TextEditingController();
    rightDropDownValue = _list[0];
    leftDropDownValue = _list[1];

    isLeft = true;


    leftTextController.addListener(() {
      if (isLeft) {
        double result = _calculate(leftDropDownValue, rightDropDownValue,
            double.tryParse(leftTextController.text) ?? 0);
        rightTextController.text = result.toString();


      }
    });
    rightTextController.addListener(() {
      if (!isLeft) {
        double result = _calculate(rightDropDownValue, leftDropDownValue,
            double.tryParse(rightTextController.text) ?? 0);
        leftTextController.text = result.toString();

      }
    });
    
  
  }
 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 237, 200),
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              if(leftDropDownValue == _list[0] && rightDropDownValue == _list[1])
              Text('PX REM CALCULATOR', style : TextStyle(fontFamily: 'Roboto',fontSize: 25,fontWeight: FontWeight.bold))
              else if(leftDropDownValue == _list[0] && rightDropDownValue == _list[2])
              const Text('PX EM CALCULATOR', style : TextStyle(fontFamily: 'Roboto',fontSize: 25,fontWeight: FontWeight.bold))
              else if(leftDropDownValue == _list[0] && rightDropDownValue == _list[3])
             const  Text('PX PERCENTAGE CALCULATOR', style : TextStyle(fontFamily: 'Roboto',fontSize: 25,fontWeight: FontWeight.bold))
              else if(leftDropDownValue == _list[0] && rightDropDownValue == _list[4])
              const Text('PX BASEUNİT CALCULATOR', style : TextStyle(fontFamily: 'Roboto',fontSize: 25,fontWeight: FontWeight.bold)),
             
              
               const SizedBox(height: 50,),
                Container(
                  height: 200,
                  margin: const EdgeInsets.only(left: 18,right: 18),
          decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
                  color: Color.fromARGB(255, 250, 250, 250),
                   boxShadow: const [BoxShadow(color:Color.fromARGB(255, 32, 31, 31),blurRadius: 20,spreadRadius: 3)]),
          child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: 
                [
                  Container(
                    margin: EdgeInsets.only(left: 8),
                    decoration: BoxDecoration(color: const Color.fromARGB(255, 223, 219, 219),
                    borderRadius: BorderRadius.circular(30)),
                    width: 88,
                    child: DropdownButton<String?>(
                      isExpanded: true,
                      value: leftDropDownValue,
                      icon:const  Icon(Icons.arrow_drop_down_rounded,color:  Color.fromARGB(255, 223, 219, 219),),
                      items: _list.map((item) {
                        return DropdownMenuItem(
                          alignment: Alignment.center,
                        value: item,
                        child: Text(item ,style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w700 , fontFamily: 'Roboto'),));
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            leftDropDownValue = value!;
                          });
                        }),
                  ),
                  const SizedBox(width: 10,),
                  Expanded(
                      child: TextField(
                    style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w600,fontFamily: 'Roboto'),
                    autofocus: isLeft,
                    controller: leftTextController,
                    onTap: () => isLeft = true,
                  )),
                const  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: TextField(
                    autofocus: !isLeft,
                    style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w600, fontFamily: 'Roboto'),
                    controller: rightTextController,
                    onTap: () => isLeft = false,
                  )),
                  const SizedBox(width: 10,),
                  Container(
                    margin: EdgeInsets.only(right: 8),
                  decoration: BoxDecoration(color: Color.fromARGB(255, 223, 219, 219),borderRadius: BorderRadius.circular(30)),
                   width: 88,
                    child: DropdownButton<String?>(
                      isExpanded: true,
                      icon:const  Icon(Icons.arrow_drop_down_rounded,color:  Color.fromARGB(255, 223, 219, 219),),
                        value: rightDropDownValue,
                        items: _list.map((String items) {
                          return DropdownMenuItem(
                            alignment: Alignment.center,
                            value: items, child: Text(items,style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w700),));
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            rightDropDownValue = value!;
                          });
                        }),
                  ),
                ],
          ),
        ),
              ],
            )),
      ),
    );
  }

  double _calculate(String fromMeasure, String toMeasure, double value) {
    // 1
    if (fromMeasure == _list[0]) {
      if (toMeasure == _list[0]) {
        return value;
      } else if (toMeasure == _list[1]) {
        return value / 16;
      } else if (toMeasure == _list[2]) {
        value / 16;
      } else if (toMeasure == _list[3]) {
        return value * 6.25;
      } else if (toMeasure == _list[4]) {
        return value * 8;
      }
    } else if (fromMeasure == _list[1]) {
      if (toMeasure == _list[0]) {
        return value * 16;
      }
       else if (toMeasure == _list[1]) {
        return value ;
      } else if (toMeasure == _list[2]) {
        value / 16;
      } else if (toMeasure == _list[3]) {
        return value * 6.25;
      } else if (toMeasure == _list[4]) {
        return value * 8;
      }
    }
    else if (fromMeasure == _list[2]){
       if (toMeasure == _list[0]) {
        return value * 16;
      }
       else if (toMeasure == _list[1]) {
        return value / 16;
      } else if (toMeasure == _list[2]) {
        value ;
      } else if (toMeasure == _list[3]) {
        return value * 6.25;
      } else if (toMeasure == _list[4]) {
        return value * 8;
      }
    }
    else if (fromMeasure == _list[3]){
       if (toMeasure == _list[0]) {
        return value * 16;
      }
       else if (toMeasure == _list[1]) {
        return value / 16;
      } else if (toMeasure == _list[2]) {
        value / 16;
      } else if (toMeasure == _list[3]) {
        return value ;
      } else if (toMeasure == _list[4]) {
        return value * 8;
      }

    }
    else if(fromMeasure == _list[4]){
       if (toMeasure == _list[0]) {
        return value * 16;
      }
       else if (toMeasure == _list[1]) {
        return value / 16;
      } else if (toMeasure == _list[2]) {
        value / 16;
      } else if (toMeasure == _list[3]) {
        return value * 6.25;
      } else if (toMeasure == _list[4]) {
        return value ;
      }

    }
    return 0; //...
  }
}
