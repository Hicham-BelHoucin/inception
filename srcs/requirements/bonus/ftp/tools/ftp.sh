#!bin/sh

adduser --disabled-password --gecos "" $FTP_USER

echo "$FTP_USER:$FTP_PWD" | chpasswd

echo "$FTP_USER" | tee -a /etc/vsftpd.userlist 

mkdir -p /var/run/vsftpd/empty
mkdir -p /home/$FTP_USER/ftp_dir
chmod 550 /home/$FTP_USER/ftp_dir
# chmod -R 750 /home/$FTP_USER/ftp_dir/upload
chown -R $FTP_USER: /home/$FTP_USER/ftp_dir

echo "anonymous_enable=NO" >> /etc/vsftpd.conf
echo "local_enable=YES" >> /etc/vsftpd.conf
echo "write_enable=YES" >> /etc/vsftpd.conf
echo "chroot_local_user=YES" >> /etc/vsftpd.conf
echo "allow_writeable_chroot=YES" >> /etc/vsftpd.conf
echo "userlist_enable=YES" >> /etc/vsftpd.conf
echo "userlist_file=/etc/vsftpd.userlist" >> /etc/vsftpd.conf
echo "userlist_deny=NO" >> /etc/vsftpd.conf

vsftpd