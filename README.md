# Настройка сети между Docker контейнерами

1. Создали Dockerfile со следующим содержимым:
```dockerfile
FROM ubuntu:latest

ENV TERM=xterm

RUN apt-get update && apt-get install -y \
    libaa-bin \
    iputils-ping \
    && rm -rf /var/lib/apt/lists/*

CMD ["aafire"] 
```

2. Собрали docker-image:
```bash
docker build -t aafire-image .
```

3. Запустили два контейнера:
```bash
docker run -d --name container1 aafire-image
docker run -d --name container2 aafire-image
```

4. Создали новую сеть:
```bash
docker network create myNetwork
```

5. Подключили контейнеры к созданной сети:
```bash
docker network connect myNetwork container1
docker network connect myNetwork container2
```

6. Проверили настройки сети:
```bash
docker network inspect myNetwork
```

7. Для проверки соединения между контейнерами выполните:
```bash
# Подключились к первому контейнеру
docker exec -it container1 bash

# Выполните ping до второго контейнера
ping container2
```

## Результаты работы

### Скриншот 1: Работающий docker-image с aafire
![aafire](./images/aafire.jpg) 

### Скриншот 2: Работающий контейнер 1
![container1](./images/container1.jpg)

### Скриншот 3: Работающий контейнер 2
![container2](./images/container2.jpg)

### Скриншот 4: Проверка сетевого соединения между container1 и container2 при помощи ping
![ping](./images/ping.jpg)