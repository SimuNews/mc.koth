part of koth;

class UpdateArena extends Widget {
  @override
  generate(Context context) {
    return For.of([
      Execute(
        as: Entity(tags: ["kothIsRunningArena"]),
        children: [
          Entity.Self().addTag("kothProcessArenaInRunningGame"),
          Execute(
            as: Entity(tags: ["kothArena"]),
            If: Condition.score(
              Score.fromSelected("kothArenaID").isEqual(
                Score(
                  Entity(
                    tags: ["kothProcessArenaInRunningGame"],
                    limit: 1,
                  ),
                  "kothInArena",
                ),
              ),
            ),
            children: [
              updateCountdown(Entity(tags: ["kothProcessArenaInRunningGame"])),
            ],
          ),
          Entity.Self().removeTag("kothProcessArenaInRunningGame"),
        ],
      ),
    ]);
  }

  Widget updateCountdown(Entity e) {
    return For.of([
      
    ]);
  }

}
