# docker-scheduledwol
deploy:
```
docker build --name="certbottransip" --restart="always" --volume="/etc/localtime:/etc/localtime:ro" dylanve115/certbottransip
```
## Environment variables:
### Required:
DOMAIN = Domain for the SSL certificate
DOMAINEMAIL = Email to recieve letsencrypt notifications on
