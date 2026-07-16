FROM nginx:1.27-alpine

LABEL org.opencontainers.image.title="Chetan Kesare portfolio" \
      org.opencontainers.image.description="Portfolio site served by Nginx" \
      org.opencontainers.image.vendor="Chetan Kesare"

ENV NGINX_ENVSUBST_TEMPLATE_DIR=/etc/nginx/templates \
    NGINX_ENVSUBST_OUTPUT_DIR=/etc/nginx/conf.d

RUN addgroup -S app && adduser -S -G app -h /home/app app \
    && rm -f /etc/nginx/conf.d/default.conf \
    && mkdir -p /var/cache/nginx /var/run /var/log/nginx /tmp/nginx \
    && chown -R app:app /var/cache/nginx /var/run /var/log/nginx /tmp/nginx /usr/share/nginx/html

COPY --chown=app:app index.html /usr/share/nginx/html/index.html
COPY --chown=app:app nginx/default.conf /etc/nginx/conf.d/default.conf

EXPOSE 6232

USER app

HEALTHCHECK --interval=30s --timeout=5s --start-period=10s --retries=3 \
  CMD wget --spider -q http://127.0.0.1:6232/ || exit 1

CMD ["nginx", "-g", "daemon off;"]
