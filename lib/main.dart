import 'package:flutter/material.dart';
import 'package:personal_expenses_app/widgets/user_transaction.dart';
import './widgets/new_transaction.dart';
import './widgets/transaction_list.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Personal Expanses App',
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  // String titleInput;
  // String amountInput;
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  // void startAddNewTransaction(BuildContext ctx) {
  //   showModalBottomSheet(
  //     context: ctx,
  //     builder: (_) {
  //       return NewTransaction(addTx);
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Expanses App'),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.add))],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                width: double.infinity,
                child: Card(
                  color: Colors.blue,
                  child: Text('Chart'),
                ),
              ),
              UserTransaction(),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
