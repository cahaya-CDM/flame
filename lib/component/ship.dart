import 'package:flame/components.dart';
import 'package:flame/events.dart';
// import 'package:flame/events.dart';
import 'package:flame/flame.dart';
import 'dart:async';
import 'dart:math';

class Ship extends SpriteComponent {
  late Vector2 tujuan;
  late Vector2 arah;
  double speed = 10.0;

  Ship(){
    arah = Vector2(0, 0);
    tujuan = position;
  }
  
  void setTujuan(DragUpdateInfo info){
    tujuan = info.eventPosition.global;
    lookAt(tujuan);
    angle += pi;
    arah = tujuan - position;
    arah = arah.normalized();
  }

  @override
  FutureOr<void> onLoad() async {
    
    sprite = Sprite(await Flame.images.load("ships/spaceShips_001.png"));
    // mengatru posisi kapal
    position = Vector2(100, 100);
    angle = -pi / 2;
    anchor = Anchor.center;
    // scale = Vector2(2, 1);
  }

  @override
  void update(double dt){
    if((tujuan-position).length < speed){
      position = tujuan;
      arah = Vector2(0, 0);
    }
    position.add(arah * speed);
    super.update(dt);
  }

  
}