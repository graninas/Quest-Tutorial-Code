
data Location =
		  Home
		| Friend'sYard
		| Garden
		| OtherRoom
	deriving (Eq, Show)

data Direction =
			  North
			| South
			| West
			| East
	deriving (Eq, Show)

data Action =
		  Look
		| Go
		| Inventory
		| Take
		| Drop
		| Investigate
		| Quit 
		| Save 
		| Load 
		| New
    deriving (Eq, Show)

describeLocation :: Location -> String
describeLocation loc = show loc ++ "\n" ++
		case loc of
            Home         -> "You are standing in the middle room at the wooden table."
            Friend'sYard -> "You are standing in the front of the night garden behind the small wooden fence."
            Garden       -> "You are in the garden. Garden looks very well: clean, tonsured, cool and wet."
            otherwise    -> "No description available for location with name " ++ show loc ++ "."

-- Обрабатываем действие.
evalAction :: Action -> String
evalAction act = case act of
			Look -> "Action: Look!"
			otherwise -> "Action does not supported yet."

-- Преобразуем строку в Action
convertStringToAction :: String -> Action
convertStringToAction str = case str of
		"Look"    -> Look
		otherwise -> Quit

-- Получем ввод с клавиатуры, конвертируем его в действие, вызываем обработчик, выводим результат.
run = do
		putStr "Enter command: "
		x <- getLine
		putStrLn ( evalAction (convertStringToAction x) )