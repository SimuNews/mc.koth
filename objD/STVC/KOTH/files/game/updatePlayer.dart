part of koth;

class UpdatePlayer extends Widget {
  @override
  generate(Context context) {
    return For.of([
      Execute(
        as: Entity.All(tags: ["kothInRunningGame"]),
        children: [
          Entity.Self().addTag("kothProcessUserInRunningGame"),
          Execute(
            as: Entity(tags: ["kothArena"]),
            If: Condition.score(
              Score.fromSelected("kothArenaID").isEqual(
                Score(
                  Entity.All(
                    tags: ["kothProcessUserInRunningGame"],
                    limit: 1,
                  ),
                  "kothInArena",
                ),
              ),
            ),
            children: [
              updateHeightAndPoints(
                Entity.All(tags: ["kothProcessUserInRunningGame"], limit: 1),
              ),
              showStartInTitle(
                Entity.All(tags: ["kothProcessUserInRunningGame"], limit: 1),
              ),
            ],
          ),
          Entity.Self().removeTag("kothProcessUserInRunningGame"),
        ],
      ),
    ]);
  }

  Widget updateHeightAndPoints(Entity e) {
    return For.of([
      Score(e, "kothHeight").setToData(Data.get(e, path: "Pos[1]")),
      If(
        Condition.score(
          Score.fromSelected(
            "kothHeight",
          ).isSmallerOrEqual(
            Score(
              e,
              "kothHeight",
            ),
          ),
        ),
        then: [
          Score(e, "ticks").add(1),
          If(
            Condition.score(
              Score(e, "ticks").matchesRange(
                Range.from(20),
              ),
            ),
            then: [
              Score(e, "kothPoints").add(1),
              Score(e, "ticks").set(0),
            ],
          ),
        ],
      ),
    ]);
  }

  Widget showStartInTitle(Entity e) {
    return For.of([
      // 10 sec to start
      Execute(
        If: Condition.and(
          [
            Score.fromSelected("seconds").matches(10),
            Score.fromSelected("minutes").matches(3)
          ],
        ),
        children: [
          Title(
            e,
            show: [
              TextComponent("Start in 10..."),
            ],
          ),
        ],
      ),

      // 5
      Execute(
        If: Condition.and(
          [
            Score.fromSelected("seconds").matches(5),
            Score.fromSelected("minutes").matches(3)
          ],
        ),
        children: [
          Title(
            e,
            show: [
              TextComponent("Start in 5..."),
            ],
          ),
        ],
      ),

      //Fight
      Execute(
        If: Condition.and(
          [
            Score.fromSelected("seconds").matches(0),
            Score.fromSelected("minutes").matches(3)
          ],
        ),
        children: [
          Title(
            e,
            show: [
              TextComponent("Fight..."),
            ],
          ),
        ],
      ),

      Title.actionbar(
        Entity.All(),
        show: [
          TextComponent.score(
            Score(
              Entity(
                tags: ["kothArena", "kothIsRunningArena"],
                limit: 1,
              ),
              "minutes",
            ),
          ),
          TextComponent(":"),
          TextComponent.score(
            Score(
              Entity(
                tags: ["kothArena", "kothIsRunningArena"],
                limit: 1,
              ),
              "seconds",
            ),
          ),
        ],
      ),
    ]);
  }
}
