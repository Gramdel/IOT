db.createCollection("users", {
	validator: {
		$jsonSchema: {
            "bsonType": "object",
            "required": ["_id", "firstname", "lastname", "age", "email"],
            "properties": {
				"id": {
					"bsonType": "number",
					"description": "_id(number) required"
				},
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