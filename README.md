# Minecraft server in Podman
Repository containing files for building Miinecraft server image based on AlmaLinux 9

## Configuration
Minecraft server can be configured through setting environment variables during container startup.

| Environment variable | Value |
|----------------------|-------|
| MC_PORT              | Type: Number<br />Usage: Used for configuring server port and query port<br />Default: 25565 |
| MC_MOTD              | Type: String<br />Usage: Minecraft motd<br />Default: Minecraft on AlmaLinux |
| MC_RANDOM_SEED       | Type: Boolean<br />Usage: If '1' environment variable MC_SEED will be ignored and server will generate random seed, if '0' user has to define MC_SEED<br />Default: 1 |
| MC_SEED              | Type: String<br />Usage: If MC_RANDOM_SEED is set to '0', startup script will use this value to set server seed and error out if this value is not set, else ignored<br />Default: There is no default |