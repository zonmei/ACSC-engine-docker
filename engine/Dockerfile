FROM engine-deps
COPY engine /engine
RUN cd /engine && ./setup.sh
EXPOSE 80 443
CMD cd /engine && ./start.sh
