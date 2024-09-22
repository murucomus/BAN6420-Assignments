import pandas as pd
from pymongo import MongoClient

class User:
    def __init__(self, age, gender, total_income, expenses):
        self.age = age
        self.gender = gender
        self.total_income = total_income
        self.expenses = expenses

    @classmethod
    def from_mongo(cls):
        client = MongoClient('mongodb://localhost:27017/')
        db = client['user_data']
        users = db.users.find()
        user_data = []
        for user in users:
            user_data.append({
                'age': user['age'],
                'gender': user['gender'],
                'total_income': user['total_income'],
                **user['expenses']  # Unpacking expenses directly into the dictionary
            })
        return user_data

    @staticmethod
    def save_to_csv(data, filename='user_data.csv'):
        df = pd.DataFrame(data)
        df.to_csv(filename, index=False)

if __name__ == '__main__':
    user_data = User.from_mongo()
    User.save_to_csv(user_data)
