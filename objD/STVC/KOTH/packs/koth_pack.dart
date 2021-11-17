library koth;

//import
import 'package:objd/core.dart';
import '../../../CustomTools/lib/core.dart';

// import all the files:
part '../files/load.dart';
part '../files/main.dart';

//timer
part '../files/timer/countdown.dart';

// game
part '../files/game/updatePlayer.dart';
part '../files/game/updateArena.dart';

//cmds
part '../files/cmd/index.dart';
part '../files/cmd/createArena.dart';
part '../files/cmd/setHeight.dart';
part '../files/cmd/enableArena.dart';
part '../files/cmd/list.dart';

class KothPack extends Widget {
  /// There is a folder for all packs inside a project, It is recommended to give each pack an own widget
  KothPack();

  @override
  Widget generate(Context context) {
    return Pack(
        name: 'koth', // name of the subpack
        main: File(
            // definining a file that runs every tick
            'main',
            child: MainFile()),
        load: File(
            // definining a file that runs on reload
            'load',
            child: LoadFile()),
        modules: [],
        files: [
          File("cmd/index", child: CmdIndex()),
          File("cmd/create", child: CreateArena()),
          File("cmd/height", child: SetHeight()),
          File("cmd/enable", child: Enable()),
          File("cmd/list", child: GetArenas()),
          File("game/timer", child: Timer()),
          File("game/update_player", child: UpdatePlayer()),
        ]);
  }
}
