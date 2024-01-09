import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rickandmortyapp/models/character_model.dart';
import 'package:rickandmortyapp/providers/api_provider.dart';

class EpisodeList extends StatefulWidget {
  const EpisodeList({super.key, required this.size, required this.character});

  final Size size;
  final Character character;

  @override
  State<EpisodeList> createState() => _EpisodeListState();
}

class _EpisodeListState extends State<EpisodeList> {
  @override
  void initState() {
    super.initState();
    final apiProvider = Provider.of<ApiProvider>(context, listen: false);
    apiProvider.getEpisodes(widget.character);
  }

  @override
  Widget build(BuildContext context) {
    final apiProvider = Provider.of<ApiProvider>(context);
    return SizedBox(
      height: widget.size.height * 0.30,
      child: ListView.builder(
        itemCount: apiProvider.episodes.length,
        itemBuilder: (context, index) {
          final episode = apiProvider.episodes[index];
          return ListTile(
            leading: Text(episode.episode),
            title: Text(episode.name),
            trailing: Text(episode.airDate),
          );
        }
      ),
    );
  }
}
