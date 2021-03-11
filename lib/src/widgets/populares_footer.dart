import 'package:flutter/material.dart';
import 'package:peliculas/src/models/pelicula.dart';
import 'package:peliculas/src/providers/peliculas_provider.dart';

class Footer extends StatelessWidget {
  const Footer({
    Key key,
    @required this.peliculasProvider,
  }) : super(key: key);

  final PeliculasProvider peliculasProvider;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            'Populares',
            style: Theme.of(context).textTheme.subtitle1,
          ),
          FutureBuilder(
            future: peliculasProvider.getPopulares(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  shrinkWrap: true,
                  // physics: NeverScrollableScrollPhysics(),
                  // scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    Pelicula tag = snapshot.data[index];
                    return Text(tag.originalTitle);
                  },
                );
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
        ],
      ),
    );
  }
}
