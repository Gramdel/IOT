db.createCollection("users", {
	validator: {
		$jsonSchema: {
            "bsonType": "object",
            "required": ["firstname", "lastname", "age", "email"],
            "properties": {
                "firstname": {
					"bsonType": "string",
					"description": "firstname(string) required"
				},
				"lastname": {
					"bsonType": "string",
					"description": "lastname(string) required"
				},
				"age": {
					"bsonType": "number",
					"description": "age(number) required"
				},
				"email": {
					"bsonType": "string",
					"description": "email(string) required"
				}
            }
        }
	}
});