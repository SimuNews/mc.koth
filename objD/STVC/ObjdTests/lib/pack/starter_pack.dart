import 'package:objd/core.dart';

part 'starter_pack.g.dart';

@Pck(name: 'stvctest', load: 'load', main: 'tick')
final starter = [
  TickFile,
  LoadFile,
];

@Func(name: 'tick')
final tick = For.of([
  
]);

@Func(name: 'load')
final load = For.of([
  Marker(Location.glob(), tags: ["marker"], data: {"CustomName":"{\"text\":\"HelloWorld\"}","CustomNameVisible":true})
]);
