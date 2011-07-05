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

isVisible :: Object -> [Object] -> Bool
isVisible obj objects = obj `elem` objects

locationObjects :: Location -> [Object]
locationObjects Home = [Umbrella, Drawer, Phone, Table]
locationObjects _    = []

describeObject :: Object -> String
describeObject Umbrella = "Nice red mechanic Umbrella."
describeObject Table    = "Good wooden table with drawer."
describeObject Phone    = "The Phone has some voice messages for you."
describeObject MailBox  = "The MailBox is closed."
describeObject obj      = "There is nothing special about " ++ show obj

enumerateObjects :: [Object] -> String
enumerateObjects [] = ""
enumerateObjects objects = "\n  There are some objects here: " ++ show objects

-- Обрабатываем действие.
evalAction :: Action -> String
evalAction act = "Action: " ++ show act ++ "!"

-- Преобразовываем строку в Action
convertStringToAction :: String -> Action
convertStringToAction str = read str

-- Получаем ввод с клавиатуры, конвертируем его в действие, вызываем обработчик, выводим результат.
run curLoc = do
		let locObjects = locationObjects curLoc
		let locDescr = describeLocation curLoc
		let objectsDescr = enumerateObjects locObjects
		let fullDescr = locDescr ++ objectsDescr
		putStrLn fullDescr
		putStr "Enter command: "
		x <- getLine
		case (convertStringToAction x) of
			Investigate obj -> do
								if (isVisible obj locObjects)
									then putStrLn (describeObject obj)
									else putStrLn ("You don't see any " ++ show obj ++ " here.")
								run curLoc
			Quit          -> putStrLn "Be seen you..."
			Look          -> do
								putStrLn fullDescr
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