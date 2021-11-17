part of koth;

/// Countdown should be 3 minutes
class Timer extends Widget {
  @override
  generate(Context context) {
    return For.of([
      Scoreboard("seconds"),
      Scoreboard("minutes"),
      Execute.as(
        Entity(
          tags: ["kothArena", "kothIsRunningArena"],
        ),
        children: [
          Score.fromSelected("ticks").add(1),
          If(
            Condition.score(
              Score.fromSelected("ticks").matchesRange(Range.from(20)),
            ),
            then: [
              // Remove a second
              Score.fromSelected("seconds").add(1),
              Score.fromSelected("ticks").set(0),
            ],
          ),
          If(
            Condition.score(
              Score.fromSelected("seconds").matchesRange(Range.from(60)),
            ),
            then: [
              // Remove a minute
              Score.fromSelected("minutes").add(1),
              Score.fromSelected("seconds").set(0),
            ],
          ),
        ],
      ),
    ]);
  }
}
