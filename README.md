POC Maven Azure App (Container)

Aplicación Java Spring Boot "Hola mundo" preparada para desplegar en Azure Web App for Containers.

Ejecutar local
- Requisitos: Java 21, Maven, Docker (opcional)
- Maven: `mvn spring-boot:run` y abre http://localhost:8080

Docker
- `docker build -t poc-maven-azure-app:dev .`
- `docker run --rm -p 8080:8080 poc-maven-azure-app:dev`
- Abre http://localhost:8080

Azure Pipelines (CI/CD)
- Edita variables en `azure-pipelines.yml`:
  - `azureSubscription`: Service connection ARM a tu suscripción
  - `containerRegistryServiceConnection`: Service connection al ACR
  - `acrLoginServer`: p.ej. `miacr.azurecr.io`
  - `webAppName`: nombre de la Web App (Linux, contenedores)
  - `environmentName`: (opcional) nombre de environment en Azure DevOps
- Flujo: compila JAR -> build/push imagen -> despliegue a Web App

Endpoints
- `/` -> "Hola mundo"
- `/health` -> "OK"

