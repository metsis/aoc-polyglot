 # aoc-polyglot

 > a haskell-based language calendar generator for advent of code

## description

  *inputs*
  `languagesWithWeights` = your desired languages with weights

  *outputs*
  `calendar` = a calendar that has randomly picked languages for each day,
  meaning you have to solve that day's puzzle in that language


## usage

  1. clone the repo
  2. set your desired languages with weights in `generator.hs`
  3. run `cabal run` to generate the calendar
  4. the calendar will be found in `calendar.txt`
