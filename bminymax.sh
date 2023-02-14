#!/bin/bash
cantConsumos=`cat consumos.txt | tail -n+2 | wc -l`

maximo=`cat consumos.txt | awk '{print $4}' | head -2 | tail -1`
minimo=`cat consumos.txt | awk '{print $4}' | head -2 | tail -1`

for i in `seq 1 $cantConsumos`; do
i=$((i+1))
ciudad=`cat consumos.txt | awk '{print $1}' | head -$i | tail -1`
mes=`cat consumos.txt | awk '{print $2}' | head -$i | tail -1`
anyo=`cat consumos.txt | awk '{print $3}' | head -$i | tail -1`
consumo=`cat consumos.txt | awk '{print $4}' | head -$i | tail -1`

if [ $consumo -lt $minimo ]
then
minimo=$consumo
ciudadMin=`cat consumos.txt | awk '{print $1}' | head -$i | tail -1`
mesMin=`cat consumos.txt | awk '{print $2}' | head -$i | tail -1`
anyoMin=`cat consumos.txt | awk '{print $3}' | head -$i | tail -1`
fi

if [ $consumo -gt $maximo ]
then
maximo=$consumo
ciudadMax=`cat consumos.txt | awk '{print $1}' | head -$i | tail -1`
mesMax=`cat consumos.txt | awk '{print $2}' | head -$i | tail -1`
anyoMax=`cat consumos.txt | awk '{print $3}' | head -$i | tail -1`
fi
done

echo
echo "Los datos de la ciudad con el consumo mínimo son:"
echo "Ciudad: $ciudadMin"
echo "Mes: $mesMin"
echo "Año: $anyoMin"

echo
echo "Los datos de la ciudad con el consumo máximo son:"
echo "Ciudad: $ciudadMax"
echo "Mes: $mesMax"
echo "Año: $anyoMax"