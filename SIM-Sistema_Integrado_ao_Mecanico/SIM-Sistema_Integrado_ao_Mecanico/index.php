<?php require_once("conexaobd.php"); ?>

<?php
include("sessao_verifica.php");
$idAdmin = $_SESSION['idAdmin'];

$permissao = "SELECT * FROM tb_admin where idAdmin = {$idAdmin}";
$rs_permissao = mysqli_query($conn_bd_sim, $permissao) or die($mysqli_error($conn_bd_sim));
$row_rs_permissao = mysqli_fetch_assoc($rs_permissao);


//Leitura = r
//Inserir = c
//Deletar = d
//Editar = e
//Inserir e editar = ce
//Admin = a
?>



<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Menu Principal</title>
    <link rel="stylesheet" href="style.css"> <!-- Link para o arquivo CSS -->
</head>
<body>

    <!-- Navbar lateral esquerda -->
    <div class="sidebar">
        <img src="imagens/logo2.png" alt="Logo"> <!-- Logo na sidebar -->
        <h2>Menu</h2> <!-- Título oculto -->
        <a href="#" title="Configurações"><img src="imagens/engrenagem.png" alt="Configurações" style="width: 30px; height: 30px;"></a> <!-- Link de Configurações com imagem -->
        <a href="#" title="Segurança"><img src="imagens/cadeado.png" alt="Segurança" style="width: 30px; height: 30px;"></a> <!-- Link de Segurança com imagem -->
    </div>
        
        <!-- Adicionando a imagem no conteúdo principal -->
        <div class="logo-container">
            <img src="/SIM-Sistema_Integrado_ao_Mecanico/imagens/logo1.png" alt="Imagem Principal" class="centralizar-logo"> <!-- Classe para centralizar a imagem -->
        </div>

        <!-- Container dos cards -->
        <div class="card-container">
            <div class="card" <?php if($row_rs_permissao['permissao'] != 'a'){
            if($row_rs_permissao['permissao'] != 'c'){if($row_rs_permissao['permissao'] != 'ce') {echo('style="display: none;"');}} 
        }?>>
                <img src="imagens/CadastroPF.png" alt="Cadastro PF">
                <a href="formularioPF.html">Cadastro PF</a>
            </div>
            <div class="card" <?php if($row_rs_permissao['permissao'] != 'a'){
             if($row_rs_permissao['permissao'] != 'c'){if($row_rs_permissao['permissao'] != 'ce') {echo('style="display: none;"');}}
            }?>>
                <img src="imagens/CadastroPJ.png" alt="Cadastro PJ">
                <a href="formularioPJ.html">Cadastro PJ</a>
            </div>
            <div class="card" <?php if($row_rs_permissao['permissao'] != 'a'){
             if($row_rs_permissao['permissao'] != 'c'){if($row_rs_permissao['permissao'] != 'ce') {echo('style="display: none;"');}}
            }?>>
                <img src="imagens/Pedido.png" alt="Pedido">
                <a href="#">Pedido</a>
            </div>
            <div class="card" <?php //if($row_rs_permissao['permissao'] != 'a'){
             //if($row_rs_permissao['permissao'] != 'r'){echo('style="display: none;"');}
            //}?>>
                <img src="imagens/Usuário.png" alt="Usuário">
                <a href="ListaCadastro.php">Clientes</a>
            </div>
            <div class="card" <?php if($row_rs_permissao['permissao'] != 'a'){
            if($row_rs_permissao['permissao'] != 'c'){if($row_rs_permissao['permissao'] != 'ce') {echo('style="display: none;"');}}
            }?>>
                <img src="imagens/Veiculo.png" alt="Veículo">
                <a href="#">Veículo</a>
    
        </div>
    </div>

    <!-- Botão de usuário no canto superior direito -->
    <div class="user-button">
        <img src="imagens/usuario.png" alt="Usuário">
    </div>
</body>
</html>
