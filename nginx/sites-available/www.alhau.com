#alexa oauth service - alhau - 
upstream node_alhau {
    #by default load balancing is round-robin
    #ip_hash;
    
    server 172.18.0.1:4400;
    
    keepalive 8;
}


server {
    listen 80;
    server_name www.alhau.com;

    location / {
        proxy_pass http://node_alhau;
        proxy_set_header X-Real-IP  $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header Host $host;
    }
}
