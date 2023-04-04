import 'package:flutter/material.dart';
import 'package:para_dice/class/dicepool.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DicePool _dicePool = new DicePool();
  Column _col = Column();

  List<Widget> createListOptionsNbDes() {
    return [
      ElevatedButton(
        onPressed: () => setState(() => _dicePool.decrNbDice(10)),
        style: ButtonStyle(
            backgroundColor:
                MaterialStateColor.resolveWith((states) => Colors.white)),
        child: const Text('-10', style: TextStyle(color: Colors.green)),
      ),
      ElevatedButton(
        onPressed: () => setState(() => _dicePool.decrNbDice(1)),
        style: ButtonStyle(
            backgroundColor:
                MaterialStateColor.resolveWith((states) => Colors.white)),
        child: const Text('-1', style: TextStyle(color: Colors.green)),
      ),
      ElevatedButton(
        onPressed: () => setState(() => _dicePool.setNbDice(1)),
        style: ButtonStyle(
            backgroundColor:
                MaterialStateColor.resolveWith((states) => Colors.white)),
        child: const Text('1', style: TextStyle(color: Colors.green)),
      ),
      ElevatedButton(
        onPressed: () => setState(() => _dicePool.incrNbDice(1)),
        style: ButtonStyle(
            backgroundColor:
                MaterialStateColor.resolveWith((states) => Colors.white)),
        child: const Text('+1', style: TextStyle(color: Colors.green)),
      ),
      ElevatedButton(
        onPressed: () => setState(() => _dicePool.incrNbDice(10)),
        style: ButtonStyle(
            backgroundColor:
                MaterialStateColor.resolveWith((states) => Colors.white)),
        child: const Text('+10', style: TextStyle(color: Colors.green)),
      )
    ];
  }

  List<Widget> createListOptionsNbFaces() {
    return [
      ElevatedButton(
        onPressed: () => setState(() => _dicePool.decrNbFace(10)),
        style: ButtonStyle(
            backgroundColor:
                MaterialStateColor.resolveWith((states) => Colors.white)),
        child: const Text('-10', style: TextStyle(color: Colors.green)),
      ),
      ElevatedButton(
        onPressed: () => setState(() => _dicePool.decrNbFace(1)),
        style: ButtonStyle(
            backgroundColor:
                MaterialStateColor.resolveWith((states) => Colors.white)),
        child: const Text('-1', style: TextStyle(color: Colors.green)),
      ),
      ElevatedButton(
        onPressed: () => setState(() => _dicePool.setNbFace(1)),
        style: ButtonStyle(
            backgroundColor:
                MaterialStateColor.resolveWith((states) => Colors.white)),
        child: const Text('1', style: TextStyle(color: Colors.green)),
      ),
      ElevatedButton(
        onPressed: () => setState(() => _dicePool.incrNbFace(1)),
        style: ButtonStyle(
            backgroundColor:
                MaterialStateColor.resolveWith((states) => Colors.white)),
        child: const Text('+1', style: TextStyle(color: Colors.green)),
      ),
      ElevatedButton(
        onPressed: () => setState(() => _dicePool.incrNbFace(10)),
        style: ButtonStyle(
            backgroundColor:
                MaterialStateColor.resolveWith((states) => Colors.white)),
        child: const Text('+10', style: TextStyle(color: Colors.green)),
      )
    ];
  }

  void showResult() {
    List<Widget> listW = List.empty(growable: true);
    int nbFace = _dicePool.getListDice()[0].getNbFace();
    for (int face = 1; face <= nbFace; face++) {
      int count = 0;
      for (int i = 0; i < _dicePool.getResult().length; i++) {
        if (face == _dicePool.getResult()[i]) {
          count++;
        }
      }
      listW.add(
        RichText(
          text: TextSpan(
            text: 'Nombre de ${face}: ',
            style: const TextStyle(color: Colors.black, fontSize: 20),
            children: [
              TextSpan(
                  text: count.toString(),
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20)),
            ],
          ),
        ),
      );
    }
    int twice = (listW.length / 2).floor();
    List<Widget> listOne = listW.sublist(0, twice);
    List<Widget> listTwo = listW.sublist(twice, listW.length);
    setState(() {
      _col = Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: listOne,
            ),
            const Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
            Column(
              children: listTwo,
            ),
          ],
        ),
        const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
        Column(
          children: [
            RichText(
              text: TextSpan(
                text: 'Moyenne obtenue: ',
                style: const TextStyle(color: Colors.black, fontSize: 20),
                children: [
                  TextSpan(
                      text: _dicePool.getMoyenne().toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20)),
                ],
              ),
            ),
          ],
        ),
      ]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: createListOptionsNbDes(),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
            RichText(
              text: TextSpan(
                text: 'Nombre de D6: ',
                style: const TextStyle(color: Colors.black, fontSize: 20),
                children: [
                  TextSpan(
                      text: _dicePool.getNbDice().toString(),
                      style: const TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 20)),
                ],
              ),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: createListOptionsNbFaces(),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
            RichText(
              text: TextSpan(
                text: 'Nombre de face: ',
                style: const TextStyle(color: Colors.black, fontSize: 20),
                children: [
                  TextSpan(
                      text: _dicePool.getNbFace().toString(),
                      style: const TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 20)),
                ],
              ),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            _col,
            ...List.from(_dicePool.getListMoyennes().reversed).map(
              (moy) => ListTile(
                title: Text(
                  'Moyenne de $moy',
                  style: TextStyle(
                      color: double.parse(moy) > 3 ? Colors.green : Colors.red),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _dicePool.lancerPool();
          showResult();
        },
        tooltip: 'Launch',
        child: const Icon(Icons.casino),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
