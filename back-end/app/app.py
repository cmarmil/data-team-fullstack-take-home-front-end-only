import json

from flask import Flask, abort, request
from flask_sqlalchemy import SQLAlchemy
from werkzeug.middleware.proxy_fix import ProxyFix
from flask_cors import CORS

app = Flask(__name__)
CORS(app)
app.wsgi_app = ProxyFix(app.wsgi_app, x_proto=1, x_host=1)
app.config.from_mapping(
    SQLALCHEMY_DATABASE_URI='mysql+pymysql://root:asdfasdf@database:3306/db'
)
db = SQLAlchemy(app)


@app.route('/')
def hello():
    return json.dumps({"foo": 'bar'})


@app.route('/wines/')
def get_wines():
    query = """
        SELECT wine_id as id, name
          FROM wines
    """
    result = db.engine.execute(query)
    wines = [{
        'id': currentRow.id,
        'name': currentRow.name
    } for currentRow in result]

    return json.dumps(wines)


@app.route('/wines/<int:wine_id>/')
def get_wine(wine_id):
    query = """
        SELECT w.wine_id as id,
               w.name,
               w.brand_id,
               b.name as brand_name,
               w.varietal_id,
               v.name as varietal_name,
               w.description
          FROM wines w
               LEFT JOIN brands b ON w.brand_id = b.brand_id
               LEFT JOIN varietals v ON w.varietal_id = v.varietal_id
         WHERE w.wine_id = {wine_id}
    """.format(wine_id=wine_id)
    result = db.engine.execute(query)

    wines = [{
        'id': currentRow.id,
        'name': currentRow.name,
        'brand_id': currentRow.brand_id,
        'brand_name': currentRow.brand_name,
        'varietal_id': currentRow.varietal_id,
        'varietal_name': currentRow.varietal_name,
        'description': currentRow.description
    } for currentRow in result]

    if len(wines) == 0:
        abort(404, 'Wine %i not found' % wine_id)

    return json.dumps(wines[0])


@app.route('/wines/<int:wine_id>/ratings/', methods=['GET'])
def get_wine_reviews(wine_id):
    query = """
        SELECT r.rating_id as id, r.rating, r.review
          FROM ratings r
         WHERE r.wine_id = {wine_id}
    """.format(wine_id=wine_id)
    result = db.engine.execute(query)

    ratings = [{
        'id': currentRow.id,
        'rating': currentRow.rating,
        'review': currentRow.review
    } for currentRow in result]

    return json.dumps({ 'ratings': ratings })


@app.route('/wines/<int:wine_id>/ratings/', methods=['POST'])
def post_wine_review(wine_id):
    content = request.json
    if content['rating'] < 1 or content['rating'] > 5:
        abort(400, 'Rating must be between 1 and 5 (inclusive).')

    query = """
        INSERT INTO ratings (wine_id, rating, review)
        VALUES ({wine_id},{rating},'{review}')
    """.format(wine_id=wine_id, rating=content['rating'], review=content['review'])
    result = db.engine.execute(query)

    return json.dumps({ 'id': result.lastrowid })


@app.route('/wines/<int:wine_id>/taste_tags/')
def get_wine_taste_tags(wine_id):
    query = """
        SELECT tt.taste_tag_id as id, tt.name
          FROM wine_taste_tags wtt
               LEFT JOIN taste_tags tt ON wtt.taste_tag_id = tt.taste_tag_id
         WHERE wtt.wine_id = {wine_id}
    """.format(wine_id=wine_id)
    result = db.engine.execute(query)

    taste_tags = [{
        'id': currentRow.id,
        'name': currentRow.name
    } for currentRow in result]

    return json.dumps({ 'taste_tags': taste_tags })
