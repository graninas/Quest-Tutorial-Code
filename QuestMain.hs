
describeLocation :: String -> String
describeLocation locName = case locName of
            "Home" -> "You are standing in the middle room at the wooden table."
            "Friend's home" -> "You are standing in the front of the night garden behind the small wooden fence."
            otherwise -> "Unknown location."