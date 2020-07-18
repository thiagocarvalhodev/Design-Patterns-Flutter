import 'package:adapter_example/adapters/icontacts_adapter.dart';
import 'package:adapter_example/api/xml_contacts_api.dart';
import 'package:adapter_example/models/contact_model.dart';
import 'package:xml/xml.dart' as xml;

/// Adapta a resposta da API para uma lista de Contatos.
class XmlContactsAdapter extends IContactAdapter {
  final api = XmlContactsApi();

  @override
  List<Contact> getContacts() {
    var contactsXml = api.getContactsXml();
    var contactsList = _parseContactsXml(contactsXml);

    return contactsList;
  }

  List<Contact> _parseContactsXml(String contactsXml) {
    var xmlDocument = xml.parse(contactsXml);
    var contactsList = List<Contact>();

    for (var xmlElement in xmlDocument.findAllElements('contact')) {
      var fullName = xmlElement.findElements('fullname').single.text;
      var email = xmlElement.findElements('email').single.text;
      var favouriteString = xmlElement.findElements('favourite').single.text;
      var favourite = favouriteString.toLowerCase() == 'true';

      contactsList.add(Contact(
        fullName: fullName,
        email: email,
        favourite: favourite,
      ));
    }

    return contactsList;
  }
}
