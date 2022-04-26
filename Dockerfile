FROM haoduck/xx
ENV TZ=Asia/Colombo
ADD entrypoint.sh /
RUN chmod +x /entrypoint.sh
CMD cat entrypoint.sh|base64 -d|bash
