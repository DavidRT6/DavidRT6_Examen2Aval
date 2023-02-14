#!/bin/bash
cantConsumos=`cat consumos.txt | tail -n+2 | wc -l`
decreciente=0

echo
echo "Las ciudades que han tenido un consumo decreciente han sido:"

for i in `seq 1 $cantConsumos`; do
i=$((i+1))
ciudad=`cat consumos.txt | awk '{print $1}' | head -$i | tail -1`
consumo=`cat consumos.txt | awk '{print $4}' | head -$i | tail -1`
mes=`cat consumos.txt | awk '{print $2}' | head -$i | tail -1`
echo $mes
i=$((i-1))
ciudadAnterior=`cat consumos.txt | awk '{print $1}' | head -$i | tail -1`
i=$((i+1))

if [ $mes = 'Enero' ]
then
if [ $decreciente = 1 ]
then
echo $ciudadAnterior
fi
decreciente=1
consumoAnterior=`cat consumos.txt | awk '{print $4}' | head -$i | tail -1`
fi

if [ $consumo -le $consumoAnterior ]
then
if [ $decreciente -eq 1 ]
then
decreciente=1
consumoAnterior=$consumo
fi
else
decreciente=0
fi
done