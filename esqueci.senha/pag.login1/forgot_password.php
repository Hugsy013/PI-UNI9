<?php
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $email = $_POST['email'];

    // Simulação de verificação de e-mail no banco de dados
    if ($email === 'usuario@exemplo.com') {
        echo "Instruções para recuperação de senha foram enviadas para: $email";
    } else {
        echo "E-mail não encontrado!";
    }
}
?>
<a href="index.html">Voltar ao Login</a>
