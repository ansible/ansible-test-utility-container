FROM quay.io/bedrock/alpine:3.19.1 AS base

FROM base AS builder
RUN apk --no-cache add gcc audit-dev musl-dev python3

COPY audit-status.c error-table.py ./
RUN python error-table.py > error-table.h
RUN cat error-table.h
RUN gcc -Wpedantic -Wall -Wextra -Werror -o audit-status audit-status.c -l audit

FROM base AS output
RUN apk --no-cache add audit-libs

COPY --from=builder /audit-status /usr/local/bin/audit-status
RUN audit-status
