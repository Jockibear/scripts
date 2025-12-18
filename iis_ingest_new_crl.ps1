cp C:\Certificates_TEMP\jocki01-root-CA.crl C:\CertEnroll\
cp C:\Certificates_TEMP\jocki01-Issuing-CA.crl C:\CertEnroll\
cp C:\Certificates_TEMP\jocki01-Issuing-CA+.crl C:\CertEnroll\
certutil -f -dspublish C:\CertEnroll\jocki01-root-CA.crl
certutil -f -dspublish C:\CertEnroll\jocki01-Issuing-CA.crl
certutil -f -dspublish C:\CertEnroll\jocki01-Issuing-CA+.crl