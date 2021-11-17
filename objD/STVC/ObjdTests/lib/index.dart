// import the core of the framework:
import 'package:objd/core.dart';
// import the custom pack:
import 'pack/starter_pack.dart';

part 'index.g.dart';

@Prj(name: 'stvcTests', target: '../compiled/')
final starter = StarterPack();
