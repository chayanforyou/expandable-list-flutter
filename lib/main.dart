import 'package:flutter/material.dart';
import 'package:flutter_expandable_list/language.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Language> languages = [];
  bool showAll = false;
  int itemCount = 3; // Number of items to show initially

  int getUUID() {
    return DateTime.now().millisecondsSinceEpoch;
  }

  @override
  void initState() {
    languages.add(Language(id: getUUID(), name: 'Assembly'));
    languages.add(Language(id: getUUID(), name: 'C/C++'));
    languages.add(Language(id: getUUID(), name: 'Java'));
    languages.add(Language(id: getUUID(), name: 'Kotlin'));
    languages.add(Language(id: getUUID(), name: 'Python'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Technologies'),
      ),
      body: Card(
        margin: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: const Text('Languages'),
              titleTextStyle: Theme.of(context).textTheme.titleMedium,
              trailing: IconButton(
                iconSize: 22.0,
                icon: const Icon(Icons.add),
                style: IconButton.styleFrom(
                  padding: EdgeInsets.zero,
                  minimumSize: const Size(32.0, 32.0),
                  foregroundColor: Theme.of(context).primaryColor,
                  backgroundColor: Theme.of(context).highlightColor,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                onPressed: showAddLanguageBottomSheet,
              ),
            ),
            const Divider(
              indent: 12.0,
              endIndent: 12.0,
            ),
            Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: showAll ? languages.length : itemCount.clamp(0, languages.length),
                itemBuilder: (context, index) {
                  final lang = languages[index];
                  return ListTile(
                    title: Text(lang.name),
                    titleTextStyle: Theme.of(context).textTheme.bodyMedium,
                    trailing: IconButton(
                      iconSize: 22.0,
                      icon: const Icon(Icons.delete_forever),
                      style: IconButton.styleFrom(
                        foregroundColor: Colors.redAccent,
                      ),
                      onPressed: () {
                        setState(() => languages.removeAt(index));
                      },
                    ),
                  );
                },
              ),
            ),
            if (languages.length > itemCount) ...[
              TextButton.icon(
                onPressed: () {
                  setState(() => showAll = !showAll);
                },
                label: Text(showAll ? 'Show less' : 'Show more'),
                icon: Icon(showAll ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down),
              ),
            ],
          ],
        ),
      ),
    );
  }

  void showAddLanguageBottomSheet() {
    final formKey = GlobalKey<FormState>();
    final controller = TextEditingController();

    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Container(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  title: const Text('Add Language'),
                  titleTextStyle: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 12.0),
                Form(
                  key: formKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: TextFormField(
                      controller: controller,
                      keyboardType: TextInputType.text,
                      textCapitalization: TextCapitalization.words,
                      decoration: const InputDecoration(
                        hintText: 'Ex: dart',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(),
                      ),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter language name';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                Align(
                  alignment: Alignment.centerRight,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Close'),
                      ),
                      const SizedBox(width: 10.0),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).primaryColor,
                          foregroundColor: Theme.of(context).scaffoldBackgroundColor,
                        ),
                        onPressed: () {
                          if (formKey.currentState?.validate() ?? false) {
                            setState(() => languages.add(Language(id: getUUID(), name: controller.text)));
                            Navigator.pop(context);
                          }
                        },
                        child: const Text('Add'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
