part of koth;

class MainFile extends Widget {
  /// The main file is put in a seperate widget to split the code in several files
  MainFile();

  @override
  Widget generate(Context context) {
    return For.of([
      MCFunction("cmd/index"),
      Comment("Timer"),
      MCFunction("game/countdown"),
      Comment("<Async> game stuff"),
      MCFunction("game/update_player"),
    ]);
  }
}
