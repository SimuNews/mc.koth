// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'starter_pack.dart';

// **************************************************************************
// FileGenerator
// **************************************************************************

final File TickFile = File(
  '/tick',
  child: tick,
);

final File LoadFile = File(
  '/load',
  child: load,
);

// **************************************************************************
// PackGenerator
// **************************************************************************

class StarterPack extends Widget {
  @override
  Widget generate(Context context) => Pack(
        name: 'stvctest',
        files: starter,
        main: File('tick', create: false),
        load: File('load', create: false),
      );
}
