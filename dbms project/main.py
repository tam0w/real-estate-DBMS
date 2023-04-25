from flask import Flask,render_template,request,session,redirect,url_for,flash
from flask_sqlalchemy import SQLAlchemy
from flask_login import UserMixin
from flask_login import login_user,logout_user,login_manager,LoginManager
from flask_login import login_required,current_user
import random


local_server= True
app = Flask(__name__)
app.secret_key='tamimnadheef'

# connection to the MYSQL database
app.config['SQLALCHEMY_DATABASE_URI']='mysql://root:@localhost/rms'
db = SQLAlchemy(app)

login_manager = LoginManager(app)
login_manager.login_view = 'signin'

@login_manager.user_loader
def load_user(id):
    return Accounts.query.get(id)

class Owner(db.Model):
    O_ID = db.Column(db.Integer, db.ForeignKey('accounts.id'), primary_key=True)
    O_NAME = db.Column(db.String(20))
    O_PHNO = db.Column(db.String(20))
    O_ADDRESS = db.Column(db.String(20))



class Clients(db.Model):
    C_ID = db.Column(db.Integer, db.ForeignKey('accounts.id'), primary_key=True)
    C_NAME = db.Column(db.String(20))
    C_PHNO = db.Column(db.String(20),unique=True)
    C_EMAIL = db.Column(db.String(20),unique=True)
    C_AGE = db.Column(db.Integer)
    C_ADDRESS = db.Column(db.String(20))

class Property(db.Model):
    P_ID = db.Column(db.Integer, primary_key=True)
    P_NAME = db.Column(db.String(20))
    P_LOC = db.Column(db.String(20))
    P_TYPE = db.Column(db.String(20))
    P_BHK = db.Column(db.Integer, nullable=True)
    P_SQFT = db.Column(db.Integer)
    A_ID = db.Column(db.Integer, db.ForeignKey('agents.A_ID'), primary_key=True)
    O_ID = db.Column(db.Integer, db.ForeignKey('owner.O_ID'), primary_key=True)

class Agents(db.Model):
    A_ID = db.Column(db.Integer, db.ForeignKey('accounts.id'), primary_key=True)
    A_NAME = db.Column(db.String(20))
    A_PHNO = db.Column(db.String(20))
    A_ADDRESS = db.Column(db.String(20))

class Buys(db.Model):
    C_ID = db.Column(db.Integer, db.ForeignKey('clients.c_id'), primary_key=True)
    P_ID = db.Column(db.Integer, db.ForeignKey('property.p_id'), primary_key=True)
    P_NAME = db.Column(db.String(20), db.ForeignKey('property.p_name'))
    Total_Amount = db.Column(db.Integer, nullable= False)

class Listings(db.Model):
    P_ID = db.Column(db.Integer, db.ForeignKey('property.P_ID'), primary_key=True)
    A_ID = db.Column(db.Integer, db.ForeignKey('agents.A_ID'), primary_key=True)
    Rent_Price = db.Column(db.Integer, nullable=True)
    Sales_Price = db.Column(db.Integer, nullable=True)
    Agreement = db.Column(db.String(20))

class Accounts(db.Model, UserMixin):
    id = db.Column(db.Integer,primary_key = True)
    email = db.Column(db.String(255), nullable = False)
    passw = db.Column(db.String(20), nullable= False)

@app.route('/')
def hello_world():
    return render_template('home.html')

@app.route("/signin", methods=["POST","GET"])
def signin():
    if request.method == "POST":
        email = request.form.get('email')
        passw = request.form.get('passw')
        emailCheck = Accounts.query.filter_by(email=email).first()
        passwCheck = emailCheck.passw
        print(emailCheck,passwCheck,email,passw)

        if (emailCheck) and passwCheck == passw:
            login_user(emailCheck)
            return redirect(url_for('hello_world'))
        else:
            print('ulta seeda kya ki likhe')
            return render_template('signin.html')

    return render_template('signin.html')

@app.route("/signup",methods=["POST","GET"])
def signup():
    if request.method == "POST":
        personname = request.form.get('name')
        email = request.form.get('email')
        passw = request.form.get('passw')
        typeacc = request.form.get('accType')
        loc = request.form.get('loc')
        age = request.form.get('age')
        phno = request.form.get('phno')
        idno = random.randint(0,1000)
        print(passw,email,personname,typeacc,age,phno,loc)
        newAccount = Accounts(id=idno,email=email,passw=passw)
        if typeacc == 'Trader':
            newOwner = Owner(O_ID=idno,O_NAME=personname,O_ADDRESS=loc,O_PHNO=phno)
            newClient = Clients(C_ID=idno,C_NAME=personname,C_ADDRESS=loc,C_PHNO=phno,C_EMAIL=email,C_AGE=age)
            db.session.add(newOwner)
            db.session.add(newClient)
        elif typeacc == 'Agent':
            newAgent = Agents(A_ID=idno,A_NAME=personname,A_ADDRESS=loc,A_PHNO=phno)
            db.session.add(newAgent)
        db.session.add(newAccount)
        db.session.commit()

    return render_template('signup.html')

@app.route('/logout',methods=["POST","GET"])
@login_required
def logout():
    if Accounts.is_authenticated:
        logout_user()
        print(current_user)
        return redirect(url_for('signin'))
    print(current_user)
    return redirect(url_for('signup'))

@app.route("/add",methods=["POST","GET"])
@login_required
def addListing():
    if not Accounts.is_authenticated:
        return redirect(url_for('signin'))
    else:

        p_id = random.randint(1, 1000)
        agent_ids = db.engine.execute(f"SELECT `A_ID` FROM `agents`;").all()
        print(agent_ids)
        tuple(agent_ids)
        print(agent_ids)
        agent = random.randint(1,4)
        if request.method == "POST":
            print(current_user.id,current_user)
            p_name = request.form.get('p_name')
            p_address = request.form.get('p_address')
            p_bhk = request.form.get('p_bhk')
            p_sqft = request.form.get('p_sqft')
            p_type = request.form.get('p_type')
            agreement = request.form.get('agreement')
            sale_p = request.form.get('sale_p')
            rent_p = request.form.get('rent_p')
            test = current_user.id
            print(p_name, p_address, p_sqft, p_bhk, p_type)
            newProp = Property(P_ID=p_id, P_NAME=p_name, P_LOC=p_address, P_BHK=p_bhk, P_SQFT=p_sqft, P_TYPE=p_type,A_ID=agent,O_ID=test)
            newList = Listings(P_ID=p_id,A_ID=agent,Agreement=agreement,Sales_Price=sale_p,Rent_Price=rent_p)
            db.session.add(newProp)
            db.session.commit()
            db.session.add(newList)
            db.session.commit()
        return render_template('add.html')


@app.route("/search",methods=['POST',"GET"])
def searchListings():
    if request.method == 'POST':
        P_SQFT = request.form.get('psqft_s')
        P_TYPE = request.form.get('ptype_s')
        P_LOC = request.form.get('ploc_s')
        P_NAME = request.form.get('pname_s')
        P_BHK = request.form.get('pbhk_s')
        O_NAME = request.form.get('oname_s')
        print(P_SQFT,P_LOC,P_NAME,P_TYPE,O_NAME,P_BHK)
        result = db.engine.execute(f"SELECT `property`.*, `agents`.`A_NAME`, `agents`.`A_PHNO`, `listings`.`Agreement`, `listings`.`Sales_Price`, `listings`.`Rent_Price` FROM `property` JOIN `agents` ON `agents`.`A_ID` = `property`.`A_ID` JOIN `listings` ON `property`.`P_ID` = `listings`.`P_ID` AND `property`.`A_ID` = `agents`.`A_ID` AND `property`.`P_BHK` <= {P_BHK} AND `property`.`P_SQFT` <= {P_SQFT} AND `property`.`P_LOC` LIKE '%%{P_LOC}%%' AND `property`.`P_NAME` LIKE '%%{P_NAME}%%' AND `property`.`P_TYPE` LIKE '%%{P_TYPE}%%';").all()
        
        return render_template('display.html',no_of=len(result),result=result)
    return render_template('search.html')


@app.route("/profile")
@login_required
def display():
    test = current_user.id
    test2 = current_user.email
    print(test)
    result = db.engine.execute(f"SELECT `agents`.`A_NAME`,`agents`.`A_PHNO`,`property`. * FROM `property` JOIN `agents` ON `agents`.`A_ID` = `property`.`A_ID` AND `property`.`O_ID`={test};").all()
    result2 = db.engine.execute(f"SELECT `P_NAME`, `buys`.`P_ID`, `Total_Amount` FROM `property` JOIN `buys` ON `buys`.`P_ID` = `property`.`P_ID` AND `C_ID`={test};").all()
    print(result)
    print(result2)
    return render_template('profile.html',no_of=len(result) ,result=result,result2=result2,test2=test2)

@app.route("/delete/<string:P_ID>",methods=['POST','GET'])
@login_required
def delete(P_ID):
    db.engine.execute(F"DELETE FROM `property` WHERE `P_ID`='{P_ID}';")
    print("test")
    return redirect('/profile')

# @app.route("/editt/223",methods=['POST','GET'])
# def edit():

#     tTuple = db.engine.execute(f"SELECT * FROM `property` WHERE `P_ID` = 223;").first()
#     return redirect(url_for('display'))

@app.route("/edit/<string:P_ID>",methods=['POST','GET'])
@login_required
def edit(P_ID):

    tTuple = db.engine.execute(f"SELECT * FROM `property` WHERE `P_ID` = {P_ID};").first()
    print(tTuple,"test")
    if request.method == 'POST':
        print(current_user.id,current_user,"test")
        p_name = request.form.get('p_name')
        p_address = request.form.get('p_address')
        p_bhk = request.form.get('p_bhk')
        p_sqft = request.form.get('p_sqft')
        p_type = request.form.get('p_type')
        test = current_user.id
        print(p_name, p_address, p_sqft, p_bhk, p_type)
        db.engine.execute(f"UPDATE `property` SET `property`.`P_NAME`='{p_name}', `property`.`P_TYPE`='{p_type}', `property`.`P_LOC`='{p_address}', `property`.`P_SQFT`={p_sqft}, `property`.`P_BHK`={p_bhk} WHERE `property`.`P_ID`={P_ID};")
        db.session.commit()
        return redirect('/profile')
    return render_template('edit.html',tTuple=tTuple)


@app.route("/buy/<string:P_ID>",methods=['POST','GET'])
@login_required
def buy(P_ID):
    test = current_user.id
    price = db.engine.execute(f'SELECT `Sales_Price`,`Rent_Price` from `listings` WHERE P_ID = {P_ID};').first()
    db.engine.execute(f"INSERT INTO `buys` VALUES({P_ID},{test},{price.Sales_Price or price.Rent_Price});")
    return redirect('/profile')


app.run(debug=True)

# SELECT `property`.*, `agents`.`A_NAME`, `agents`.`A_PHNO` FROM `property` , `agents` LEFT JOIN `property` ON `agents`.`A_ID` = `property`.`A_ID`  AND `property`.`A_ID` = `agents`.`A_ID` AND `property`.`P_BHK` = {P_BHK} AND `property`.`P_SQFT` = {P_SQFT} AND `property`.`P_LOC` = `{P_ADDRESS}`;