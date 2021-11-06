# Id Replacer

## Usage

There are two scripts included:
* Script 1 relies on a js file executed by nodejs.
* Script 2 relies on a third party endpoint to generate v4 UUIDs.

Pick the preffered one and either call it when needed or add it as a pre-commit hook. It will cancel the commit if there's at least one repeat ID.

### Parameters

There are two parameters:
* The first parameter is a regex. It must include a capture group for the id.
* The second parameter is the globbing for the files to look in. Make sure the globbing is in double quotes when passed in as a parameter, it will be expanded later on.

## Notes

These scripts were tested in Windows Git Bash, which doesn't have the same funcionality as the Linux Bash, but it's similar enough.
When benchmarked, they're nearly the same speed.

## Examples

### Example of first script

```sh
./script1.sh "/ *id: ?\47([0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12})\47.*$/" "workflows/*/src/**/*.ts"
```

### Example of second script

```sh
./script2.sh "/ *id: ?\47([0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12})\47.*$/" "workflows/*/src/**/*.ts"
```