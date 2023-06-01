# IOT Task2
### Запуск
```
docker-compose up
```
### Комментарии
Опять же, напоминаю про задержки: ``SLEEP_TIME`` в *docker-compose.yml*.

Подключение к MongoSource - ``localhost:27017``, к MongoTarget - ``localhost:27018``.

По поводу внесения изменений в схему: долго пытался завести SchemaRegistry, но безуспешно :( 

Пока использую Embedded схему.