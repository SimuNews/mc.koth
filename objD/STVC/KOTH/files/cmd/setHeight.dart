part of koth;

class SetHeight extends Widget {
  @override
  generate(Context context) {
    return For.of([
      Scoreboard("kothHeight"),
      CustomCommand(
        "SetHeight",
        "build",
        from: 0,
        to: -1,
        children: [
          Entity.Self().addTag("kothSetHeight"),
          If(
            Condition.score(
              Score.fromSelected(
                "kothSetHeight",
              ).matches(0),
            ),
            then: [
              Tellraw(
                Entity.Self(),
                show: [
                  TextComponent("KOTH > ", color: Color.Gold),
                  TextComponent(
                      "[ERROR] Usage: /trigger kothSetHeight set <arenaID>",
                      color: Color.Red),
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
                    tags: ["kothSetHeight"],
                    limit: 1,
                  ),
                  "kothSetHeight",
                ),
              ),
            ),
            children: [
              If(
                Condition.score(
                  Score.fromSelected(
                    "inEditMode",
                  ).matches(1),
                ),
                assignTag: Entity.Self(),
                then: [
                  Score.fromSelected("kothHeight").setToData(
                    Data.get(
                      Entity.All(
                        tags: ["kothSetHeight"],
                        limit: 1,
                      ),
                      path: "Pos[1]",
                    ),
                  ),
                  Tellraw(
                    Entity.All(
                      tags: ["kothSetHeight"],
                    ),
                    show: [
                      TextComponent("KOTH > ", color: Color.Gold),
                      TextComponent("Set height for arena ",
                          color: Color.Green),
                      TextComponent("#", color: Color.DarkGreen),
                      TextComponent.score(
                        Score.fromSelected("kothArenaID"),
                        color: Color.DarkGreen,
                      ),
                      TextComponent(" to ", color: Color.DarkGreen),
                      TextComponent.score(
                        Score.fromSelected("kothHeight"),
                        color: Color.DarkGreen,
                      ),
                    ],
                  ),
                ],
                orElse: [
                  Tellraw(
                    Entity.All(
                      tags: ["kothSetHeight"],
                    ),
                    show: [
                      TextComponent("KOTH > ", color: Color.Gold),
                      TextComponent(
                        "[ERROR] Please disable this arena first!",
                        color: Color.Red,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          CmdIndex.noArenaFoundMsg(
            Entity.Self(),
            Score.fromSelected("kothArenaID"),
            Score(
              Entity.All(
                tags: ["kothSetHeight"],
                limit: 1,
              ),
              "kothSetHeight",
            ),
          ),
          Entity.Self().removeTag("kothSetHeight"),
        ],
      ),
    ]);
  }
}
