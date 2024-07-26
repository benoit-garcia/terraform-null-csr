[ req ]
prompt = no
distinguished_name = dn
req_extensions = req_ext

[ dn ]
CN = ${cn}
C = ${country}
L = ${location}
O = ${organization}

[ req_ext ]
%{if san != ""}subjectAltName = ${san}%{endif}
