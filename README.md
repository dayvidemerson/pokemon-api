# Pokemon API

## Using native system

### Dependencies

- Ruby 2.X
- Bundler 2.X
- SQLite

### Setup

Just run:

```
bundle install
```

### Starting server

Just run:

```
rails server
```

### Running tests

#### Running all tests

Just run:

```
rspec
```

#### Running specific tests

Test full path:

```
rspec spec/path
```

Test one file:

```
rspec spec/path/filename_spec.rb
```

Test one line on file:

```
rspec spec/path/filename_spec.rb:10
```

## Using Docker

### Dependencies

- [Docker](https://docs.docker.com/engine/install/)
- [Docker Compose](https://docs.docker.com/compose/install/)
- [Docker Sync](https://docker-sync.readthedocs.io/)

### Starting server

Just run:

```
make start
```

### Running tests

#### Running all tests

Just run:

```
make tests
```

#### Running specific tests

Just run:

```
make tests TEST_PATH=spec/controllers/
```

### Daemon server

#### Starting server

Just run:

```
make start-daemon
```

#### Stopping server

Just run:

```
make stop-daemon
```

#### Showing logs

Just run:

```
make logs
```
