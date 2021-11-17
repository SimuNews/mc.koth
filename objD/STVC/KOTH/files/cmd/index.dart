part of koth;

class CmdIndex extends Widget {
  @override
  generate(Context context) {
    return For.of([
      MCFunction("cmd/create"),
      MCFunction("cmd/height"),
      MCFunction("cmd/enable"),
      MCFunction("cmd/list"),
    ]);
  }

  static Widget noArenaFoundMsg(Entity e, Score s1, Score s2) {
    return For.of([
      Execute(
        as: Entity(tags: ["kothArena"]),
        If: Condition.score(
          s1.isEqual(s2),
        ),
        children: [
          Entity.Player().addTag("kothArenaFound"),
        ],
      ),
      If(
        Condition.and(
          [
            Condition.not(
              Tag(
                "kothArenaFound",
                entity: Entity.Player(),
              ),
            ),
            Condition.score(
              s2.matchesRange(Range.from(1)),
            ),
          ],
        ),
        then: [
          Tellraw(
            e,
            show: [
              TextComponent("KOTH > ", color: Color.Gold),
              TextComponent("[ERROR] Arena ", color: Color.Red),
              TextComponent("#", color: Color.DarkRed),
              TextComponent.score(
                s2,
                color: Color.DarkRed,
              ),
              TextComponent(" not found!", color: Color.Red),
            ],
          ),
        ],
      ),
      Entity.Player().removeTag("kothArenaFound"),
    ]);
  }

  static Widget setScoreToHighest() {
    return For.of([
      IndexedEntity.getScore("kothArenaID").setToBiggest(
        Score(
          Entity(tags: ["kothArena"]),
          "kothArenaID",
        ),
      ),
    ]);
  }
}
