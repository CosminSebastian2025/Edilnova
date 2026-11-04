# EdilNova - Sito Vetrina Edilizia

Questo repository contiene il sito vetrina interattivo e responsive per un'azienda di edilizia e ristrutturazioni (**EdilNova**), pronto per la pubblicazione su **GitHub Pages** e containerizzato tramite **Docker** e **Kubernetes**.

Il modulo contatti è solo front-end e non invia richieste: prima di usarlo per raccogliere contatti va collegato a un servizio di invio.

---

## 📁 Struttura della Cartella

```text
edilnova-website/
│
├── index.html                  # File HTML principale
├── css/
│   └── style.css              # Fogli di stile CSS responsive
├── js/
│   └── script.js              # Logica JavaScript (menu mobile, form)
│
├── Dockerfile                 # Definizione container Nginx
├── docker-compose.yml         # Configurazione per testing locale Docker
│
├── k8s/
│   └── deployment.yaml        # Manifest Kubernetes (Deployment + Service)
│
└── .github/
    └── workflows/
        └── deploy.yml         # Workflow GitHub Actions per auto-deploy su GitHub Pages
```

---

## 🚀 Guida Rapida alla Pubblicazione

### 1. Pubblicare su GitHub Pages (Gratuito)

1. Crea un nuovo repository su GitHub (es. `edilnova-website`).
2. Clona o inserisci i file di questa cartella nel repository locale:
   ```bash
   git init
   git add .
   git commit -m "Initial commit - Sito EdilNova"
   git branch -M main
   git remote add origin https://github.com/TUO_UTENTE/edilnova-website.git
   git push -u origin main
   ```
3. Vai nelle impostazioni del repository su GitHub (**Settings** > **Pages**).
4. Sotto **Build and deployment**:
   - **Source**: Seleziona `GitHub Actions` (verrà eseguito automaticamente il workflow `.github/workflows/deploy.yml`), oppure seleziona `Deploy from a branch` scegliendo `main` / `/ (root)`.
5. In un paio di minuti il tuo sito sarà online all'indirizzo `https://TUO_UTENTE.github.io/edilnova-website/`.

---

## 🐳 Docker & Kubernetes (Deployment Avanzato / Cloud)

### Run locale con Docker Compose
Per testare il sito in locale tramite Docker:
```bash
docker compose up --build -d
```
Il sito sarà visibile all'indirizzo `http://localhost:8080`. Questa configurazione è
per lo sviluppo locale e serve il sito in HTTP; HTTPS va configurato sul reverse proxy
o sull'ambiente di hosting.

### Deploy su Kubernetes
Se desideri distribuire l'applicazione in un cluster Kubernetes (es. Minikube, Kind o Cloud Provider):

1. **Build dell'immagine**:
   ```bash
   docker build -t edilnova-website:latest .
   ```
2. **Applicazione dei file manifest**:
   ```bash
   kubectl apply -f k8s/deployment.yaml
   ```
3. **Verifica dello stato**:
   ```bash
   kubectl get pods
   kubectl get svc edilnova-service
   ```
