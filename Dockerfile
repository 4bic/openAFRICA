FROM openafrica/ckan:latest
MAINTAINER Code for Africa <support@codeforafrica.org>

ADD requirements.txt /requirements.txt
RUN pip install -q -r /requirements.txt

RUN ln -s ./src/ckan/ckan/config/who.ini /who.ini
ADD ckan.ini /ckan.ini

CMD ["gunicorn", "--workers", "2", "--worker-class", "gevent", "--paste", "ckan.ini", "-t", "600"]