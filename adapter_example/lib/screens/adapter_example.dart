import 'package:adapter_example/adapters/json_contacts_adapter.dart';
import 'package:adapter_example/adapters/xml_contacts_adapter.dart';
import 'package:adapter_example/widgets/contacts_section.dart';
import 'package:flutter/material.dart';

class AdapterExample extends StatefulWidget {
  @override
  _AdapterExampleState createState() => _AdapterExampleState();
}

class _AdapterExampleState extends State<AdapterExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
        centerTitle: true,
      ),
      body: ScrollConfiguration(
        behavior: ScrollBehavior(),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ContactsSection(
                adapter: JsonContactsAdapter(),
                headerText: 'Contacts from JSON API:',
              ),
              const SizedBox(height: 60),
              ContactsSection(
                adapter: XmlContactsAdapter(),
                headerText: 'Contacts from XML API:',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
