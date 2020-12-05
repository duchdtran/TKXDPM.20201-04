class ProcessTransactionRequest{
  String version;
  Transaction transaction;
  String appCode;


}

class Transaction{
  String cardCode;
  String owner;
  String cvvCode;
  String dateExpired;
  String command;
  String transactionContent;
  int amount;
  String createdAt;
}