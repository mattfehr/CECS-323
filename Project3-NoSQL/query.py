from pymongo import MongoClient
from pprint import pprint # for "pretty printing"
from bson import ObjectId

def connect():
    CONNECTION_STRING = "mongodb://localhost:27017"
    client = MongoClient(CONNECTION_STRING)
    # name of the database created in Mongo 
    return client['project3']

if __name__ == "__main__":
    db = connect()

    # get input of order ID
    order_id = input("Enter the Order ID: ")

    pipeline = [
        {
            # first finding the right order by matching to an existing orderID
            "$match": {
                "_id": ObjectId(order_id)
            }
        },
        {
            # each pizza becomes a doc, so each pizza is treated individually
            "$unwind": {"path": "$pizzas"}
        },
        {
            # from each pizza, each topping becomes a doc so each topping is treated individually
            "$unwind": {"path": "$pizzas.toppings"}
        },
        {
            # joining toppings and ingredients using a topping name (local: pizzas.toppings.ingredient) paired with a ingredient name (foreign: name)
            "$lookup": {
                "from": "ingredients",
                "localField": "pizzas.toppings.ingredient",
                "foreignField": "name",
                "as": "ingredientInfo"
            }
        },
        {
            # unwinding so each ingredient can be treated individually and we can access its fields
            "$unwind": {"path": "$ingredientInfo"}
        },
        {
            "$project": {
                # finding ingredient cost based on size (1.5x multiplier if pizza bigger than small)
                "ingredientCost": {
                    "$cond": {
                        "if": { "$ne": ["$pizzas.size", "small"] },
                        "then": { "$multiply": ["$ingredientInfo.price", 1.5] },
                        "else": "$ingredientInfo.price"
                    }
                }
            }
        },
        {
            # finally group all topping documents by its order id number to use sum aggregate func to sum all ingredient costs
            "$group": {
                "_id": "$_id",
                "totalCost": { "$sum": "$ingredientCost"}
            }
        }
    ]

    # Run the pipeline.
    results = db["orders"].aggregate(pipeline)
    # Pretty-print the results.
    pprint(list(results))
