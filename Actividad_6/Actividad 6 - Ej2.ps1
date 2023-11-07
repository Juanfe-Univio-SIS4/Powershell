$Ruta = Read-Host "Introduce la ruta absoluta del directorio que deseas copiar"

if (Test-Path -Path $Ruta){
    $Destino = Read-Host "Introduce la ruta absoluta del directorio donde se guardara la copia de seguridad"
    if (Test-Path -Path $Destino){
        Copy-Item -Path $Ruta -Destination $Destino -Recurse
        Write-Host "Copia completada"
    }else{
        Write-Host "El directorio de destino no se encuentra"
    }
}else{
    Write-Host "El directorio a copiar no existe"
}