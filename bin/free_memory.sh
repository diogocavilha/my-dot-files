#!/bin/bash

echo ""
echo "=> Exibindo o consumo da memória RAM..."
echo ""

sudo free -h

echo ""
echo "=> Limpando Cache da Memória RAM..."
echo ""

echo 3 > /proc/sys/vm/drop_caches
sysctl -w vm.drop_caches=3

echo ""
echo "=> Limpando SWAP..."
echo ""

swapoff -a && swapon -a

echo ""
echo "=> Limpeza do Cache da Memória RAM efetuada com sucesso."
echo "=> Exibindo o consumo da mamória RAM..."
echo ""

free -h

