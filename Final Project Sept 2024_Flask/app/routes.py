from flask import Blueprint, request, redirect, url_for, render_template
from flask_pymongo import PyMongo
from flask import current_app as app

main = Blueprint('main', __name__)

@main.route('/')
def index():
    return render_template('form.html')

@main.route('/submit', methods=['POST'])
def submit():
    name = request.form['name']
    age = request.form['age']
    gender = request.form['gender']
    total_income = request.form['total_income']
    utilities = request.form.get('utilities') == 'on'
    utilities_amount = request.form['utilities_amount'] if utilities else 0
    entertainment = request.form.get('entertainment') == 'on'
    entertainment_amount = request.form['entertainment_amount'] if entertainment else 0
    school_fees = request.form.get('school_fees') == 'on'
    school_fees_amount = request.form['school_fees_amount'] if school_fees else 0
    shopping = request.form.get('shopping') == 'on'
    shopping_amount = request.form['shopping_amount'] if shopping else 0
    healthcare = request.form.get('healthcare') == 'on'
    healthcare_amount = request.form['healthcare_amount'] if healthcare else 0

    form_data = {
        'name': name,
        'age': age,
        'gender': gender,
        'total_income': total_income,
        'expenses': {
            'utilities': utilities_amount,
            'entertainment': entertainment_amount,
            'school_fees': school_fees_amount,
            'shopping': shopping_amount,
            'healthcare': healthcare_amount
        }
    }
    # Insert the data into the 'form' collection
    mongo.db.form.insert_one(form_data)
    
    return redirect(url_for('main.index'))
