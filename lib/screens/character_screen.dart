import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rickandmortyapp/models/character_model.dart';
import 'package:rickandmortyapp/widgets/episode_list.dart';

class CharacterScreen extends StatelessWidget {
  final Character character;
  const CharacterScreen({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.go('/');
          },
        ),
        title: Text(character.name!),
        centerTitle: true,
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.4,
              width: double.infinity,
              child: Hero(
                tag: character.id,
                child: Image.network(
                  character.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
                padding: const EdgeInsets.all(10),
                height: size.height * 0.14,
                width: double.infinity,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    cardData("Status:", character.status),
                    cardData("Specie:", character.species),
                    cardData("Origin:", character.origin.name),
                  ],
                )),
                const Text('Episodes', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)
                ),
                EpisodeList(size: size, character: character)
          ],
        ),
      ),
    );
  }

  Widget cardData(String text1, String text2) {
    return Expanded(
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              text1,
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              text2,
              style: const TextStyle(overflow: TextOverflow.ellipsis),
            ),
          ],
        ),
      ),
    );
  }
}
