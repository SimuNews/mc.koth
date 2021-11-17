part of koth;

class CreateArena extends Widget {
  @override
  generate(Context context) {
    return For.of([
      CustomCommand(
        "Create",
        "build",
        children: [
          Entity.Self().addTag("kothCreate"),
          CmdIndex.setScoreToHighest(),
          If(
            Condition.score(
              Score(Entity.PlayerName("#objdConstIndexed"), "kothArenaID")
                  .matchesRange(
                Range.from(501),
              ),
            ),
            then: [
              Tellraw(
                Entity.Self(),
                show: [
                  TextComponent("KOTH > ", color: Color.Gold),
                  TextComponent(
                    "[ERROR] Can't have more than 500 arenas!",
                    color: Color.Red,
                  ),
                ],
              ),
            ],
            orElse: [
              IndexedEntity.armorstand(
                score: "kothArenaID",
                loc: Location.glob(),
                tags: ["koth", "kothArena", "kothArenaNew"],
              ),
              Tellraw(
                Entity.Self(),
                show: [
                  TextComponent("KOTH > ", color: Color.Gold),
                  TextComponent("Arena ", color: Color.Green),
                  TextComponent("#", color: Color.DarkGreen),
                  TextComponent.score(
                    Score(
                      Entity(tags: ["kothArenaNew"], limit: 1),
                      "kothArenaID",
                    ),
                    color: Color.DarkGreen,
                  ),
                  TextComponent(" created", color: Color.Green),
                ],
              ),
              initArena("kothArenaNew"),
              Entity(tags: ["kothArenaNew"], limit: 1)
                  .removeTag("kothArenaNew"),
            ],
          ),
          Entity.Self().removeTag("kothCreate"),
        ],
      ),
    ]);
  }

  Widget initArena(String tag) {
    return For.of([
      Execute.as(
        Entity(
          tags: [tag],
        ),
        children: [
          // Set timer
          Score.fromSelected("minutes").set(3),
          Score.fromSelected("seconds").set(15),
          Score.fromSelected("isRunning").set(0),
          Score.fromSelected("isStarting").set(0),
          Score.fromSelected("inEditMode").set(1),
          Score.fromSelected("kothHeight").set(1000),
        ],
      ),
    ]);
  }
}
