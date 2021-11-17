// import the core of the framework:
import 'package:objd/core.dart';
// import the custom pack:
import './packs/koth_pack.dart';

void main(List<String> args) {
  createProject(
      Project(
        name: 'koth',
        target:
            "C:/Users/SimuNews/AppData/Roaming/.minecraft/saves/stvc2/datapacks/", // path for where to generate the project
        generate: KothPack(), // The starting point of generation
      ),
      args);
}
