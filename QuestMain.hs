module Main where

import Types

describeLocation :: Location -> String
describeLocation loc = show loc ++ "\n" ++
		case loc of
            Home         -> "You are standing in the middle room at the wooden table."
            Friend'sYard -> "You are standing in the front of the night garden behind the small wooden fence."
            Garden       -> "You are in the garden. Garden looks very well: clean, tonsured, cool and wet."
            otherwise    -> "No description available for location with name " ++ show loc ++ "."


walk :: Location -> Direction -> Location
walk Home North         = Garden
walk Home South         = Friend'sYard
walk Garden North       = Friend'sYard
walk Garden South       = Home
walk Friend'sYard North = Home
walk Friend'sYard South = Garden
walk curLoc _           = curLoc

locationObjects :: Location -> [Object]
locationObjects Home = [Umbrella, Drawer, Phone]
locationObjects _    = []

describeObject :: Object -> String
describeObject Umbrella = "Nice red mechanic Umbrella."
describeObject Table    = "Good wooden table with drawer."
describeObject Phone    = "The Phone has some voice messages for you."
describeObject obj      = "There is nothing special about " ++ show obj

describeLocationObjects :: Location -> String
describeLocationObjects loc = let 
								describeLocationObjects' [] = ""
								describeLocationObjects' (o:os) = "\n" ++ describeObject o ++ describeLocationObjects' os
							  in
									describeLocationObjects' (locationObjects loc)

enumerateObjects :: [Object] -> String
enumerateObjects [] = ""
enumerateObjects objects = "\n  There are some objects here: [" ++ enumerateObjects' objects
	where
		enumerateObjects' (o:[]) = show o ++ "]"
		enumerateObjects' (o:os) = show o ++ ", " ++ enumerateObjects' os
									
-- Обрабатываем действие.
evalAction :: Action -> String
evalAction act = "Action: " ++ show act ++ "!"

-- Преобразовываем строку в Action
convertStringToAction :: String -> Action
convertStringToAction str = read str

-- Получаем ввод с клавиатуры, конвертируем его в действие, вызываем обработчик, выводим результат.
run curLoc = do
		let locDescr = describeLocation curLoc
		let objEnum  = enumerateObjects (locationObjects curLoc)
		let locAndObjDescr = locDescr ++ objEnum
		putStrLn locAndObjDescr
		putStr "Enter command: "
		x <- getLine
		case (convertStringToAction x) of
			Quit          -> putStrLn "Be seen you..."
			Look          -> do
								putStrLn locAndObjDescr
								run curLoc
			Go dir        -> do
								putStrLn ("\nYou walking to " ++ show dir ++ ".\n")
								run (walk curLoc dir)
			convertResult -> do
								putStrLn (evalAction convertResult)
								putStrLn "End of turn.\n"
								run curLoc

main = do
	putStrLn "Quest adventure on Haskell.\n"
	run Home