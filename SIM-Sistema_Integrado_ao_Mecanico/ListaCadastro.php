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
            <h1>Sistema Integrado ao Mecânico</h1>
        </div>
        <div class="user-button">
        <img src="imagens/usuario.png" alt="Usuário">
    </div>
    </header>
    <main>
        <section class="client-list">
            <div class="header">
                <h2>Listagem de Clientes</h2>
                <div class="add-client">
                <img src="imagens/inserir.png" alt="Inserir Registro" style="width: 45px; height: 30p'x;" title="Cadastrar Cliente"></td>    
              </div>
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

        <?php do {?>
            
          <tr>
            <td><?php echo ($row_rs_PF['idPf']); ?></td>
            <td><?php echo ($row_rs_PF['nome']); ?></td>
            <td><?php echo ($row_rs_PF['email']); ?></td>
            <td><?php echo ($row_rs_PF['celular']); ?></td>
            <td><?php echo ($row_rs_PF['marca']." ".$row_rs_PF['modelo']); ?></td>
            <td><?php echo ($row_rs_PF['placa']); ?></td>
        <!-- Deletar --><td <?php if($row_rs_permissao['permissao'] != 'd' && $row_rs_permissao['permissao'] != 'a'){echo('style="display: none;"');}?>><a href="delete.php?idPf=<?php echo($row_rs_PF['idPf']);?>" onclick="return confirm('Tem certeza que deseja excluir este registro?');">
              <img src="imagens/deletar.png" alt="Excluir" style="width: 20px; height: 20px;" title="Excluir registro"></td> 
        <!-- Visualizar --><td><a href="Visualizar.php?idPf=<?php echo($row_rs_PF['idPf']);?>">
              <img src="imagens/visualizar.png" alt="Visualizar" style="width: 20px; height: 20px;" title="visualizar Cadastro"></td>
          <!-- Editar --><td <?php if($row_rs_permissao['permissao'] != 'e' && $row_rs_permissao['permissao'] != 'ce' && $row_rs_permissao['permissao'] != 'a'){echo('style="display: none;"');}?>><a href="cpf_editar.php?idPf=<?php echo($row_rs_PF['idPf']);?>">
          <img src="imagens/editar.png" alt="Editar" style="width: 20px; height: 20px;" title="Editar registro"></td>
          <!-- Inserir --><td <?php if($row_rs_permissao['permissao'] != 'c' && $row_rs_permissao['permissao'] != 'ce' && $row_rs_permissao['permissao'] != 'a'){echo('style="display: none;"');}?>><a href="cpf.php?">
            <img src="imagens/inserir.png" alt="Inserir" style="width: 20px; height: 20px;" title="Inserir registro"></td>
            </tr>

          <?php } while($row_rs_PF = mysqli_fetch_assoc($rs_PF))?>
          <!-- Outras linhas podem ser adicionadas aqui -->
        </tbody>
      </table>
    
      <?php 
	mysqli_free_result($rs_PF);
  mysqli_free_result($rs_permissao);
	mysqli_close($conn_bd_sim);
	
	?>

    </body>
    </html>