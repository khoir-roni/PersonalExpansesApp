import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses_app/models/transaction.dart';
// import 'package:personal_expenses_app/widgets/new_transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transaction;
  final Function deleteTx;
  TransactionList(this.transaction, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return transaction.isEmpty
        ? LayoutBuilder(
            builder: (ctx, constraints) {
              return Column(
                children: [
                  Text(
                    'No transaction added yet!',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Container(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset(
                      'assets/image/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              );
            },
          )
        : ListView.builder(
            itemCount: transaction.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                elevation: 5,
                margin: EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 5,
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FittedBox(
                          child: Text(
                              '\$${transaction[index].amount.toStringAsFixed(2)}')),
                    ),
                  ),
                  title: Text(
                    transaction[index].title,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  subtitle: Text(
                    DateFormat.yMMMd().format(transaction[index].date),
                  ),
                  trailing: IconButton(
                    onPressed: () => deleteTx(transaction[index].id),
                    icon: Icon(Icons.delete),
                    color: Theme.of(context).errorColor,
                  ),
                ),
              );
              // Card(
              //   child: Row(
              //     children: [
              //       Container(
              //         padding: EdgeInsets.all(10),
              //         margin:
              //             EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              //         decoration: BoxDecoration(
              //           border: Border.all(
              //             color: Theme.of(context).primaryColor,
              //             width: 2,
              //           ),
              //         ),
              //         child: Text(
              //           '\$${transaction[index].amount.toStringAsFixed(2)}',
              //           style: TextStyle(
              //             fontSize: 20,
              //             fontWeight: FontWeight.bold,
              //             color: Theme.of(context).primaryColor,
              //           ),
              //         ),
              //       ),
              //       Container(
              //         child: Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             Text(
              //               transaction[index].title,
              //               // style: const TextStyle(
              //               //     fontSize: 16, fontWeight: FontWeight.bold),
              //               style: Theme.of(context).textTheme.headline6,
              //             ),
              //             Text(
              //               DateFormat.yMMMd()
              //                   .format(transaction[index].date),
              //               style: const TextStyle(
              //                 color: Colors.grey,
              //               ),
              //             ),
              //           ],
              //         ),
              //       )
              //     ],
              //   ),
              // );
            },
          );
  }
}
