#!/bin/bash

# Archivo de salida para almacenar los datos
output_file="monitoreo_sistema.csv"

# Recoger datos
fecha=$(date "+%Y-%m-%d %H:%M:%S")
cpu_used=$(top -bn1 | grep "Cpu(s)" | awk -F',' '{print $1}' | awk '{print $2}')
cpu_free=$(top -bn1 | grep "Cpu(s)" | awk -F',' '{print $4}' | awk '{print $1}')
mem_data=$(free -h | awk '/Mem/ {print $2 "," $3 "," $4}')
disk_data=$(df -h | awk '$NF=="/" {print $2 "," $3 "," $4}')

# Agregar los datos al archivo CSV
echo "$fecha,$cpu_used,$cpu_free,$mem_data,$disk_data" >> $output_file
