#!/bin/bash

DB="empresa.db"

# ── Criar tabela ─────────────────────────────────────
sqlite3 "$DB" <<'SQL'
CREATE TABLE IF NOT EXISTS clientes (
    id      INTEGER PRIMARY KEY AUTOINCREMENT,
    nome    TEXT    NOT NULL,
    email   TEXT    UNIQUE NOT NULL,
    ativo   INTEGER DEFAULT 1
);
SQL

# ── INSERT ───────────────────────────────────────────
sqlite3 "$DB" "INSERT INTO clientes (nome, email) VALUES ('João Silva', 'joao@exemplo.com');"
sqlite3 "$DB" "INSERT INTO clientes (nome, email) VALUES ('Maria Souza', 'maria@exemplo.com');"

# ── SELECT (com saída formatada) ─────────────────────
echo "=== Clientes cadastrados ==="
sqlite3 -column -header "$DB" "SELECT * FROM clientes WHERE ativo = 1;"

# ── UPDATE ───────────────────────────────────────────
sqlite3 "$DB" "UPDATE clientes SET email = 'joao.novo@exemplo.com' WHERE id = 1;"

# ── DELETE ───────────────────────────────────────────
sqlite3 "$DB" "DELETE FROM clientes WHERE id = 2;"

echo "=== Após edição/remoção ==="
sqlite3 -column -header "$DB" "SELECT * FROM clientes;"
