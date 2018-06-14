proc convert*(x: Natural): string =
  var raindrops = ""
  
  proc appendIfFactor(factor: Natural, drop: string) =
    if x mod factor == 0:
      raindrops &= drop

  appendIfFactor(3, "Pling")
  appendIfFactor(5, "Plang")
  appendIfFactor(7, "Plong")

  if raindrops == "":
    $x
  else:
    raindrops