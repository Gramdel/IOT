# IOT Task1
### Запуск
```
docker-compose up
```
### Комментарии
Возможно, придётся поставить задержки побольше. Для этого нужно изменить ``SLEEP_TIME`` в *docker-compose.yml*.
Увы, не нашёл способа обойтись без них.

Подключение к MongoSource - ``localhost:27017``, к MongoTarget - ``localhost:27018``.