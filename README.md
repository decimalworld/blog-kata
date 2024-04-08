# Bloginator
**This repo belong a series of personal kata where a specific project is defined and completed as fast as possible**
## Description
A backend api for allowing user to create/read blog
## Design documents
Bloginator api document: [link]()
## Dependencies
- Docker 25.0.3
- Ruby 3.2.3
- Rails 7.1.3.2
- AWS-SDK 3
- Postgresql 16.2
## Environment
Environment is defined using rails credentials: [link](https://api.rubyonrails.org/classes/Rails/Application.html#method-i-credentials)

Sample credentials:
```yml
secret_key_base: 'random key'
jwt_toke_secret: 'random key'
aws:
    buket: 'aws-s3-bucket-name'
    access_key_id: 'aws-iam-user-credentials'
    secret_access_key: 'aws-iam-user-credentials'
database:
    host: 'localhost'
    username: 'postgres'
    password: 'password'
    port: '5432

```
**Note:** Make sure aws-iam-user have put-object access to s3
## Build steps
- Build docker image locally:
```bash
docker compose build
```
- Run rails migration to create database:
```bash
docker compose run app rails db:create db:migrate db:seed
```
- Start app
```bash
docker compose up -d
```
## Testing
Testing using rspec-rails:
```bash
docker compose run app rspec spec
```