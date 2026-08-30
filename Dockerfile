FROM ubuntu:24.04 AS build
RUN apt-get update \
    && apt-get install --yes --no-install-recommends valac libglib2.0-dev \
    && find /var/lib/apt/lists -mindepth 1 -delete
WORKDIR /src
COPY src/stakeholder.vala src/stakeholder.vala
COPY tests/test_cli.sh tests/test_cli.sh
RUN valac --fatal-warnings --pkg glib-2.0 -o /out/stakeholder src/stakeholder.vala \
    && BIN=/out/stakeholder tests/test_cli.sh
FROM ubuntu:24.04
RUN apt-get update \
    && apt-get install --yes --no-install-recommends libglib2.0-0t64 \
    && find /var/lib/apt/lists -mindepth 1 -delete \
    && groupadd --system stakeholder \
    && useradd --system --gid stakeholder --home-dir /nonexistent --shell /usr/sbin/nologin stakeholder
COPY --from=build /out/stakeholder /usr/local/bin/stakeholder
USER stakeholder
ENTRYPOINT ["/usr/local/bin/stakeholder"]
CMD ["--list-values"]
