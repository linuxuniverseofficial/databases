<?php
// Conecta ao SQLite (PDO funciona igual para MySQL/Postgres depois)
try {
    $pdo = new PDO('sqlite:/var/www/db/empresa.db');
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die('Erro de conexão: ' . $e->getMessage());
}

// ── INSERT ───────────────────────────────────────────
$stmt = $pdo->prepare(
    "INSERT INTO clientes (nome, email) VALUES (:nome, :email)"
);
$stmt->execute([':nome' => 'Carlos Lima', ':email' => 'carlos@exemplo.com']);

// ── SELECT ───────────────────────────────────────────
$stmt = $pdo->query("SELECT * FROM clientes WHERE ativo = 1");
$clientes = $stmt->fetchAll(PDO::FETCH_ASSOC);

// ── UPDATE ───────────────────────────────────────────
$stmt = $pdo->prepare(
    "UPDATE clientes SET nome = :nome WHERE id = :id"
);
$stmt->execute([':nome' => 'Carlos Lima Jr.', ':id' => 3]);

// ── DELETE ───────────────────────────────────────────
$stmt = $pdo->prepare("DELETE FROM clientes WHERE id = :id");
$stmt->execute([':id' => 3]);
?>
