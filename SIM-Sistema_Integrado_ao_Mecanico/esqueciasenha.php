


<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Plataforma SIM - Login</title>
    <link rel="stylesheet" href="esqueciasenha.css">
</head>
<body>
    <div class="login-container">
        <div class="login-box">
            <img src="imagens/logo2.png" alt="Logo" class="logo">
            <h2>Seja bem-vindo à plataforma SIM</h2>
            <p>Faça login abaixo para acessar</p>
            <?php if (isset($error)) echo "<p style='color: red;'>$error</p>"; ?>
            <form action="esqueciasenha.html" method="POST">
                <div class="input-group">
                    <input type="text" name="username" placeholder="Digite o seu nome de usuário" required>
                </div>
                <div class="input-group">
                    <input type="password" name="password" placeholder="Digite a sua senha" required>
                </div>
                <a href="forgot.html" class="forgot-password">Esqueci minha senha</a>
                <button type="submit" class="login-btn">Login</button>
            </form>
        </div>
    </div>
</body>
</html>
