<?php
// Configuração de conexão com o banco de dados
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "CadastroClientes";

// Cria a conexão
$conn = new mysqli($servername, $username, $password, $dbname);

// Verifica se a conexão foi estabelecida corretamente
if ($conn->connect_error) {
    die("Falha na conexão: " . $conn->connect_error);
}

// Verifica se o ID foi passado pela URL
if (isset($_GET['id'])) {
    $id = intval($_GET['id']); // Converte o ID para inteiro para segurança

    // Prepara a query para excluir o registro
    $sql = "DELETE FROM PessoaJuridica WHERE id = ?"; // Altere o nome da tabela conforme necessário
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $id);

    // Executa a exclusão
    if ($stmt->execute()) {
        echo "Registro excluído com sucesso.";
    } else {
        echo "Erro ao excluir o registro: " . $stmt->error;
    }

    // Fecha a conexão
    $stmt->close();
    $conn->close();

    // Redireciona de volta para a lista de clientes
    header("Location: list_clients.php"); // Altere para o nome correto do arquivo de listagem
    exit();
} else {
    echo "ID não fornecido para exclusão.";
}
?>
