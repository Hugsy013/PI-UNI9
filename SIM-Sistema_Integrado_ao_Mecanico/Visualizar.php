<?php
require_once("conexaobd.php");
?>

<?php

include("sessao_verifica.php");

$idPf = $_GET ['idPf'];

$ClientePF = "select * from tb_pf inner join tb_veiculo on tb_pf.idVeiculo = tb_veiculo.idVeiculo where tb_pf.idPf = $idPf";

$rs_PF = mysqli_query($conn_bd_sim, $ClientePF) or die($mysqli_error($conn_bd_sim));

$row_rs_PF = mysqli_fetch_assoc($rs_PF);

?>



<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="formularioCAD.css">
    <title>Formulário CPF</title>
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
    </header>
    <section class="form-section-cpf">
    <h2>Dados Cadastrais</h2></br>
            <div class="form-group-cpf">
               <h1>CPF</h1>
                <p> <?php echo($row_rs_PF['cpf']);?> </p>
            </div>
            <br>
            <div class="form-group-cpf">
            <h1>Nome</h1>
            <p> <?php echo($row_rs_PF['nome']);?> </p>
            
            </div>
            <br>
            <div class="form-group-cpf">
            <h1>RG</h1>
            <p> <?php echo($row_rs_PF['rg']);?> </p>
            </div>
            <br>
           <!-- <div class="form-group-cpf">
            <h1>Data de Nascimento</h1>
            <p> <?php echo($row_rs_PF['nascimento']);?> </p>
            </div>
            <br>-->
            <div class="form-group-cpf">
            <h1>E-mail</h1>
            <p> <?php echo($row_rs_PF['email']);?> </p>
            </div>
            <br>
            <div class="form-group-cpf">
            <h1>Telefone</h1>
            <p> <?php echo($row_rs_PF['celular']);?> </p>
            </div>
            <br>
            <div class="form-group-cpf">
            <h1>Placa</h1>
            <p> <?php echo($row_rs_PF['placa']);?> </p>
            </div>
            <br>
            <div class="form-group-cpf">
            <h1>Veículo</h1>
            <p> <?php echo($row_rs_PF['marca']." ".$row_rs_PF['modelo']); ?></p>
                    
            </div>  
            <br>
            <div class="form-group-cpf">
            <h1>Cor do Carro</h1>
            <p> <?php echo($row_rs_PF['corCarro']);?> </p>
            </div>
            <br>
            <div class="form-group-cpf">
            <h1>Endereço</h1>
            <p> <?php echo($row_rs_PF['endereco']);?> </p>
            </div>
            <br>
            <!--<div class="form-group-cpf">
            <br>
            <h1>Colaborador</h1>
            <p> Rodrigo Santos</p>
            </div>
            <br>
            <div class="form-group-cpf">
            <h1>Problema</h1>
            <p> Pneu Furado </p>
            </div>
            <br>
            <div class="form-group-cpf">
            <h1>Data Inicio</h1>
            <p> 01/01/2024 </p>
            </div>
            <br>
            <div class="form-group-cpf">
            <h1>Data Fim</h1>
            <p> 01/07/2024 </p>
            </div>-->
            <div class="form-group-cpf">
            <h1>Status</h1>
            <p> Em Andamento </p>
            </div>
            <br>
        
            <input type="reset" value="Cancelar" onclick="window.location.href='ListaCadastro.php'">

    </section>
    <?php 
	mysqli_free_result($rs_PF);
	mysqli_close($conn_bd_sim);
	
	?>
</body>
</html>