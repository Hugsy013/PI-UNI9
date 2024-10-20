<?php
require_once("conexaobd.php");
?>

<?php

$veiculo = "SELECT * FROM tb_veiculo";

$rs_veiculo = mysqli_query($conn_bd_sim, $veiculo) or die($mysqli_error($conn_bd_sim));

$row_rs_veiculo = mysqli_fetch_assoc($rs_veiculo);


if(isset($_POST['cpf']) && isset($_POST['nome']) && isset($_POST['rg']) && isset($_POST['nascimento']) && isset($_POST['email']) && 
isset($_POST['telefone']) && isset($_POST['idVeiculo']) && isset($_POST['placa']) && isset($_POST['corCarro']) &&
isset($_POST['endereco']) && isset($_POST['colaborador']) && isset($_POST['problema'])) {

$cpf = $_POST['cpf'];
$nome = $_POST['nome'];
$rg = $_POST['rg'];
$nascimento = $_POST['nascimento'];
$email = $_POST['email'];
$telefone = $_POST['telefone'];
$idVeiculo = $_POST['idVeiculo'];
$placa = $_POST['placa'];
$corCarro = $_POST['corCarro'];
$endereco = $_POST['endereco'];

$inserir_pf = "INSERT INTO tb_pf (idPf, cpf, nome, rg, nascimento, email, celular, idVeiculo, placa, corCarro, endereco) 
VALUES (NULL, '$cpf', '$nome', '$rg', '$nascimento', '$email', '$telefone', '$idVeiculo', '$placa', '$corCarro', '$endereco');";

$executar_inserir = mysqli_query($conn_bd_sim, $inserir_pf) or die($mysqli_error($conn_bd_sim));


$colaborador = $_POST['colaborador'];
$problema = $_POST['problema'];

$inserir_pedido = "INSERT INTO tb_pedido (idPedido, idPf, idPj, resolvido, problema, colaborador, dataInicio, dataFim) VALUES (NULL, LAST_INSERT_ID(), NULL, '0', '$problema', '$colaborador', current_timestamp(), NULL)";

$executar_pedido = mysqli_query($conn_bd_sim, $inserir_pedido) or die($mysqli_error($conn_bd_sim));

if($executar_inserir == true && $executar_pedido == true){
	echo('<script> alert("Dado inserido !! :)"); 
	window.location.href="index.php";
	</script>');
} else {
	
}
	};



?>



<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Formulário CPF</title>
</head>
<body>
    <h2>Dados Cadastrais</h2>
    <section class="form-section-cpf">
        <form action="" method="post">
            <div class="form-group-cpf">
                <label for="cpf">CPF</label>
                <input type="text" id="cpf" name="cpf" required pattern="\d{3}\.\d{3}\.\d{3}-\d{2}" title="Formato: 123.456.789-10">
            </div>
            <div class="form-group-cpf">
                <label for="nome">Nome</label>
                <input type="text" name="nome" id="nome" required>
            </div>
            <div class="form-group-cpf">
                <label for="rg">RG</label>
                <input type="text" id="rg" name="rg" required 
                       pattern="\d{7,9}|\d{2}\.\d{3}\.\d{3}-\d{1}" 
                       title="O RG deve ter de 7 a 9 dígitos, ou no formato XX.XXX.XXX-X">
            </div>
            <div class="form-group-cpf">
                <label for="nascimento">Data de Nascimento</label>
                <input type="date" name="nascimento" id="nascimento" required>
            </div>
            <div class="form-group-cpf">
                <label for="email">E-mail</label>
                <input type="email" name="email" id="email" required>
            </div>
            <div class="form-group-cpf">
                <label for="telefone">Telefone</label>
                <input type="tel" id="telefone" name="telefone" required 
                       pattern="\(?\d{2}\)?\s?\d{4,5}-?\d{4}" 
                       title="Formato: (XX) XXXXX-XXXX ou (XX) XXXX-XXXX">
            </div>
            <div class="form-group-cpf">
                <label for="placa">Placa</label>
                <input type="text" name="placa" id="placa" required placeholder="ABC1D23 ou ABC1D23">
            </div>
            <div class="form-group-cpf">
                <label for="idVeiculo">Veículo:</label>
                <select name="idVeiculo" id="idVeiculo">
                    <?php do {?>
                        <option value="<?php echo($row_rs_veiculo['idVeiculo'])?>"> <?php echo($row_rs_veiculo['marca']." ".$row_rs_veiculo['modelo'])?></option>
                    <?php } while($row_rs_veiculo = mysqli_fetch_assoc($rs_veiculo))?>
                </select>
            </div>  
            <div class="form-group-cpf">
                <label for="corCarro">Cor do Carro</label>
                <input type="color" name="corCarro" id="corCarro">
            </div>
            <div class="form-group-cpf">
                <label for="endereco">Endereço</label>
                <input type="text" name="endereco" id="endereco" placeholder="Rua Exemplo, 123">
            </div> 
            <div class="form-group-cpf">
                <label for="colaborador">Colaborador responsável</label>
                <input type="text" name="colaborador" id="colaborador">
            </div>
            <div class="form-group-cpf">
                <label for="problema">Problema:</label> <br>
                <textarea name="problema" id="problema" rows="4" cols="50"></textarea>
            </div>

            <input type="submit" value="Enviar">
        </form>
    </section>
    <?php 
	mysqli_free_result($rs_veiculo);
	
	mysqli_close($conn_bd_sim);
	
	?>
</body>
</html>