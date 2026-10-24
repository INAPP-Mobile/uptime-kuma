# Uptime Kuma on Railway — wrapper around the pinned upstream image.
#
# Why each non-default setting exists:
# - USER root: Railway mounts persistent volumes owned by root. The
#   upstream image runs as `node`, which would crash-loop on EACCES
#   writing kuma.db to the volume. Running as root avoids that.
# - DATA_DIR=/data: points the SQLite database (and all app state) at
#   the Railway volume mount, so monitors and settings survive restarts
#   and redeploys. The default ./data would live in the ephemeral layer.
# - No PORT override: Uptime Kuma already honors Railway's injected
#   PORT env var (config.js: args.port > UPTIME_KUMA_PORT > PORT > 3001),
#   so Railway's dynamic port just works. EXPOSE 3001 is documentary.
# - CMD re-states the upstream command explicitly so the wrapper does
#   not silently depend on the inherited image CMD; the inherited
#   dumb-init ENTRYPOINT is kept (it forwards signals correctly).
FROM louislam/uptime-kuma:2.5.7@sha256:4b95dbe7ac5343b768f8e04e3035ccd59997872b1a35ab9b0f082d2cc279070e

USER root
ENV DATA_DIR=/data
EXPOSE 3001
CMD ["node", "server/server.js"]

LABEL org.opencontainers.image.source="https://github.com/mc9max/uptime-kuma"
