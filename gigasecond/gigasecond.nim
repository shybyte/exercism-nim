import times

proc addGigasecond*(d: DateTime): DateTime =
  d + initInterval(seconds = 1_000_000_000)