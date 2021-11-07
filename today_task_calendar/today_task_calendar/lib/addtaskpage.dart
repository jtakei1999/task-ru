import 'package:flutter/material.dart';
import 'dummyhomepage2.dart';

class AddTask extends StatelessWidget {
  const AddTask({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('タスク入力画面'),
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextField(
                            controller: null,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              labelText: 'タスク名',
                            ),
                          ),
                          const SizedBox(height: 24.0),
                          TextField(
                            controller: null, // Controller実装必要
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              labelText: '所要時間',
                            ),
                          ),
                          const SizedBox(height: 24.0),
                          TextField(
                            controller: null, // Controller実装必要
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              labelText: '優先度',
                            ),
                          ),
                          const SizedBox(height: 24.0),
                          Text('優先度とは??',
                              style: TextStyle(
                                fontSize: 32.0,
                              )),
                          Text('1:二週間以内くらい\n2:一週間くらい\n3:三日以内\n4:今日中\n5:今すぐに!',
                              style: TextStyle(
                                fontSize: 18.0,
                              ))
                        ],
                      ),
                      Container(
                        width: double.infinity,
                        height: 54.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: TextButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.blue),
                            foregroundColor:
                                MaterialStateProperty.all(Colors.white),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DummyHomePage2()),
                            );
                          },
                          child: const Text('入力完了!'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
