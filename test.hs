module Main where

fibs = 0 : 1 : zipWith (+) fibs (tail fibs)

run cnt = do
		putStrLn ("Turns count: " ++ show cnt)
		putStrLn $ show $ last $ take cnt fibs
		run (cnt + 1)

main = do
	run 1