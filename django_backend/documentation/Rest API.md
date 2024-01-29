# Как развернуть backend

Клонируем репозиторий, открываем терминал из-под директории `MarathonWebProject\django_backend`
Create virtual environment, then activate it and install all packages:
```ps
$ python -m venv .venv
$ .venv\Scripts\Activate.ps1
(venv) $ python -m pip install -r requirements.txt
```

Заполняем базу данных данными:
Удаляем старую базу:
```
$ rm .\db.sqlite3
```
Применяем миграции и выполняем кастомную команду, которая заполнит данными.
```ps
(env) $ python .\manage.py migrate
(env) $ python .\manage.py populate_db
```
После этого можно запускать сервер:
```ps
(env) $ python .\manage.py runserver
```

# Use Cases
## Загрузка волонтёров
`/upload-volunteers/`
File format (encoding must be utf-8):
```csv
VolunteerId,FirstName,LastName,CountryCode,Gender
1,LUCIA,BURCH,BRA,F
2,ASHLEY,WAGONER,BRA,M
3,FORREST,WILEY,USA,M
4,DEAN,CANNON,BRA,M
```

Request example:
```dart
var request = http.MultipartRequest('POST', Uri.parse('localhost:8000/upload-volunteers'));

request.files.add(await http.MultipartFile.fromPath('file', '/C:/Users/derli/Desktop/итоговое для нацфинала 2016/TP09_resources/WSR2016_TP09_ресурсы_сессия_3/marathon-skills-2016-volunteer-list.csv'));

  

http.StreamedResponse response = await request.send();

  

if (response.statusCode == 200) {

  print(await response.stream.bytesToString());

}

else {

  print(response.reasonPhrase);

}
```

Returns:
* `HTTP_201_CREATED`:
```
{ "success": "321 volunteers created" }
```
* *`HTTP_500_INTERNAL_SERVER_ERROR`
* `HTTP_400_BAD_REQUEST
	* `Invalid file format` if file not in `.csv` format.
	* `No file sent`. Probably wrong http request. You forgot to specify key "file" or didn't select file.



## Сортировка волонтёров:
`/volunteers/?ordering=gender__name/`
по каким полям можно сортировать:
* `first_name`
* `last_name`
* `country__name`
* `gender__name`

## Получение всех спонсоров для пользователя (точнее для его регистрации)
Пример: `/sponsorships/by-registration/100/`
```json
{
    "sponsorships": [
        {
            "name": "SONJA CAIAFA",
            "registration": "http://127.0.0.1:8000/registrations/100/",
            "amount": "50.00"
        },
        {
            "name": "ANNIE ODONNELL",
            "registration": "http://127.0.0.1:8000/registrations/100/",
            "amount": "10.00"
        }
    ],
    "total_amount": 60.0
}
```
Ошибки:
1. Если засунуть вместо `registration_id` какую-то херню, которая не `int`: `/sponsorships/by-registration/aboba/` --> `Page not found (404)`

## Авторизация
```dart
var request = http.MultipartRequest('POST', Uri.parse('localhost:8000/api-token-auth/'));
request.fields.addAll({
  'email': 'test@gmail.com',
  'password': '1111'
});


http.StreamedResponse response = await request.send();

if (response.statusCode == 200) {
  print(await response.stream.bytesToString());
}
else {
  print(response.reasonPhrase);
}
```

Что получаем:
* Успех: `{"token":"986a26e4d96929e9b0bf9f1b1aec988d4fdd7a80","user_id":5093,"email":"test@gmail.com"}`
* Неправильные email и пароль: `{"non_field_errors":["Unable to log in with provided credentials."]}`
* Ошибка в запросе: `{"email":["This field is required."],"password":["This field is required."]}`

## Registration Status
`/registration-statuses/`
Response:
```json
[
    {
        "url": "http://127.0.0.1:8000/registration-statuses/1/",
        "status": "Registered"
    },
    {
        "url": "http://127.0.0.1:8000/registration-statuses/2/",
        "status": "Payment Confirmed"
    },
    {
        "url": "http://127.0.0.1:8000/registration-statuses/3/",
        "status": "Race Kit Sent"
    },
    {
        "url": "http://127.0.0.1:8000/registration-statuses/4/",
        "status": "Race Attended"
    }
]
```

## Страница 14. Результаты предыдущих гонок
`/registration-events/?marathon_id=1&event_type=1`
Выбираем нужные `marathon_id` и `event_type`. 

Для справки:
`/marathons/`:
```json
[
    {
        "url": "http://127.0.0.1:8000/marathons/1/",
        "name": "Marathon Skills 2011",
        "city_name": "York",
        "year_held": 2011,
        "country": "http://127.0.0.1:8000/countries/27/"
    },
    {
        "url": "http://127.0.0.1:8000/marathons/2/",
        "name": "Marathon Skills 2012",
        "city_name": "Hanoi",
        "year_held": 2012,
        "country": "http://127.0.0.1:8000/countries/92/"
    },
    {
        "url": "http://127.0.0.1:8000/marathons/3/",
        "name": "Marathon Skills 2013",
        "city_name": "Leipzig",
        "year_held": 2013,
        "country": "http://127.0.0.1:8000/countries/30/"
    },
    {
        "url": "http://127.0.0.1:8000/marathons/4/",
        "name": "Marathon Skills 2014",
        "city_name": "Osaka",
        "year_held": 2014,
        "country": "http://127.0.0.1:8000/countries/44/"
    },
    {
        "url": "http://127.0.0.1:8000/marathons/5/",
        "name": "Marathon Skills 2015",
        "city_name": "Sao Paulo",
        "year_held": 2015,
        "country": "http://127.0.0.1:8000/countries/7/"
    }
]
```

`/event-types/`:
```json
[
    {
        "url": "http://127.0.0.1:8000/event-types/1/",
        "name": "Full Marathon"
    },
    {
        "url": "http://127.0.0.1:8000/event-types/2/",
        "name": "5km Fun Run"
    },
    {
        "url": "http://127.0.0.1:8000/event-types/3/",
        "name": "Half Marathon"
    }
]
```

Response:
```json
[
    {
        "url": "http://127.0.0.1:8000/registration-events/54/",
        "country_name": "United States",
        "runner_first_name": "ELLEN",
        "runner_last_name": "TJEPKEMA",
        "bib_number": 14,
        "race_time": null,
        "registration": "http://127.0.0.1:8000/registrations/10/",
        "event": "http://127.0.0.1:8000/events/1/"
    },
    {
        "url": "http://127.0.0.1:8000/registration-events/95/",
        "country_name": "Venezuela",
        "runner_first_name": "SHANDRA",
        "runner_last_name": "DREW",
        "bib_number": 24,
        "race_time": null,
        "registration": "http://127.0.0.1:8000/registrations/121/",
        "event": "http://127.0.0.1:8000/events/1/"
    },
    ...
```
Отсортированы по `race_time`, то есть сначала будут показываться те, кто прибежали первыми. Я не знаю, почему, но у некоторых `race_time` равно `null`.


## Страница 22. Управление бегунами
`/runner-management/`
### Optional query parameters
#### Filter:
* `status_id`
* `event_type_id`

Examples: 
`/runner-management/?status_id=1&event_type_id=2`
`/runner-management/?status_id=3`
`/runner-management/?event_type_id=1`

#### Order: 
* `first_name`
* `last_name`
* `email`
* `status_id`
* `event_type_id` 

Examples:
`/runner-management/?order=first_name` (ascending)
`/runner-management/?order=-first_name` (descending)

### Response
```json
{
  "url": "http://127.0.0.1:8000/runner-management/1/",
  "runner_first_name": "SHANNON",
  "runner_last_name": "ROSARIO",
  "runner_email": "shannon@gmail.com",
  "registration_status": "Race Attended",
  "registration": "http://127.0.0.1:8000/registrations/2/"
}
```

### Поменять статус регистрации
Request:
```http
POST http://127.0.0.1:8000/runner-management/1/change_registration_status/ HTTP/1.1
Content-Type: application/json

{
    "new_status_id": 1
}
```

Значения `new_status_id`:
`1` - `Registered`
`2` - `Payment Confirmed`
`3` - `Race Kit Sent`
`4` - `Race Attended`

Если всё хорошо, вернётся `response 200 OK`:
```json
{
  "message": "Registration status changed successfully"
}
```
Если плохо, то вернётся `response 500 Internal Server Error`.
Точно не надо пихать в `new_status_id` значения, которые не входят в диапазон `[1, 4]`.