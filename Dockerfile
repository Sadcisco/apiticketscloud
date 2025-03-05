# Usa la imagen oficial de Python
FROM python:3.11

# Define la carpeta de trabajo dentro del contenedor
WORKDIR /app

# Copia solo requirements.txt primero (optimización de cache)
COPY requirements.txt requirements.txt

# Instala dependencias
RUN pip install -r requirements.txt

# Copia todo el código al contenedor
COPY . .

# Expone el puerto que usa Flask (Cloud Run usa 8080 por defecto)
EXPOSE 8080

# Comando para iniciar la app
CMD ["python", "app.py"]
