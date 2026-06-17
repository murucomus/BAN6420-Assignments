from flask import Flask
from flask_pymongo import PyMongo

def create_app():
    app = Flask(__name__)
    app.config["MONGO_URI"] = "mongodb://localhost:27017/nexford"
    mongo = PyMongo(app)

    with app.app_context():
        from .routes import main
        app.register_blueprint(main)

    return app
