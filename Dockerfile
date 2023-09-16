FROM clux/muslrust
USER root
RUN cargo install sqlx-cli --no-default-features --features native-tls,postgres

FROM alpine as runtime
USER root
WORKDIR /app
VOLUME /app/migrations
COPY --from=0 /root/.cargo/bin/sqlx /usr/bin/sqlx
ENTRYPOINT ["sqlx"]

