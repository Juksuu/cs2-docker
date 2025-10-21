CS2 docker images
==============

## Versions
There are two different versions

* juksuu/cs2:latest (Vanilla cs2 server)
* juksuu/cs2:matchup (Cs2 server with [MatchUp](https://github.com/Juksuu/MatchUp) plugin)

## Environment variables

### General

#### HOST_NAME

Default: cs2-server

Defines the name for the server


#### STARTING_MAP

Default: de_mirage

Map to load on server start


#### GAME_MODE

Default: competitive

Game mode to use in server. One of the following values deathmatch|competitive|wingman|casual|armsrace


#### RCON_PASS

Default: changeme

Rcon password to use for the server


#### SERVER_PASS

Default:

Password to use for the server


#### HIBERNATE_WHEN_EMPTY

Default: 0

Enable or disable server hibernation 0|1
Previously this has caused a crash if set to 1


#### ENABLE_TV

Default: 0

Enable or disable cs tv 0|1


#### BACKUP_FILE_PREFIX

Default: backup

File prefix for backup file. The whole pattern for the file is %prefix%_round%round%.txt


#### DELTA_TICKS_ENFORCE

Default: 2

Sets the sv_deltaticks_enforce value which controls wether to kick clients if they do not ack delta ticks in order 0|1|2

0 - Do not kick
1 - Kick only TV clients
2 - Kick all clients


### MatchUp

#### MATCHUP_VERSION

Default: v0.7.2

Change version for MatchUp plugin
