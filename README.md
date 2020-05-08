# Irra

## Iniciando
 - Faça clone do repositório
 - Tenha docker instalado na sua máquina
 - make up (confira os logs e espere o `logstash` começar o trabalho) Ex:
 ```
 loglogstash         | [INFO ] 2020-05-11 13:50:27.310 [Ruby-0-Thread-16: /usr/share/logstash/vendor/bundle/jruby/2.5.0/gems/rufus-scheduler-3.0.9/lib/rufus/scheduler/jobs.rb:284] jdbc - (0.001512s)
 SELECT count(*) AS "count" FROM (select
logstash         |     *
logstash         | from
logstash         |     test
logstash         | where
logstash         |     updated_at >= '2020-05-11 13:48:38.588767+0000'
logstash         | order by
logstash         |     updated_at asc) AS "t1" LIMIT 1
 ```


## Conferindo criação do index no ES

 - Abra outra aba do terminal
 ```
 curl -XGET http://localhost:9200/_cat/indices
 ```
  ```log
 yellow open logstash-2020.05.09-000001 FFwnCK-jRHmmVDMqSzcJ6Q 1 1 69  0 47.2kb 47.2kb
yellow open test                       ZnOyrXEpSI-_JhXXzvJpdA 1 1 10 29 19.6kb 19.6kb
green  open .kibana_task_manager_1     AUqeVERJROevqOcLS_9RVg 1 0  2  4 41.5kb 41.5kb
green  open ilm-history-1-000001       FFtlJssNRN6Ze9sh13NtPw 1 0  6  0 15.7kb 15.7kb
green  open .apm-agent-configuration   KJHvH_veR9yFAySYFSe92A 1 0  0  0   283b   283b
green  open .kibana_1                  kOuLKIfJTlK4ItWKN2gx-A 1 0  4  0 24.7kb 24.7kb
 ```
 Nosso index test foi criado e tem 10 documentos

## Conferiando documento pelo id

```
curl -XGET http://localhost:9200/test/_doc/10
```
```json
{"_index":"test","_type":"_doc","_id":"10","_version":696,"_seq_no":731,"_primary_term":5,"found":true,"_source":{"@version":"1","updated_at":"2020-05-11T13:48:38.588Z","created_at":"2020-05-11T13:48:38.588Z","name":"Test10","email":"test10@gmail.com","id":10,"@timestamp":"2020-05-11T13:55:34.308Z"}}
```

## Modificando item no postgres
- make psql
```sql
update test set name = 'OMG' where id = 10;
```
Altera o nome do item buscado anteriormente

```
curl -XGET http://localhost:9200/test/_doc/10
```

Confira o resultado alterado
```json
{"_index":"test","_type":"_doc","_id":"10","_version":996,"_seq_no":1031,"_primary_term":5,"found":true,"_source":{"@version":"1","updated_at":"2020-05-11T13:58:14.986Z","created_at":"2020-05-11T13:48:38.588Z","name":"OMG","email":"test10@gmail.com","id":10,"@timestamp":"2020-05-11T14:00:34.064Z"}}
```