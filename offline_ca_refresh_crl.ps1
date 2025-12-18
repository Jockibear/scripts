certutil.exe -CRL
cd %systemroot%\System32\CertSrv\CertEnroll\
mv "3.crl" "jocki01-root-CA.crl"
cp jocki01-root-CA.crl \\CRL\Certificates_TEMP\