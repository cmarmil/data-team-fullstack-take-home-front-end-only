# Back End

## Requirements
- [docker](https://docker.com) installed on your machine.
- [docker-compose](https://docs.docker.com/compose/install/) installed on your machine.
- Make sure any `mysql` service running locally on your machine is stopped. (need port 3306 available)

### Repository Structure
- `app/app.py`: the flask server file
- `app/Dockerfile`: the docker file for the server
- `app/requirements.txt`: a list of packages to be installed that are required by the server
- `database/data-dump.sql`: the script to create and seed the docker mysql database
- `database/Dockerfile`: the docker file for the mysql database
- `nginx/Dockerfile`: the docker file for the nginx server
- `nginx/nginx.conf`: the nginx configuration file
- `docker-compose.yml`: the docker compose configuration file
- `local.env`: the local environment file, used to change database and flask global config

## Wine List API
- Get a list of wines.

#### URL:
```
GET http://localhost:3000/wines/
```

#### Response:
```json
{
  "wines": [
    {
      "id": 1,
      "name": "Mojave Rain Merlot 2017"
    },
    {
      "id": 2,
      "name": "Mojave Rain Merlot 2017"
    }
  ]
}
```

### Wine API
- Get a single wine and its details.

#### URL:
```
GET http://localhost:3000/wines/<wine_id>/
```

#### Response:
```json
{
  "id": 1,
  "name": "Mojave Rain Merlot 2017",
  "brand_id": 2,
  "brand_name": "Mojave Rain",
  "varietal_id": 3,
  "varietal_name": "Merlot",
  "description": "lorem ipsum"
}
```

### New Wine Rating API
- Post a new rating for a single wine.
- Validate `rating` so that it is an integer between 1 and 5.
- `review` can be omitted, empty, or null.

#### URL:
```
POST http://localhost:3000/wines/<wine_id>/ratings/
```

#### POST Body:
```json
{
  "rating": 5,
  "review": "I love this wine"
}
```

#### Response:
```json
// id of newly created record
{
  "id": 3
}
```

### Wine Ratings API
- Get a list of ratings/reviews for a single wine.
- If `review` is null, return an empty string.

#### URL:
```
GET http://localhost:3000/wines/<wine_id>/ratings/
```

#### Response:
```json
{
  "ratings": [
    {
      "id": 43,
      "rating": 1,
      "review": "I love this wine"
    },
    {
      "id": 93,
      "rating": 5,
      "review": "Very good."
    },
    {
      "id": 128,
      "rating": 4,
      "review": ""
    }
  ]
}
```

### Wine Taste Tags API
- Get a list of wine taste tags for a single wine.

#### URL:
```
GET http://localhost:3000/wines/<wine_id>/taste_tags/
```

#### Response:
```json
{
  "tags": [
    {
      "id": 1,
      "name": "Fruity"
    },
    {
      "id": 2,
      "name": "Smoky"
    }
  ]
}
```

## Running API Locally
```sh
docker-compose up -d
```

## Shutting down API
```sh
docker-compose down
```

## URL to connect to API
```
http://localhost:3000/
```

## Learn More
- [docker](https://docker.com)
- [docker-compose](https://docs.docker.com/compose/)
- [nginx](https://docs.nginx.com/nginx/)
- [mysql](https://dev.mysql.com/doc/refman/8.0/en/)
- [python](https://www.python.org/)
- [flask](https://flask.palletsprojects.com/en/1.1.x/)
- [flask-sqlalchemy](https://flask-sqlalchemy.palletsprojects.com/en/2.x/)
