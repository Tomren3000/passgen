import System.Environment
import System.Exit

main :: IO ()
main = getArgs >>= parseArgs

parseArgs :: [String] -> IO ()
parseArgs ("-l":n:[]) = putStrLn (generatePassword (read n :: Int)) >> exitSuccess
parseArgs ["-v"] = putStrLn version >> exitSuccess
parseArgs ["--version"] = putStrLn version >> exitSuccess
parseArgs _ = putStrLn help >> exitSuccess

version :: String
version = "passgen version 0.0.1"

help :: String
help = "passgen usage:\n" ++
       " -l n length of password\n" ++
       " -v | --version program version\n" ++
       " -h this help\n" ++
       "Example: passgen -l 10"

generatePassword :: Int -> String
generatePassword n = "Length of password is " ++ show n
