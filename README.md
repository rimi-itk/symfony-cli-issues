It seems that environment variables, e.g. `DATABASE_PORT`, are not set correctly when

1. Using Docker integration
2. Having a `.env` file in the project root folder setting `COMPOSE_PROJECT_NAME` to *something different from the project root folder name*
3. Using the `php` sub-command to run a file in a sub-folder to the project root folder

See https://github.com/symfony/cli/issues/294.

## Steps to reproduce

```sh
./test.sh
```
