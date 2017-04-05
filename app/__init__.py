from flask import flask
from flask.ext.sqlalchemy import sqlalchemy

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///tmp/action.db'
db = SQLAlchemy(app)
from app import views