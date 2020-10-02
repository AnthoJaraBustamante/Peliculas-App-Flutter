import 'package:flutter/material.dart';

import 'package:flutter_swiper/flutter_swiper.dart';

class CardSwiper extends StatelessWidget {
  final List<dynamic> peliculas;

  CardSwiper({@required this.peliculas});

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Container(
      height: _screenSize.height * 0.5,
      width: _screenSize.width * 0.8,
      padding: EdgeInsets.only(top: 10.0),
      child: Center(
        child: Swiper(
          autoplay: true,
          itemHeight: _screenSize.height * 0.5,
          itemWidth: _screenSize.height * 0.5,
          layout: SwiperLayout.STACK,
          itemBuilder: (BuildContext context, int index) {
            return Image.network("http://via.placeholder.com/350x150",
                fit: BoxFit.fill);
          },
          itemCount: 3,
          // pagination: SwiperPagination(),
          // control: SwiperControl(),
        ),
      ),
    );
  }
}
