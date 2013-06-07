-- Playing with examples from the school of Haskell (https://www.fpcomplete.com/school/)

import System.IO

hEchoLine :: Handle -> IO String
hEchoLine h = do
    s <- hGetLine h
    hPutStr h ("I just read that " ++ s)
    return s
        
main = do
    h <- openFile "test.txt" ReadWriteMode
    str <- hEchoLine h
    hClose h
    str1 <- readFile "test.txt"
    hPutStr stdout str1

