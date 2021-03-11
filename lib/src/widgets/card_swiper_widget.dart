import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:peliculas/src/models/pelicula.dart';
import 'package:peliculas/src/providers/peliculas_provider.dart';

class SwiperTarjeta extends StatelessWidget {
  const SwiperTarjeta({
    Key key,
    @required this.peliculasProvider,
  }) : super(key: key);

  final PeliculasProvider peliculasProvider;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: peliculasProvider.getNowPlaying(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return CardSwiper(
            peliculas: snapshot.data,
          );
        } else {
          return Container(
              padding: EdgeInsets.all(30),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 200),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ));
        }
      },
    );
  }
}

class CardSwiper extends StatelessWidget {
  final List<Pelicula> peliculas;

  CardSwiper({@required this.peliculas});

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(top: 10.0),
      child: Center(
        child: Swiper(
          autoplay: true,
          itemWidth: _screenSize.width * 0.7,
          itemHeight: _screenSize.height * 0.5,
          layout: SwiperLayout.STACK,
          itemBuilder: (BuildContext context, int index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                fit: BoxFit.cover,
                placeholder: AssetImage('assets/img/no-image.jpg'),
                image: NetworkImage(
                  peliculas[index].getPosterImage(),
                ),
              ),
            );
          },
          itemCount: peliculas.length,
          // pagination: SwiperPagination(),
          // control: SwiperControl(),
        ),
      ),
    );
  }
}
