#!/bin/bash
mkdir tempdir
chmod 700 tempdir
mkdir tempdir/templates tempdir/static
cp -R templates static desafio2_app.py tempdir
cd tempdir
echo "FROM python\n
RUN pip install flask\n
COPY ./static /home/myapp/static/\n
COPY ./templates /home/myapp/templates/\n
COPY desafio2_app.py /home/myapp/\n
EXPOSE 5050\n
CMD python3 /home/myapp/desafio2_app.py" > dockerfile
docker build -t desafio2_app .
docker run -t -d -p 5050:5050 --name desafio2running desafio2_app
docker ps -a

