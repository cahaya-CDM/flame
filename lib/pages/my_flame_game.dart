import 'dart:ui';

// import 'package:dasar_flame/component/asteroid.dart';
import 'package:dasar_flame/component/asteroid_spawner.dart';
import 'package:dasar_flame/component/bgParallaxColomponent.dart';
import 'package:dasar_flame/component/ship.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'dart:async';



class MyFlameGame extends FlameGame with PanDetector{
  late Ship s;
  late Bgparallaxcolomponent bgParallax;
  late AsteroidSpawner asp;
  
  @override
  Color backgroundColor(){
    return const Color(0xFF000045); //Merubah warna Background dengan syarat 8digit
  }

  @override
  FutureOr<void> onLoad() async {
    bgParallax = Bgparallaxcolomponent();
    add(bgParallax);
    // Asteroid a = Asteroid();
    // add(a);
    s = Ship();
    add(s);
    asp = AsteroidSpawner();
    add(asp);
    // bgParallax = Bgparallaxcolomponent();
    // add(bgParallax);
  }

  @override
  void update(double dt){
    bgParallax.changeSpeedBasedShip(s);
    super.update(dt);
  }

  
  // @override
  // void onTapDown(TapDownEvent event){
  //   s.position.add(Vector2(2, 0));
  // } 

  @override
  void onPanUpdate(DragUpdateInfo info){
    s.setTujuan(info);
  } // Method untuk drag in drop sebuah object dengan variabel global


}

// jika diberi event pada file sprite maka yang memiliki pengaruh adalah objek itu s
// endiri sedangkan jika dilakukan sebuah event TapDownEvent di file Utama game 
// maka semua object bisa mentriger event tersebut termasuk