import 'package:adapter_example/adapters/icontacts_adapter.dart';
import 'package:adapter_example/models/contact_model.dart';
import 'package:flutter/material.dart';

import 'contacts_card.dart';

class ContactsSection extends StatefulWidget {
  final IContactAdapter adapter;
  final String headerText;

  const ContactsSection({
    @required this.adapter,
    @required this.headerText,
  })  : assert(adapter != null),
        assert(headerText != null);

  @override
  _ContactsSectionState createState() => _ContactsSectionState();
}

class _ContactsSectionState extends State<ContactsSection> {
  final List<Contact> contacts = List<Contact>();

  void _getContacts() {
    setState(() {
      contacts.addAll(widget.adapter.getContacts());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(widget.headerText),
        Stack(
          children: <Widget>[
            AnimatedOpacity(
              duration: const Duration(milliseconds: 500),
              opacity: contacts.length > 0 ? 1.0 : 0.0,
              child: Column(
                  children: contacts
                      .map((contact) => ContactCard(
                            contact: contact,
                          ))
                      .toList()),
            ),
          ],
        ),
        RaisedButton(
          child: Text('Get contacts'),
          onPressed: _getContacts,
        )
      ],
    );
  }
}
