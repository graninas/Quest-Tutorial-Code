
data Location = Home
		| Friend'sYard
		| Garden
		| OtherRoom
	deriving (Eq, Show, Read)

data Direction = North | South | West | East

data Action = Look | Go | Inventory | Take | Drop | Investigate | Quit | Save | Load | New
		
describeLocation :: Location -> String
describeLocation loc = case loc of
            Home -> "You are standing in the middle room at the wooden table."
            Friend'sYard -> "You are standing in the front of the night garden behind the small wooden fence."
            Garden -> "You are in the garden. Garden looks very well: clean, tonsured, cool and wet."
            otherwise -> "Unknown location."
			
			
data ArithmOperation = 
	Plus Integer Integer
	| Minus Integer Integer
	| Prod Integer Integer
	
evalOp :: ArithmOperation -> Integer
evalOp op = case op of
				Plus x y -> x + y
				Minus x y -> x - y
				Prod x y -> x * y


data IntegerList =
				Empty
				| Value Integer IntegerList
				
