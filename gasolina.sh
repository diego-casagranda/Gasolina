#!/bin/bash
#
#===============================================================================
#
# File...........: gasolina.sh
# Title..........: System Test ShellScript
# Program........: Shell Template Code -  GNU/Linux
#
# Description....: Exibe o valor da gasolina para o estado de SP
#
# Copyright......: Copyright(c) 2024 / @Diego.Casagranda - HackLab
# License........: GNU GENERAL PUBLIC LICENSE - Version 3, 29 June 2007
#
# Author.........: Diego Casagranda
# E-Mail.........: diego.casagranda@yahoo.com
#
# Dependency.....: None
#
# Date...........: 21/07/2024
# Update.........: None
#
# Version........: 0.1.0
#
#===============================================================================
#
# ###########
# # History #
# ###########
#
#     21/07/2024 : Criação do codigo
#
#===============================================================================

# URL da página
url="https://precos.petrobras.com.br/w/gasolina/sp"

# Baixa o conteúdo da página e extrai o valor do campo <p id="telafinal-precofinal">
preco=$(curl -s "$url" | grep -oP '(?<=<p class="h4 real-value" data-lfr-editable-type="text" data-lfr-editable-id="telafinal-precofinal" id="telafinal-precofinal">)[^<]+')

# Exibe o resultado
if [ -n "$preco" ]; then
    echo "Gasolina SP: R$ $preco"
else
    echo "Não foi possível obter o preço da gasolina."
fi
