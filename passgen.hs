import System.Environment

main = getArgs >>= parseArgs

help :: IO ()
help = putStrLn "Denne tekst hjælper dig"

parseArgs :: [String] -> IO ()
parseArgs ("-l":a:[]) = putStrLn a
parseArgs [] = help
parseArgs ["-h"] = help
parseArgs ["--help"] = help
parseArgs ["-v"] = version
parseArgs ["--version"] = version
parseArgs [a] = help
parseArgs (a:as) = help

version :: IO ()
version = putStrLn "passgen version 0.0.1\nCopyright (C) 2015 Trine Løcke"

