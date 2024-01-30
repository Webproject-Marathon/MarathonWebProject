Сделать базу:
```ps
$ rm .\db.sqlite3
(env) $ python .\manage.py migrate
(env) $  populate_db
python .\manage.py runserver 
``` 