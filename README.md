# tinylogger

An *extremely* lightweight logging framework for BASH scripts.
Developed and tested on MacOS. This should work on any BASH platform.

## Log levels
It supports four levels, default being `INFO`.

    ERROR > WARN > INFO > DEBUG


## Usage

Source the `tinylogger.bash` file, and use the `tlog` method.
The first argument is the level, and the second the log message.

    source tinylogger.bash
    tlog warn "This is a warning"

See [`demo.sh`](./demo.sh) for more.

You can control the logging level while calling a script by setting the `LOGGER_LVL` argument.

    $ LOGGER_LVL=warn ./demo.sh

```
2017-11-07 19:05:30 - WARN - This is a scary warning
2017-11-07 19:05:30 - ERROR - Something terrible has happened
```

    $ LOGGER_LVL=debug ./demo.sh

```
2017-11-07 19:05:52 - DEBUG - first line of script
2017-11-07 19:05:52 - INFO - Starting script ./demo.sh
2017-11-07 19:05:52 - DEBUG - another debug statement
2017-11-07 19:05:52 - INFO - Current time is Tue  7 Nov 2017 19:05:52 GMT
2017-11-07 19:05:52 - WARN - This is a scary warning
2017-11-07 19:05:52 - DEBUG - do you like these debug statements?
2017-11-07 19:05:52 - ERROR - Something terrible has happened
2017-11-07 19:05:52 - DEBUG - end of script
2017-11-07 19:05:52 - INFO - Script completed, go home
```

You can set `LOGGER_LVL=none` to disable all logging.

## Color
By default, log output is colorized by level. This behavior can be disabled by setting `LOGGER_COLOR=0`

## Timestamp customisation

Underneath, the `date` command is used to display the timestamp. Simply set the `LOGGER_FMT` to any valid format supported by `date`.

    $ LOGGER_LVL=warn LOGGER_FMT=%s ./demo.sh

```
1510081622 - WARN - This is a scary warning
1510081622 - ERROR - Something terrible has happened
```

## License

MIT
