import 'dart:convert';

import 'package:adapter_example/adapters/icontacts_adapter.dart';
import 'package:adapter_example/api/json_contacts_api.dart';
import 'package:adapter_example/models/contact_model.dart';

/// Adapta a resposta da API para uma lista de Contatos.
class JsonContactsAdapter extends IContactAdapter {
  JsonContactsApi api = JsonContactsApi();

  @override
  List<Contact> getContacts() {
    var contactsJson = api.getContactsJson();
    var contactsList = _parseContactsJson(contactsJson);

    return contactsList;
  }

  List<Contact> _parseContactsJson(String contactsJson) {
    var contactsMap = json.decode(contactsJson) as Map<String, dynamic>;
    var contactsJsonList = contactsMap['contacts'] as List;
    var contactsList = contactsJsonList
        .map((json) => Contact(
              fullName: json['fullName'],
              email: json['email'],
              favourite: json['favourite'],
            ))
        .toList();

    return contactsList;
  }
}
