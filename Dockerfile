# Utilizza un'immagine Nginx leggera basata su Alpine Linux
FROM nginx:alpine

# Copia i file statici del sito nella cartella predefinita di Nginx
COPY . /usr/share/nginx/html

# Rimuovi i file di configurazione Docker e Kubernetes dalla cartella web se presenti
RUN rm -rf /usr/share/nginx/html/Dockerfile            \
    /usr/share/nginx/html/docker-compose.yml            \
    /usr/share/nginx/html/k8s

# Esponi la porta 80
EXPOSE 80 443

# Avvia Nginx
CMD ["nginx", "-g", "daemon off;"]
