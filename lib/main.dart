import 'package:checkprovider/model/item.dart';
import 'package:checkprovider/model/item_data.dart';
import 'package:checkprovider/pages/item_list.dart';
import 'package:checkprovider/provider/cat_provider.dart';
import 'package:checkprovider/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CatProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ItemData(),
        )
      ],
      child: MaterialApp(
        title: 'Provider Test',
        theme: ThemeData(
          primarySwatch: Colors.pink,
        ),
        home: const PrincipalePage(),
      ),
    );
  }
}

class PrincipalePage extends StatefulWidget {
  const PrincipalePage({Key? key}) : super(key: key);

  @override
  State<PrincipalePage> createState() => _PrincipalePageState();
}

class _PrincipalePageState extends State<PrincipalePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController catNameController = TextEditingController();
  TextEditingController catGenderController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final providerUser = Provider.of<UserProvider>(context);
    final providerCat = Provider.of<CatProvider>(context);
    final providerItemData = Provider.of<ItemData>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider Test"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text("Name : ${providerUser.name}"),
            const SizedBox(
              height: 15,
            ),
            Text("Last Name : ${providerUser.lastName}"),
            const SizedBox(
              height: 15,
            ),
            Text("Age : ${providerUser.age}"),
            const SizedBox(
              height: 15,
            ),
            const Divider(
              color: Colors.red,
              height: 4,
            ),
            const SizedBox(
              height: 15,
            ),
            Text("Cat Name : ${providerCat.name}"),
            const SizedBox(
              height: 15,
            ),
            Text("Cat Gender : ${providerCat.gender}"),
            const SizedBox(
              height: 15,
            ),
            const Divider(
              color: Colors.blue,
              height: 4,
            ),
            const SizedBox(
              height: 15,
            ),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                label: Text("Name"),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TextField(
              controller: lastNameController,
              decoration: const InputDecoration(
                label: Text("Last name"),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TextField(
              controller: ageController,
              decoration: const InputDecoration(
                label: Text("Age"),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Divider(
              color: Color.fromARGB(255, 145, 109, 1),
              height: 4,
            ),
            const SizedBox(
              height: 15,
            ),
            TextField(
              controller: catNameController,
              decoration: const InputDecoration(
                label: Text("Cat Name"),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TextField(
              controller: catGenderController,
              decoration: const InputDecoration(
                label: Text("Cat Gender"),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    providerUser.name = nameController.value.text;
                    providerUser.lastName = lastNameController.value.text;
                    providerUser.age = int.parse(ageController.value.text);
                    providerCat.name = catNameController.value.text;
                    providerCat.gender = catGenderController.value.text;

                    providerItemData.addItem(
                      Item(item: nameController.value.text),
                    );
                    nameController.clear();
                    lastNameController.clear();
                    ageController.clear();
                    catNameController.clear();
                    catGenderController.clear();
                  },
                  child: const Text("Valider"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ItemList(),
                      ),
                    );
                  },
                  child: const Text("Page ➡"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
