#alexa oauth service - alhau - 
upstream node_alhau {
    #by default load balancing is round-robin
    #ip_hash;
    
    server 172.18.0.1:4400;
    
    keepalive 8;
}

server {
    listen 80;
    listen [::]:80;
    server_name www.alhau.com alhau.com;

    # Discourage deep links by using a permanent redirect to home page of HTTPS site
    #return 301 https://$host;

    # Alternatively, redirect all HTTP links to the matching HTTPS page
     return 301 https://$host$request_uri;
}

server {
    listen 443 ssl http2;
    #listen [::]:443 ssl http2;

    server_name www.alhau.com alhau.com;

    error_log /var/log/nginx/alhau_error.log;
    access_log /var/log/nginx/alhau_access.log;

   ssl_certificate    /etc/letsencrypt/live/alhau.com/fullchain.pem;
   ssl_certificate_key  /etc/letsencrypt/live/alhau.com/privkey.pem;
   ssl_ciphers ECDHE-RSA-AES256-GCM-SHA512:DHE-RSA-AES256-GCM-SHA512:ECDHE-RSA-AES256-GCM-SHA384:DHE-RSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-SHA384;
   ssl_session_timeout  10m;
   ssl_session_cache shared:SSL:10m;
   ssl_prefer_server_ciphers on; 
    #ssl_trusted_certificate /etc/letsencrypt/live/alhau.com/fullchain.pem;    
  
   # Enable OCSP stapling (http://blog.mozilla.org/security/2013/07/29/ocsp-stapling-in-firefox)
   #ssl_stapling on;
   #ssl_stapling_verify on;
   #resolver 8.8.8.8 8.8.4.4 valid=300s;
   #resolver_timeout 5s;



    charset utf-8;

    location / {
        proxy_pass http://node_alhau;
        proxy_set_header X-Real-IP  $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header Host $host;
    }

    #error_log /var/log/nginx/alhau_error.log;
    #access_log /var/log/nginx/alhau_access.log;
}
