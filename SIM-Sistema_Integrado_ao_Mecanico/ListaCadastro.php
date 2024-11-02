<?php
require_once("conexaobd.php");
?>

<?php

$ClientePF = "select * from tb_pf inner join tb_veiculo on tb_pf.idVeiculo = tb_veiculo.idVeiculo order by tb_pf.idPf DESC;";

$rs_PF = mysqli_query($conn_bd_sim, $ClientePF) or die($mysqli_error($conn_bd_sim));

$row_rs_PF = mysqli_fetch_assoc($rs_PF);



?>


<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Formulário CNPJ</title>
    <link rel="stylesheet" href="formularioCAD.css">
</head>
<body>

    <div class="sidebar">
        <img src="imagens/logo2.png" alt="Logo">
        <a href="#" title="Configurações"><img src="imagens/engrenagem.png" alt="Configurações" style="width: 30px; height: 30px;"></a>
        <a href="#" title="Segurança"><img src="imagens/cadeado.png" alt="Segurança" style="width: 30px; height: 30px;"></a>
    </div>

    <div class="logo-container">
        <img src="imagens/logo1.png" alt="Logo do Conteúdo Principal">
    </div>
    <div class="user-button">
        <img src="imagens/usuario.png" alt="Usuário">
    </div>
    <table>
        <thead>
          <tr>
            <th>idPF</th>
            <th>nome</th>
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
            <td><a href="delete.php?idPf=<?php echo($row_rs_PF['idPf']);?>" onclick="return confirm('Tem certeza que deseja excluir este registro?');">
              <img src="imagens/lixeira.png" alt="Excluir" style="width: 20px; height: 20px;" title="Excluir registro"></td>
              <td><a href="Visualizar.php?idPf=<?php echo($row_rs_PF['idPf']);?>">
              <img src="imagens/lixeira.png" alt="Visualizar" style="width: 20px; height: 20px;" title="visualizar Cadastro"></td>
          </tr>

          <?php } while($row_rs_PF = mysqli_fetch_assoc($rs_PF))?>
          <!-- Outras linhas podem ser adicionadas aqui -->
        </tbody>
      </table>
    
      <?php 
	mysqli_free_result($rs_PF);
	
	mysqli_close($conn_bd_sim);
	
	?>

    </body>
    </html>