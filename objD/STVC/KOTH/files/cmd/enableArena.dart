part of koth;

class Enable extends Widget {
  @override
  generate(Context context) {
    return For.of([
      Scoreboard("kothHeight"),
      CustomCommand(
        "EnableArena",
        "build",
        from: 0,
        to: -1,
        children: [
          Entity.Self().addTag("kothEnableArena"),
          If(
            Condition.score(
              Score.fromSelected(
                "kothEnableArena",
              ).matches(0),
            ),
            then: [
              Tellraw(
                Entity.Self(),
                show: [
                  TextComponent("KOTH > ", color: Color.Gold),
                  TextComponent(
                    "[ERROR] Usage: /trigger kothEnableArena set <arenaID>",
                    color: Color.Red,
                  ),
                ],
              ),
            ],
          ),
          Execute(
            as: Entity(tags: ["kothArena"]),
            If: Condition.score(
              Score.fromSelected("kothArenaID").isEqual(
                Score(
                  Entity.All(
                    tags: ["kothEnableArena"],
                    limit: 1,
                  ),
                  "kothEnableArena",
                ),
              ),
            ),
            children: [
              Entity.Self().addTag("kothEnableNow"),
              If(
                Condition.score(
                  Score.fromSelected("kothHeight").matches(1000),
                ),
                then: [
                  Tellraw(
                    Entity.All(
                      tags: ["kothEnableArena"],
                    ),
                    show: [
                      TextComponent(
                        "KOTH > ",
                        color: Color.Gold,
                      ),
                      TextComponent(
                        "[ERROR] Please set first the height with /trigger kothSetHeight",
                        color: Color.Red,
                      ),
                    ],
                  ),
                ],
                orElse: [
                  Score(Entity(tags: ["kothEnableNow"]), "inEditMode").set(0),
                  Tellraw(
                    Entity.All(
                      tags: ["kothEnableArena"],
                    ),
                    show: [
                      TextComponent("KOTH > ", color: Color.Gold),
                      TextComponent("Enabled arena ", color: Color.Green),
                      TextComponent("#", color: Color.DarkGreen),
                      TextComponent.score(
                        Score(Entity(tags: ["kothEnableNow"]), "kothArenaID"),
                        color: Color.DarkGreen,
                      ),
                    ],
                  ),
                ],
              ),
              Entity.Self().removeTag("kothEnableNow"),
            ],
          ),
          CmdIndex.noArenaFoundMsg(
            Entity.Self(),
            Score.fromSelected("kothArenaID"),
            Score(
              Entity.All(
                tags: ["kothEnableArena"],
                limit: 1,
              ),
              "kothEnableArena",
            ),
          ),
          Entity.Self().removeTag("kothEnableArena"),
        ],
      ),
    ]);
  }
}
