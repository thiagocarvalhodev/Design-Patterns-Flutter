import 'package:adapter_example/models/contact_model.dart';

/// Contrato
abstract class IContactAdapter {
  List<Contact> getContacts();
}
