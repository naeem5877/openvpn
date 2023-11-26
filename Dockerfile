FROM ubuntu:latest

# Install necessary packages
RUN apt-get update && \
    apt-get install -y samba vim vsftpd

# Create a Samba user
RUN useradd sambauser -m -s /sbin/nologin -G nogroup

# Set the Samba user password
RUN echo "sambauser:sambapassword" | chpasswd

# Configure vsftpd
RUN echo "local_enable=YES" >> /etc/vsftpd.conf

# Expose Samba and FTP ports
EXPOSE 137/udp 138/udp 139 445 21

# Start Samba and vsftpd services
CMD service smbd start && service vsftpd start && tail -f /dev/null
