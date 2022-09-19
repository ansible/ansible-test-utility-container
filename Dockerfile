FROM quay.io/bedrock/alpine:3.16.2 AS builder

RUN apk --no-cache add gcc audit-dev musl-dev

COPY audit-status.c .
RUN gcc -o audit-status audit-status.c -l audit

FROM quay.io/bedrock/alpine:3.16.2

RUN apk --no-cache add audit-libs

COPY --from=builder /audit-status /usr/local/bin/audit-status
