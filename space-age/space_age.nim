import tables, math

const earthYearInSeconds = 31557600.0

const yearLengthOfPlanet = {
  "Mercury": 0.2408467,
  "Venus": 0.61519726,
  "Earth": 1.0,
  "Mars": 1.8808158,
  "Jupiter": 11.862615,
  "Saturn": 29.447498,
  "Uranus": 84.016846,
  "Neptune": 164.79132,
}.toTable

proc age*(planet: string, seconds: Natural): float =
  let exact = seconds.float / (yearLengthOfPlanet[planet] * earthYearInSeconds)
  exact.round(2)
