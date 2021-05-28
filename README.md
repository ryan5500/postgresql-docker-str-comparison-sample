# postgresql-docker-str-comparison-sample

In the docker image of postgresql, the results of the following query are different between the normal version and the alpine version.
This repo is a sample code that works.

```
postgres > select 'a' < 'A';
# true in normal version, false in alpine version.
```


# How To Run

```
docker-compose up -d
bash test.sh
```

My Execution result was saved at `output.txt`.
