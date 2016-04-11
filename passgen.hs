import System.Environment
import System.Exit
import System.Random

main :: IO ()
main = getArgs >>= parseArgs

parseArgs :: [String] -> IO ()
parseArgs ("-l":n:[]) = putStrLn (generatePassword (read n :: Int)) >> exitSuccess
parseArgs ["-v"] = putStrLn version >> exitSuccess
parseArgs ["--version"] = putStrLn version >> exitSuccess
parseArgs ["-h"] = putStrLn help >> exitSuccess
parseArgs ["--help"] = putStrLn help >> exitSuccess
parseArgs _ = putStrLn help >> exitFailure

version :: String
version = "passgen version 0.0.1"

help :: String
help = "passgen usage:\n" ++
       " -l n length of password\n" ++
       " -v | --version program version\n" ++
       " -h | --help this help\n" ++
        "Example: passgen -l 10"

generatePassword :: Int -> String
generatePassword n = "Length of password is " ++ show n

--let Foo = (!!) validChars
--fmap foo rollDice

generatePassword' :: Int -> String -> String
generatePassword' n s
  | n < 1 = s
  | otherwise = generatePassword' (n - 1) ((:) 'a' s)

rollDice :: IO Int
rollDice = getStdRandom (randomR (0,length validChars - 1))

validChars :: String
validChars = "abcdefghjkmnpqrstuvxyz"



validInput :: String -> Bool
validInput s = case reads s :: [(Int,String)] of
  [(n,"")] -> True
  _ -> False
