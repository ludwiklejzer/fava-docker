FROM python:3.11-slim-bookworm AS builder

WORKDIR /tmp
COPY requirements.txt .
RUN pip install --no-cache-dir --root-user-action ignore --prefix="/install" fava -r requirements.txt

FROM gcr.io/distroless/python3-debian12

COPY --from=builder /install/lib/python3.11/site-packages /usr/lib/python3/dist-packages
COPY --from=builder /install/bin /usr/local/bin

ENV FAVA_HOST="0.0.0.0"
ENV BEANCOUNT_FILE=""

EXPOSE 5000

ENTRYPOINT ["/usr/bin/python3", "/usr/local/bin/fava"]
