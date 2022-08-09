# Book Store APP.

CUrrently A WORK IN PROGRESS, slow progress due to Limited time and work contraints

Endpoints so far. forgive the rough doc...I'll provide a better README when work is complete

## - Get all books endpoint -- `/books` GET endpoint

query param `{ limit: <an integer>, offset: <an integer>}`. both limit and offset are not required


## - Add a book endpoint -- `/books` POST endpoint

body param

```json
{
    "title": "The Martian",
    "first_name": "Andy",
    "last_name": "Weir",
    "age": 48

}
```

## - Delete book endpoint -- `/books/{id}` DELETE endpoint