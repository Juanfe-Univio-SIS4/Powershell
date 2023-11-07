$RutaBusqueda = Read-Host "Introduce la ruta de busqueda (ex: C:\Ruta\Raiz):"

if (Test-Path -Path $RutaBusqueda) {

    $Tipo = Read-Host "Vols buscar ficheros o directorios? (Documento*/Carpeta de archivos):"


    $Resultados = Get-ChildItem -Path $RutaBusqueda -Recurse -File | Where-Object { $_.PSIsContainer -eq ($Tipo -eq 'directorios') }

    if ($Resultados.Count -gt 0) {
 
        Write-Host "Los siguientes $Tipo se han encontrado en la ruta $RutaBusqueda :"
        $Resultados | ForEach-Object {
            Write-Host $_.FullName
        }
    } else {
        Write-Host "No se han encontrado $Tipo en la ruta $RutaBusqueda."
    }
} else {
    Write-Host "La ruta especificada no existe."
}
