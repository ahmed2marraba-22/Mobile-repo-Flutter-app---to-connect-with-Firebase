# Processing Worker Boundary

Heavy GDAL/QGIS/raster/DEM/geoprocessing jobs execute asynchronously. API endpoints create jobs; workers execute them and publish durable outputs to object storage with metadata in PostGIS.
