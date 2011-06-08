
data Location =
		  Home
		| Friend'sYard
		| Garden
		| OtherRoom
	deriving (Eq)

data Direction =
			  North
			| South
			| West
			| East
	deriving (Eq)

data Action = Look | Go | Inventory | Take | Drop | Investigate | Quit | Save | Load | New
    deriving (Eq)
		
describeLocation :: Location -> String
describeLocation loc = case loc of
            Home         -> "You are standing in the middle room at the wooden table."
            Friend'sYard -> "You are standing in the front of the night garden behind the small wooden fence."
            Garden       -> "You are in the garden. Garden looks very well: clean, tonsured, cool and wet."
            otherwise    -> "Unknown location."
