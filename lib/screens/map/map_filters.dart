import 'package:flutter/material.dart';
import 'package:local_et_toi/utils/constants.dart';

import '../../utils/buttons/buttons.dart';

class MapFiltersState extends StatefulWidget {
  const MapFiltersState({Key? key}) : super(key: key);

  @override
  MapFilters createState() => MapFilters();
}

class MapFilters extends State<MapFiltersState> {
  List<String> menuItems = <String>[
    'Proximité',
    'Prix croissant',
    'Prix décroissant',
    'Note croissante',
    'Note décroissante'
  ];

  String selectedValue = "Proximité";
  late String textValue = "";
  late List<String> tagValues = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: beige,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      Navigator.maybePop(context);
                    },
                  ),
                  const Text(
                    "Filtrer les résultats",
                    style: text,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Recherche autour de moi : ", style: textMedium),
                SizedBox(
                  width: 55.0,
                  height: 55.0,
                  child: TextField(
                    onChanged: (value) {
                      textValue = value;
                    },
                    maxLength: 3,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.black, width: 1.0),
                        )),
                  ),
                ),
                const Text(" km", style: textMedium),
              ],
            ),
            const Divider(
              color: Color(0xFFCBC6C6),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 17.0),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Catégories", style: textMedium)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TagButton(
                  onPressed: () {
                    updateTagValues("fruits");
                  },
                  buttonText: "fruits",
                ),
                const Padding(padding: EdgeInsets.only(right: 8.0)),
                TagButton(
                  onPressed: () {
                    updateTagValues("légumes");
                  },
                  buttonText: "légumes",
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.only(top: 20.0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TagButton(
                  onPressed: () {
                    updateTagValues("boissons alcoolisées");
                  },
                  buttonText: "boissons alcoolisées",
                ),
                const Padding(padding: EdgeInsets.only(right: 8.0)),
                TagButton(
                  onPressed: () {
                    updateTagValues("viande");
                  },
                  buttonText: "viande",
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.only(top: 20.0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TagButton(
                  onPressed: () {
                    updateTagValues("vêtements");
                  },
                  buttonText: "vêtements",
                ),
                const Padding(padding: EdgeInsets.only(right: 8.0)),
                TagButton(
                  onPressed: () {
                    updateTagValues("objets");
                  },
                  buttonText: "objets",
                ),
              ],
            ),
            const Divider(
              color: Color(0xFFCBC6C6),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 17.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("Labels", style: textMedium),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: ImageSelectionButton(
                      onPressed: () {
                        updateTagValues("aop");
                      },
                      imagePath: "images/aop.png",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: ImageSelectionButton(
                      onPressed: () {
                        updateTagValues("igp");
                      },
                      imagePath: "images/igp.png",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: ImageSelectionButton(
                      onPressed: () {
                        updateTagValues("vdf");
                      },
                      imagePath: "images/vdf.jpeg",
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: ImageSelectionButton(
                      onPressed: () {
                        updateTagValues("bleu_blanc_coeur");
                      },
                      imagePath: "images/logo-bleu-blanc-coeur.png",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: ImageSelectionButton(
                      onPressed: () {
                        updateTagValues("ofg");
                      },
                      imagePath: "images/logo-origine-france-garantie-OFG.png",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: ImageSelectionButton(
                      onPressed: () {
                        updateTagValues("aoc");
                      },
                      imagePath: "images/aoc.png",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: ImageSelectionButton(
                      onPressed: () {
                        updateTagValues("label_rouge");
                      },
                      imagePath: "images/label_rouge.png",
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: ImageSelectionButton(
                    onPressed: () {
                      updateTagValues("bio");
                    },
                    imagePath: "images/bio.png",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: ImageSelectionButton(
                    onPressed: () {
                      updateTagValues("stg");
                    },
                    imagePath: "images/stg.png",
                  ),
                ),
              ],
            ),
            const Divider(
              color: Color(0xFFCBC6C6),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 17.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("Trier par", style: textMedium),
              ),
            ),
            DropdownMenu<String>(
              dropdownMenuEntries: menuItems.map<DropdownMenuEntry<String>>((String value) {
                return DropdownMenuEntry<String>(value: value, label: value);
              }).toList(),
              onSelected: (String? newValue) {
                setState(() {
                  selectedValue = newValue!;
                });
              },
            ),
            
            Padding(
              padding: const EdgeInsets.only(top: 70.0),
              child: SizedBox(
                width: 400,
                height: 40,
                child: GreenRoundedButton(
                  onPressed: () {
                    print('Tags sélectionnés: $tagValues');
                    Navigator.maybePop(context, [textValue, selectedValue]);
                  },
                  buttonText: 'Filtrer',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void updateTagValues(String tag) {
    setState(() {
      if (tagValues.contains(tag)) {
        tagValues.remove(tag);
      } else {
        tagValues.add(tag);
      }
    });
  }
}
