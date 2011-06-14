
data Location =
		  Home
		| Friend'sYard
		| Garden
		| OtherRoom
	deriving (Eq, Show, Read)

data Direction =
			  North
			| South
			| West
			| East
	deriving (Eq, Show, Read)

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
    deriving (Eq, Show, Read)

describeLocation :: Location -> String
describeLocation loc = show loc ++ "\n" ++
		case loc of
            Home         -> "You are standing in the middle room at the wooden table."
            Friend'sYard -> "You are standing in the front of the night garden behind the small wooden fence."
            Garden       -> "You are in the garden. Garden looks very well: clean, tonsured, cool and wet."
            otherwise    -> "No description available for location with name " ++ show loc ++ "."


-- Обрабатываем действие.
evalAction :: Action -> String
evalAction act = "Action: " ++ show act ++ "!"

-- Преобразовываем строку в Action
convertStringToAction :: String -> Action
convertStringToAction str = read str

-- Получем ввод с клавиатуры, конвертируем его в действие, вызываем обработчик, выводим результат.
run = do
		putStr "Enter command: "
		x <- getLine
		putStrLn ( evalAction (convertStringToAction x) )
