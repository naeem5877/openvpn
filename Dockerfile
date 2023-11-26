FROM kylemanna/openvpn:latest

# Install necessary tools
RUN apt-get update && \
    apt-get install -y \
    easy-rsa \
    openvpn-auth-ldap \
    && rm -rf /var/lib/apt/lists/*

# Expose ports
EXPOSE 1194/udp

# Copy your OpenVPN configuration files
COPY openvpn /etc/openvpn

# Copy admin panel files
COPY admin-panel /admin-panel

# Set up entry point
ENTRYPOINT ["/entrypoint.sh"]

# Default command
CMD ["ovpn_run"]
