from flask import Flask, render_template, request, redirect, url_for
from pymongo import MongoClient

app = Flask(__name__)

# Setup MongoDB- connect to AWS EC2 instance via the instance's public dns
#client = MongoClient('mongodb://localhost:27017/')
client = MongoClient('mongodb://ec2-54-198-162-4.compute-1.amazonaws.com:27017/')

db = client['user_data']

@app.route('/')
def home():
    return render_template('index.html')

@app.route('/submit', methods=['POST'])
def submit():
    age = request.form['age']
    gender = request.form['gender']
    total_income = request.form['total_income']
    
    expenses = {
        'utilities': request.form.get('utilities_amount', 0),
        'entertainment': request.form.get('entertainment_amount', 0),
        'school_fees': request.form.get('school_fees_amount', 0),
        'shopping': request.form.get('shopping_amount', 0),
        'healthcare': request.form.get('healthcare_amount', 0)
    }

    db.users.insert_one({
        'age': age,
        'gender': gender,
        'total_income': total_income,
        'expenses': expenses
    })
    return redirect(url_for('home'))

if __name__ == '__main__':
    app.run(debug=True)
