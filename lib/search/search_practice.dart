import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class SearchPractice extends StatefulWidget {
  @override
  _SearchPracticeState createState() => _SearchPracticeState();
}

class _SearchPracticeState extends State<SearchPractice> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _typeAheadController = TextEditingController();

  List<String> searchData = [
    'afifi',
    'moaz',
    'ahmed',
    'maraim',
    'abd elhameed',
    'yousef',
    'el gamal',
    'sherif',
    'abdo'
  ];

  List<String> getSuggestion(String query) {
    List<String> matches = [];
    if (query.length > 0) {
      matches.addAll(searchData);
      matches.retainWhere(
          (element) => element.toLowerCase().contains(query.toLowerCase()));
    }

    return matches;
  }

  String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Page'),
        centerTitle: true,
      ),
      drawer: SafeArea(
        child: Drawer(
          child: Container(
            color: Colors.greenAccent,
            child: ListView(
              children: [
                ListTile(
                  title: Text(
                    'page one',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.red,
                    ),
                  ),
                  subtitle: Text('Go to Page One'),
                  leading: Icon(
                    Icons.home,
                    color: Colors.teal,
                    size: 50,
                  ),
                  onTap: (){
                    print('go to page one from drawer');
                  },
                  trailing: Icon(Icons.check_circle_outline),
                ),
                Divider(
                  color: Colors.black,
                  indent: 30,
                  endIndent: 30,
                ),
                ListTile(
                  title: Text(
                    'page one',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.red,
                    ),
                  ),
                  subtitle: Text('Go to Page One'),
                  leading: Icon(
                    Icons.home,
                    color: Colors.teal,
                    size: 50,
                  ),
                  onTap: (){
                    print('go to page one from drawer');
                  },
                  trailing: Icon(Icons.check_circle_outline),
                ),
                Divider(
                  color: Colors.black,
                  indent: 30,
                  endIndent: 30,
                ),
                ListTile(
                  title: Text(
                    'page one',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.red,
                    ),
                  ),
                  subtitle: Text('Go to Page One'),
                  leading: Icon(
                    Icons.home,
                    color: Colors.teal,
                    size: 50,
                  ),
                  onTap: (){
                    print('go to page one from drawer');
                  },
                  trailing: Icon(Icons.check_circle_outline),
                  onLongPress: (){
                    print('long presssssssssssssssssssssss');
                  },
                ),

              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Form(
              key: _formKey,
              child: TypeAheadFormField(
                onSuggestionSelected: (suggestion) {
                  setState(() {
                    text = suggestion;
                  });
                },
                itemBuilder: (context, suggestion) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      suggestion,
                      style: TextStyle(fontSize: 18),
                    ),
                  );
                },
                suggestionsCallback: (pattern) {
                  return getSuggestion(pattern);
                },
                transitionBuilder: (context, suggestionsBox, controller) {
                  return suggestionsBox;
                },
                validator: (val) {
                  if (val.isEmpty) {
                    return 'enter some text';
                  }
                  return null;
                },
                textFieldConfiguration: TextFieldConfiguration(
                    decoration: InputDecoration(
                  hintText: 'enter some words..',
                  suffixIcon: Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                )),
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          text == null ? SizedBox() : Text(text)
        ],
      ),
    );
  }
}
