part of koth;

class GetArenas extends Widget {
  @override
  generate(Context context) {
    return For.of([
      CustomCommand(
        "List",
        "build",
        children: [
          Entity.Self().addTag("kothList"),
          CmdIndex.setScoreToHighest(),
          Tellraw(
            Entity.Self(),
            show: [
              TextComponent(
                "===== KOTH Arenas =====",
                color: Color.Gold,
              ),
            ],
          ),
          ForEach(
            IndexedEntity.getScore("kothArenaID"),
            then: (s) {
              return For.of([
                Execute.as(
                  Entity(
                    tags: ["kothArena"],
                  ),
                  children: [
                    If(
                      Score.fromSelected("kothArenaID").isEqual(s),
                      then: [
                        Tellraw(
                          Entity.All(
                            tags: ["kothList"],
                          ),
                          show: [
                            TextComponent("#", color: Color.DarkGreen),
                            TextComponent.score(
                              Score.fromSelected("kothArenaID"),
                              color: Color.DarkGreen,
                            ),
                            TextComponent(" | ", color: Color.Gold),
                            TextComponent("Height ", color: Color.Green),
                            TextComponent.score(
                              Score.fromSelected("kothHeight"),
                              color: Color.DarkGreen,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ]);
            },
          ),
        ],
      ),
    ]);
  }
}
