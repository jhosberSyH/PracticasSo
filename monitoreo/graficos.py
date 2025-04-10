import pandas as pd
import matplotlib.pyplot as plt
# Este script funciona apropiadamente con python3-tk gracias a matplotlib, sudo apt install python3-tk
# Leer el archivo CSV
data = pd.read_csv("monitoreo_sistema.csv")

# Graficar el uso de CPU
plt.plot(data["Fecha"], data["CPU Usado (%)"], label="CPU Usado (%)")
plt.plot(data["Fecha"], data["CPU Libre (%)"], label="CPU Libre (%)")
plt.title("Monitoreo del Uso de CPU")
plt.xlabel("Fecha")
plt.ylabel("Porcentaje (%)")
plt.legend()
plt.xticks(rotation=45)
plt.tight_layout()
plt.show()

#Ram
plt.plot(data["Fecha"], data["RAM Total"], label="RAM Total")
plt.plot(data["Fecha"], data["RAM Usada"], label="RAM Usada")
plt.plot(data["Fecha"], data["RAM Libre"], label="RAM Libre")
plt.title("Monitoreo del Uso de RAM")
plt.xlabel("Fecha")
plt.ylabel("Uso de RAM")
plt.legend()
plt.xticks(rotation=45)
plt.tight_layout()
plt.show()

# Disco
plt.plot(data["Fecha"], data["Disco Total"], label="Disco Total")
plt.plot(data["Fecha"], data["Disco Usado"], label="Disco Usado")
plt.plot(data["Fecha"], data["Disco Disponible"], label="Disco Disponible")
plt.title("Monitoreo del Uso de Disco")
plt.xlabel("Fecha")
plt.ylabel("Uso de Disco")
plt.legend()
plt.xticks(rotation=45)
plt.tight_layout()
plt.show()
