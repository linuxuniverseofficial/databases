#!/bin/bash

DB="empresa.db"

# Função para escapar strings (substitui ' por '')
esc() { printf "%s" "$1" | sed "s/'/''/g"; }

inserir_cliente() {
    local nome email
    nome=$(esc "$1")
    email=$(esc "$2")
    sqlite3 "$DB" "INSERT INTO clientes (nome, email) VALUES ('$nome', '$email');"
}

buscar_cliente() {
    local id="$1"
    sqlite3 -column -header "$DB" "SELECT * FROM clientes WHERE id = $id;"
}

atualizar_nome() {
    local id="$1"
    local nome
    nome=$(esc "$2")
    sqlite3 "$DB" "UPDATE clientes SET nome = '$nome' WHERE id = $id;"
}

remover_cliente() {
    local id="$1"
    sqlite3 "$DB" "DELETE FROM clientes WHERE id = $id;"
}

# Uso
inserir_cliente "Carlos Lima" "carlos@exemplo.com"
inserir_cliente "Ana's Bar"   "ana@exemplo.com"   # nome com apóstrofo — tratado

buscar_cliente 1
atualizar_nome 1 "Carlos Lima Jr."
remover_cliente 3
