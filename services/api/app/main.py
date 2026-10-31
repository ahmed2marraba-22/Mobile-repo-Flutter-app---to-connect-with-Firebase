from fastapi import FastAPI
from app.api.integration import router
from app.api.field_runtime import router as field_router
from app.api.auth import router as auth_router
from app.api.field_lifecycle import router as lifecycle_router
from app.api.projection import router as projection_router

app = FastAPI(title="GeoFlow Unified API", version="1.1.5")
app.include_router(router, prefix="/api/v1")
app.include_router(field_router, prefix="/api/v1")
app.include_router(auth_router, prefix="/api/v1")
app.include_router(lifecycle_router, prefix="/api/v1")
app.include_router(projection_router, prefix="/api/v1")

@app.get("/health")
def health():
    return {"status":"ok","service":"geoflow-api","version":"1.1.5"}

@app.get("/ready")
def ready():
    return {"status":"ready","dependencies":{"postgis":"external","redis":"external","minio":"external"}}
