<?php
require_once("conexaobd.php");
?>

<?php
include("sessao_verifica.php");
$idAdmin = $_SESSION['idAdmin'];

$permissao = "SELECT * FROM tb_admin where idAdmin = {$idAdmin}";
$rs_permissao = mysqli_query($conn_bd_sim, $permissao) or die($mysqli_error($conn_bd_sim));
$row_rs_permissao = mysqli_fetch_assoc($rs_permissao);

$ClientePF = "select * from tb_pf inner join tb_veiculo on tb_pf.idVeiculo = tb_veiculo.idVeiculo order by tb_pf.idPf DESC;";

$rs_PF = mysqli_query($conn_bd_sim, $ClientePF) or die($mysqli_error($conn_bd_sim));

$row_rs_PF = mysqli_fetch_assoc($rs_PF);
?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Listagem de Clientes</title>
    <link rel="stylesheet" href="Lista.css">
</head>
<body>
    <header>
        <div class="logo">
            <img src="imagens/logo1.png" alt="Logo">
        </div>
        <div class="user-button">
            <img src="imagens/usuario.png" alt="Usuário">
            <ul class="dropdown-menu">
            <li><a href="logout.php">Sair</a></li>
        </ul>
    </div>
        <div class="add-client" <?php if($row_rs_permissao['permissao'] != 'c' && $row_rs_permissao['permissao'] != 'ce' && $row_rs_permissao['permissao'] != 'a'){echo('style="display: none;"');}?>>
            <a href="cpf.php?" title="Cadastrar Cliente">
                <img src="imagens/inserir.png" alt="Inserir Registro" class="add-icon">
            </a>    
        </div>
    </header>
    <section class="client-list">
        <div class="header">
            <h2>Listagem de Clientes</h2>
        </div>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Clientes</th>
                    <th>E-mail</th>
                    <th>Celular</th>
                    <th>Veículo</th>
                    <th>Placa</th>
                    <th>Ações</th>
                </tr>
            </thead>
            <tbody>
                <?php do { ?>
                    <tr>
                        <td><?php echo ($row_rs_PF['idPf']); ?></td>
                        <td><?php echo ($row_rs_PF['nome']); ?></td>
                        <td><?php echo ($row_rs_PF['email']); ?></td>
                        <td><?php echo ($row_rs_PF['celular']); ?></td>
                        <td><?php echo ($row_rs_PF['marca']." ".$row_rs_PF['modelo']); ?></td>
                        <td><?php echo ($row_rs_PF['placa']); ?></td>
                        <td class="action-cell">
                            <a href="Visualizar.php?idPf=<?php echo($row_rs_PF['idPf']);?>">
                                <img src="imagens/visualizar.png" alt="Visualizar" class="action-icon" title="Visualizar Cadastro">
                            </a>
                            <a href="cpf_editar.php?idPf=<?php echo($row_rs_PF['idPf']);?>" <?php if($row_rs_permissao['permissao'] != 'e' && $row_rs_permissao['permissao'] != 'ce' && $row_rs_permissao['permissao'] != 'a'){echo('style="display: none;"');}?>>
                                <img src="imagens/editar.png" alt="Editar" class="action-icon" title="Editar registro">
                            </a>
                            <a href="delete.php?idPf=<?php echo($row_rs_PF['idPf']);?>" onclick="return confirm('Tem certeza que deseja excluir este registro?');">
                                <img src="imagens/deletar.png" alt="Excluir" class="action-icon" title="Excluir registro">
                            </a>
                        </td>
                    </tr>
                <?php } while($row_rs_PF = mysqli_fetch_assoc($rs_PF)) ?>
            </tbody>
        </table>
    </section>
    <?php 
        mysqli_free_result($rs_PF);
        mysqli_free_result($rs_permissao);
        mysqli_close($conn_bd_sim);
    ?>
</body>
</html>
