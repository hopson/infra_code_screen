FROM python:3.7
WORKDIR /app
RUN pip install pipenv
ADD Pipfile Pipfile.lock ./
RUN pipenv install
ADD . ./
EXPOSE 5000
ENV FLASK_APP=server.py
ENTRYPOINT [ "pipenv", "run" ]
CMD [ "flask", "run", "--host=0.0.0.0" ]
