import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:local_et_toi/utils/constants.dart' as constants;

class FavoritesProducers extends StatelessWidget {
  final List<Map<String, dynamic>> favorites;

  const FavoritesProducers({Key? key, required this.favorites});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: const BoxConstraints(minHeight: 0),
              child: Column(
                children: List.generate(
                  favorites.length,
                  (index) => FavoriteWidgetProducer(
                    id: favorites[index]['ref'], // Utilisez l'ID approprié de votre modèle de données
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class FavoriteWidgetProducer extends StatelessWidget {
  final DocumentReference<Map<String, dynamic>> id;

  const FavoriteWidgetProducer({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(id.id);

    return Card(
      child: SizedBox(
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                Placeholder(
                  fallbackHeight: 100,
                  fallbackWidth: 100,
                ),
                Icon(
                  Icons.favorite,
                  color: Colors.red, // Couleur du cœur (à adapter)
                ),
              ],
            ),
            FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
              future: FirebaseFirestore.instance.collection('shops').doc(id.id).get(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text("Erreur: ${snapshot.error}");
                } else if (!snapshot.hasData || !snapshot.data!.exists) {
                  return Text("Document introuvable.");
                }

                // Accéder aux données du document
                Map<String, dynamic> data = snapshot.data!.data()!;

                // Utiliser les données pour afficher les informations sur le produit
                return Column(
                  children: [
                    Row(
                      children: [
                        Text(data['name'] ?? 'Nom du shop manquant', style: constants.titre),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.location_on, color: constants.grey85),
                        Text(data['adresse'] ?? 'Adresse du shop manquante'),
                      ],
                    ),
                    Row(
                      children: [
                        // description
                        Text(data['description'] ?? 'Description du shop manquante'),
                      ],
                    ),
                    Row(
                      children: [
                        // note (numéro type int)
                        //Text(data['note'] ?? 'Note du shop manquante'),
                      ],
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
