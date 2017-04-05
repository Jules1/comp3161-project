from flask import Flask, url_for, redirect, render_template, request
from flask.ext.sqlalchemy import SQLAlchemy

from flask.ext import superadmin, login, wtf
from flask.ext.superadmin.contrib import sqlamodel
from wtforms.fields import TextField, PasswordField
from wtforms.validators import Required, ValidationError

app = Flask(__name__)

app.config['SECRET_KEY'] = 'fruiewgh'

app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///test.sqlite'
app.config['SQLALCHEMY_ECHO'] = True
db = SQLAlchemy(app)
# Defining the login and registration forms for flask-login
class LoginForm(wtf.Form):
    username = TextField(validators=[Required()])
    password = PasswordField(validators=[Required()])
    
    def validate_login(self,field):
        user = self.get_user()
        
        if user is None:
            raise ValidationError('Invalid User')
            
        if user.password != self.password.data:
            raise ValidationError('Invalid Password')
    
    def get_user(self):
        return db.session.query(User).filter_by(username=selfusername.data).first()
        
class RegistrationForm(wtf.Form):
    username = TextField(validators=[Required()])
    password = PasswordField(validators=[Required()])

    def validate_login(self, field):
        if db.session.query(User).filter_by(login=self.login.data).count() > 0:
            raise ValidationError('Duplicate username')

def init_login():
    login_manager = login.LoginManager()
    login_managersetup_app(app)
    
    @login_manager.user_loader
    def load_user(user_id):
        return db.session.query(User).get(user_id)
        
# Create customized model view class
class MyModelView(sqlamodel.ModelView):
    def is_accessible(self):
        return login.current_user.is_authenticated()


# Create customized index view class
class MyAdminIndexView(superadmin.AdminIndexView):
    def is_accessible(self):
        return login.current_user.is_authenticated()

#Flask Views

@app.route('/')
def index():
    return render_template('index.html', user=login.current_user)
    
@app.route('/login/', methods=('GET', 'POST'))
def login_view():
    form = LoginForm(request.form)
    if form.validate_on_submit():
        user = form.get_user()
        login.login_user(user)
        return redirect(url_for('index'))
    
    return render_template('form.html', form=form)
    
@app.route('/register/', methods=('GET', 'POST'))
def register_view():
    form = RegistrationForm(request.form)
    if form.validate_on_submit():
        user = User()

        form.populate_obj(user)

        db.session.add(user)
        db.session.commit()

        login.login_user(user)
        return redirect(url_for('index'))

    return render_template('form.html', form=form)


@app.route('/logout/')
def logout_view():
    login.logout_user()
    return redirect(url_for('index'))    
    
    
    
    
    