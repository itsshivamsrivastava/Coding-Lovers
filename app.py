import math
import os
import json
from datetime import datetime
from flask import Flask, render_template, request, session, redirect, flash
from flask_sqlalchemy import SQLAlchemy
# from werkzeug.utils import secure_filename
from flask_mail import Mail
import pymysql

pymysql.install_as_MySQLdb()

with open('config.json', 'r') as c:
    params = json.load(c)["params"]

local_server = True
app = Flask(__name__)
app.secret_key = 'super-secret-key'
app.config['UPLOAD_FOLDER'] = params['upload_location']
app.config['BOOK_UPLOAD_FOLDER'] = params['book_upload_location']
# app.config.update(
#     MAIL_SERVER='smtp.gmail.com',
#     MAIL_PORT=465,
#     MAIL_USE_SSL=True,
#     MAIL_USERNAME=params['gmail-user'],
#     MAIL_PASSWORD=params['gmail-password']
# )

app.config['MAIL_SERVER']='smtp.mailtrap.io'
app.config['MAIL_PORT'] = 2525
app.config['MAIL_USERNAME'] = '0b712f2fabdc86'
app.config['MAIL_PASSWORD'] = '3f19c452ca373f'
app.config['MAIL_USE_TLS'] = True
app.config['MAIL_USE_SSL'] = False
mail = Mail(app)
if local_server:
    app.config['SQLALCHEMY_DATABASE_URI'] = params['local_uri']
else:
    app.config['SQLALCHEMY_DATABASE_URI'] = params['prod_uri']

db = SQLAlchemy(app)


class Contacts(db.Model):
    sno = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(80), nullable=False)
    email = db.Column(db.String(20), nullable=False)
    phone_no = db.Column(db.String(12), nullable=False)
    msg = db.Column(db.String(120), nullable=False)
    date = db.Column(db.String(12), nullable=True)


class Posts(db.Model):
    sno = db.Column(db.Integer, primary_key=True)
    tittle = db.Column(db.Text, nullable=False)
    slug = db.Column(db.String(25), nullable=False)
    content = db.Column(db.Text, nullable=False)
    tagline = db.Column(db.Text, nullable=False)
    date = db.Column(db.String(12), nullable=True)
    img_file = db.Column(db.String(100), nullable=True)


class Book(db.Model):
    book_id = db.Column(db.Integer, primary_key=True)
    book_name = db.Column(db.Text, nullable=False)
    book_cat = db.Column(db.Text, nullable=False)
    book_author = db.Column(db.Text, nullable=False)
    book_publication = db.Column(db.Text, nullable=False)
    book_desc = db.Column(db.Text, nullable=False)
    price = db.Column(db.Float, nullable=False)
    book_img = db.Column(db.String(100), nullable=True)
    amazon_link = db.Column(db.Text, nullable=False)
    flipkart_link = db.Column(db.Text, nullable=False)
    thriftbooks_link = db.Column(db.Text, nullable=False)



@app.route('/')
def home():
    posts = Posts.query.filter_by().all()
    last = math.ceil(len(posts) / int(params['no_of_posts']))
    # [0:params['no_of_posts']]
    page = request.args.get('page')
    if not str(page).isnumeric():
        page = 1
    page = int(page)
    posts = posts[(page - 1) * int(params['no_of_posts']): (page - 1) * int(params['no_of_posts']) + int(
        params['no_of_posts'])]
    # Pagination Logic :-
    # First :-
    if page == 1:
        prev = "#"
        next = "/?page=" + str(page + 1)
    elif page == last:
        prev = "/?page=" + str(page - 1)
        next = "#"
    else:
        prev = "/?page=" + str(page - 1)
        next = "/?page=" + str(page + 1)

    return render_template('index.html', params=params, posts=posts, prev=prev, next=next)


@app.route("/post/<string:post_slug>", methods=['GET'])
def post_route(post_slug):
    post = Posts.query.filter_by(slug=post_slug).first()
    return render_template('post.html', params=params, post=post)


@app.route("/about")
def about():
    return render_template('about.html', params=params)

@app.route("/bookshelf", methods=['GET'])
def bookshelf():
    books = Book.query.filter_by().all()
    return render_template('bookshelf.html', params=params, books=books)


@app.route("/dashboard", methods=['GET', 'POST'])
def dashboard():
    if 'user' in session and session['user'] == params['admin_user']:
        posts = Posts.query.all()
        return render_template('dashboard.html', params=params, posts=posts)

    if request.method == 'POST':
        username = request.form.get('uname')
        userpass = request.form.get('pass')
        if username == params['admin_user'] and userpass == params['admin_password']:
            # set the session variable
            session['user'] = username
            posts = Posts.query.all()
            return render_template('dashboard.html', params=params, posts=posts)
        else:
            flash('Incorrect username or password', 'danger')
    return render_template('login.html', params=params)


@app.route("/bookDashboard", methods=['GET', 'POST'])
def bookDashboard():
    if 'user' in session and session['user'] == params['admin_user']:
        books = Book.query.all()
        return render_template('bookDashboard.html', params=params, books=books)

    if request.method == 'POST':
        username = request.form.get('uname')
        userpass = request.form.get('pass')
        if username == params['admin_user'] and userpass == params['admin_password']:
            # set the session variable
            session['user'] = username
            books = Book.query.all()
            return render_template('bookDashboard.html', params=params, books=books)
        else:
            flash('Incorrect username or password', 'danger')
    return render_template('login.html', params=params)


@app.route("/edit/<string:sno>", methods=['GET', 'POST'])
def edit(sno):
    if 'user' in session and session['user'] == params['admin_user']:
        if request.method == 'POST':
            f = request.files['file1']
            if f.filename == '':
                pass
            else:
                # secure_filename
                f.save(os.path.join(app.config['UPLOAD_FOLDER'], f.filename))
            box_tittle = request.form.get('tittle')
            tline = request.form.get('tline')
            slug = request.form.get('slug')
            content = request.form.get('content')
            img_file = request.form.get('img_file')
            date = datetime.now()
            if sno == '0':
                if box_tittle == '' and tline == '' and slug == '' and content == '':
                    flash('Below fields are mandatory to create a post!', 'danger')
                else:
                    post = Posts(tittle=box_tittle, slug=slug, content=content,
                                 tagline=tline, img_file=img_file, date=date)
                    db.session.add(post)
                    db.session.commit()
                    flash('Post has been added successfully', 'success')
            else:
                post = Posts.query.filter_by(sno=sno).first()
                post.tittle = box_tittle
                post.slug = slug
                post.content = content
                post.tagline = tline
                post.img_file = img_file
                post.date = date
                db.session.commit()
                flash('Post has been edited successfully', 'success')

                return redirect('/edit/' + sno)
        post = Posts.query.filter_by(sno=sno).first()
        return render_template('edit.html', params=params, post=post, sno=sno)


@app.route("/bookEdit/<int:book_id>", methods=['GET', 'POST'])
def bookEdit(book_id):
    if 'user' in session and session['user'] == params['admin_user']:
        if request.method == 'POST':
            f = request.files['file2']
            if f.filename == '':
                pass
            else:
                # secure_filename
                f.save(os.path.join(app.config['BOOK_UPLOAD_FOLDER'], f.filename))
            booksName = request.form.get('name')
            booksCat = request.form.get('category')
            booksAuthor = request.form.get('author')
            booksPublication = request.form.get('publication')
            booksDesc = request.form.get('desc')
            booksPrice = request.form.get('bookprice')
            booksImg = request.form.get('bookImage')
            amazonLink = request.form.get('amazonLink')
            flipkartLink = request.form.get('flipkartLink')
            thriftbooksLink = request.form.get('thriftbooksLink')
            # date = datetime.now()
            if book_id == 0:
                if booksName == '' and booksCat == '' and booksAuthor == '' and booksDesc == '' and booksPrice == '':
                    flash('Below fields are mandatory to add a book!', 'danger')
                else:
                    book = Book(book_name=booksName, book_cat=booksCat, book_author=booksAuthor,
                                book_publication=booksPublication, book_desc=booksDesc, price=booksPrice,
                                book_img=booksImg, amazon_link=amazonLink, flipkart_link=flipkartLink, thriftbooks_link=thriftbooksLink)
                    db.session.add(book)
                    db.session.commit()
                    flash('Book has been added successfully', 'success')
            else:
                book = Book.query.filter_by(book_id=book_id).first()
                book.book_name = booksName
                book.book_cat = booksCat
                book.book_author = booksAuthor
                book.book_publication = booksPublication
                book.book_desc = booksDesc
                book.price = booksPrice
                book.book_img = booksImg
                book.amazon_link = amazonLink
                book.flipkart_link = flipkartLink
                book.thriftbooks_link = thriftbooksLink
                db.session.commit()
                flash('Book has been edited successfully', 'success')

                return redirect('/bookEdit/' + str(book_id))
        book = Book.query.filter_by(book_id=book_id).first()
        return render_template('bookEdit.html', params=params, book=book, book_id=book_id)

@app.route("/logout")
def logout():
    session.pop('user')
    return redirect('/dashboard')


@app.route("/delete/<string:sno>", methods=['GET', 'POST'])
def delete(sno):
    if 'user' in session and session['user'] == params['admin_user']:
        post = Posts.query.filter_by(sno=sno).first()
        db.session.delete(post)
        db.session.commit()
        flash('Post has been deleted successfully', 'success')
    return redirect('/dashboard')

@app.route("/bookDelete/<int:book_id>", methods=['GET', 'POST'])
def bookDelete(book_id):
    if 'user' in session and session['user'] == params['admin_user']:
        book = Book.query.filter_by(book_id=book_id).first()
        db.session.delete(book)
        db.session.commit()
        flash('Book has been deleted successfully', 'success')
    return redirect('/bookDashboard')


@app.route("/contact", methods=['GET', 'POST'])
def contact():
    if request.method == 'POST':
        '''Add entry to the database'''
        name = request.form.get('name')
        email = request.form.get('email')
        phone = request.form.get('phone')
        message = request.form.get('message')

        entry = Contacts(name=name, email=email, phone_no=phone,
                         msg=message, date=datetime.now())
        db.session.add(entry)
        db.session.commit()
        mail.send_message('New message from ' + name,
                          sender=email,
                          recipients=[params['gmail-user']],
                          body=message + "\n" + phone
                          )
        flash('Thank You for contacting us', 'success')
    return render_template('contact.html', params=params)

@app.route("/bookshelf", methods=['GET', 'POST'])
def searchBook():
    words1 = request.form.get('search')
    bookSearch1 = Book.query.filter_by().all()
    # print(f" array {bookSearch1}")
    searchResult = []
    for book1 in bookSearch1:
        if book1.book_name.lower() == words1.lower() or book1.book_cat.lower() == words1.lower():
            # print(f"book- {book1}")
            searchResult.append(book1)
    if len(searchResult) == 0:
        wordArray = words1.split(" ")
        for book2 in bookSearch1:
            for word in wordArray:
                if book2.book_name.lower() == word.lower() or book2.book_cat.lower() == word.lower():
                    searchResult.append(book2)
    return render_template('bookshelf.html', params=params, books=searchResult)

if __name__ == '__main__':
    app.run(debug=True)

