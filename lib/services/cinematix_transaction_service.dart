part of 'services.dart';

class CinematixTransactionServices {
  static CollectionReference transactionCollection =
      Firestore.instance.collection('transactions');

  static Future<void> saveTransaction(
      CinematixTransaction cinematixTransaction) async {
    await transactionCollection.document().setData({
      'userID': cinematixTransaction.userID,
      'title': cinematixTransaction.title,
      'subtitle': cinematixTransaction.subtitle,
      'time': cinematixTransaction.time.millisecondsSinceEpoch,
      'amount': cinematixTransaction.amount,
      'picture': cinematixTransaction.picture,
    });
  }

  static Future<Null> getTransaction(String userID) async {
    QuerySnapshot snapshot = await transactionCollection.getDocuments();

    var documents = snapshot.documents
        .where((document) => document.data['userID'] == userID);

    return documents
        .map((e) => CinematixTransaction(
              userID: e.data['userID'],
              title: e.data['title'],
              subtitle: e.data['subtitle'],
              time: DateTime.fromMicrosecondsSinceEpoch(e.data['time']),
              amount: e.data['amount'],
              picture: e.data['picture'],
            ))
        .toList();
  }
}
