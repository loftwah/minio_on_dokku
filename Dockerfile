FROM minio/minio:RELEASE.2020-04-02T21-34-49Z

# Add user dokku
RUN adduser -D -u 32769 -g dokku dokku
USER dokku

# Change workdir
WORKDIR /home/dokku

# Add custom nginx conf file to increase max upload
ADD nginx.conf.sigil .

# Run the server and point to the created directory
CMD ["server", "--address", ":5000", "/home/dokku/data"]
