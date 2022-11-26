import System.Random
import Data.List

-- starting data
days = [1..25] -- aoc runs Dec 1st-25th
languagesWithWeights = [ -- add languages with desired weights (can be any number)
  ("haskell", 8),
  ("python", 3),
  ("c", 5),
  ("c++", 4),
  ("rust", 10),
  ("go", 10),
  ("javascript", 2),
  ("julia", 1),
  ("java", 1),
  ("scala", 1),
  ("cobol", 2)
  ]

shuffle :: [a] -> IO [a]
shuffle [] = return []
shuffle xs = do randomPosition <- getStdRandom(randomR (0, length xs - 1))
                let (left, (a:right)) = splitAt randomPosition xs
                fmap (a:) (shuffle (left++right))

getLanguagesWithDays lw = do
  let weightSum = sum[x | (_,x) <- lw]
  let daysCount = length days
  let daysPerLanguage = [(l, round (fromIntegral w / fromIntegral weightSum * fromIntegral daysCount)) | (l, w) <- lw]
  let spreadLanguages = concat [[l | x <- [1..d]] | (l, d) <- daysPerLanguage]
  sl <- shuffle spreadLanguages
  sd <- shuffle days
  let d = zip sl sd
  return $ sortBy (\(_,a) (_,b) -> compare a b) d

main = do
  r <- getLanguagesWithDays languagesWithWeights
  putStrLn $ "\n      ~~~~~ Your AoC calendar ~~~~~    \n"
  mapM_ (\(l, d) -> putStrLn $ "Day " ++ show d ++ ": " ++ l) r
  putStrLn $ "\n      ~~~~~ Have fun! ~~~~~    \n"
