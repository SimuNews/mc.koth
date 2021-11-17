part of koth;

class LoadFile extends Widget {
  /// The load file is put in a seperate widget to split the code in several files
  LoadFile();

  @override
  Widget generate(Context context) {
    CustomCommand.prefix = "koth";
    CustomCommand.permission = "koth";
    CustomCommand.shortPermission = "koth";
    return For.of([
      LoadDataPack("KOTH", ["SimuNews"]),
      Scoreboard("kothArenaID"),
      Scoreboard("kothPoints"),
      Scoreboard("isRunning"),
      Scoreboard("isStarting"),
      Scoreboard("inEditMode"),
      Scoreboard("kothInArena"),
      
    ]);
  }
}
