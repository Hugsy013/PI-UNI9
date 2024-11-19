<?php
require_once("conexaobd.php");
?>

<?php
include("sessao_verifica.php");
$idAdmin = $_SESSION['idAdmin'];

$permissao = "SELECT * FROM tb_admin where idAdmin = {$idAdmin}";
$rs_permissao = mysqli_query($conn_bd_sim, $permissao) or die($mysqli_error($conn_bd_sim));
$row_rs_permissao = mysqli_fetch_assoc($rs_permissao);

if($row_rs_permissao['permissao'] != 'a' && $row_rs_permissao['permissao'] != 'e' && $row_rs_permissao['permissao'] != 'ce'){
    header("Location: index.php");
}

$veiculo = "SELECT * FROM tb_veiculo";

$rs_veiculo = mysqli_query($conn_bd_sim, $veiculo) or die(mysqli_error($conn_bd_sim));

$row_rs_veiculo = mysqli_fetch_assoc($rs_veiculo);

$cnpj_editar = "SELECT * FROM tb_pj WHERE idPj = '3'";

$rs_editar = mysqli_query($conn_bd_sim, $cnpj_editar) or die($mysqli_error($conn_bd_sim));

$row_rs_editar = mysqli_fetch_assoc($rs_editar);


if(isset($_POST['submit'])) {

$cnpj = $_POST['cnpj'];
$nome = $_POST['nome'];
$razaoSocial = $_POST['razaoSocial'];
$insEstadual = $_POST['insEstadual'];
$email = $_POST['email'];
$telefone = $_POST['telefone'];
$idVeiculo = $_POST['idVeiculo'];
$placa = $_POST['placa'];
$corCarro = $_POST['corCarro'];
$endereco = $_POST['endereco'];


$editar_dado = "UPDATE tb_pj SET cnpj = '$cnpj', nome = '$nome',
 razaoSocial = '$razaoSocial', insEstadual = '$insEstadual', email = '$email', celular = '$telefone',
  idVeiculo = '$idVeiculo', placa = '$placa', corCarro = '$corCarro', endereco = '$endereco' WHERE tb_pj.idPj = 3;";

$executar_dado = mysqli_query($conn_bd_sim, $editar_dado) or die($mysqli_error($conn_bd_sim));


/*$colaboradora = $_POST['colaborador'];
$problema = $_POST['problema'];

$inserir_pedido = "INSERT INTO tb_pedido (idPedido, idPf, idPj, resolvido, problema, colaborador, dataInicio, dataFim) VALUES (NULL, NULL, LAST_INSERT_ID(), '0', '$problema', '$colaborador', current_timestamp(), NULL)";

$executar_pedido = mysqli_query($conn_bd_sim, $inserir_pedido) or die($mysqli_error($conn_bd_sim));*/

if($executar_dado == true /*&& $executar_pedido == true*/){
	echo('<script> alert("Dado atualizado !! :)"); 
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
    <title>Formulário CNPJ</title>
</head>
<body>
    <h2>Dados Cadastrais</h2>
    <section class="form-section-cnpj">
       <form action="" method="post">
            <div class="form-group-cnpj">
                <label for="cnpj">CNPJ</label>
                <input type="text" id="cnpj" name="cnpj" value="<?php echo($row_rs_editar['cnpj']);?> " required 
            pattern="\d{2}\.\d{3}\.\d{3}/\d{4}-\d{2}" 
            title="Formato: 12.345.678/0001-90" 
            placeholder="00.000.000/0000-00">
            </div>
            <div class="form-group-cnpj">
                <label for="nome">Nome</label>
                <input type="text" name="nome" id="nome" value="<?php echo($row_rs_editar['nome']);?>" required>
            </div>
            <div class="form-group-cnpj">
                <label for="razaoSocial">Razão Social</label>
                <input type="text" name="razaoSocial" id="razaoSocial" value="<?php echo($row_rs_editar['razaoSocial']);?>" required>
            </div>
            <div class="form-group-cnpj">
                <label for="insEstadual">Inscrição Estadual</label>
                <input type="text" id="insEstadual" name="insEstadual" value="<?php echo($row_rs_editar['insEstadual']);?>"
            pattern="[0-9]{2}\.[0-9]{3}\.[0-9]{3}\-[0-9]{1}" 
            title="Formato: XX.XXX.XXX-X (ex: 12.345.678-9)">
            </div>
            <div class="form-group-cnpj">
                <label for="email">E-mail</label>
                <input type="email" name="email" id="email" value="<?php echo($row_rs_editar['email']);?>" required>
            </div>
            <div class="form-group-cnpj">
                <label for="telefone">Telefone</label>
                <input type="tel" id="telefone" name="telefone" value="<?php echo($row_rs_editar['celular']);?>"required 
                       pattern="\(?\d{2}\)?\s?\d{4,5}-?\d{4}" 
                       title="Formato: (XX) XXXXX-XXXX ou (XX) XXXX-XXXX">
            </div>
            <div class="form-group-cnpj">
                <label for="placa">Placa</label>
                <input type="text" name="placa" id="placa" value="<?php echo($row_rs_editar['placa']);?>" required placeholder="ABC1D23 ou ABC1D23">
            </div>
            <div class="form-group-cpf">
                <label for="idVeiculo">Veículo:</label>
                <select name="idVeiculo" id="idVeiculo">
                    <?php do {?>
                        <option value="<?php echo($row_rs_veiculo['idVeiculo'])?>" <?php if($row_rs_editar['idVeiculo'] == $row_rs_veiculo['idVeiculo']) {echo('selected');}?>> <?php echo($row_rs_veiculo['marca']." ".$row_rs_veiculo['modelo'])?></option>
                    <?php } while($row_rs_veiculo = mysqli_fetch_assoc($rs_veiculo))?>
                </select>
            </div>  
            <div class="form-group-cnpj">
                <label for="corCarro">Cor do Carro</label>
                <input type="text" name="corCarro" id="corCarro" value="<?php echo($row_rs_editar['corCarro']);?>">
            </div>
            <div class="form-group-cnpj">
                <label for="endereco">Endereço</label>
                <input type="text" name="endereco" id="endereco" value="<?php echo($row_rs_editar['endereco']);?>" placeholder="Rua Exemplo, 123">
            </div>
            <!-- <div class="form-group-cpf">
                <label for="colaborador">Colaborador responsável</label>
                <input type="text" name="colaborador" id="colaborador" value="">
            </div>
            <div class="form-group-cpf">
                <label for="problema">Problema:</label> <br>
                <textarea name="problema" id="problema" value=""rows="4" cols="50"></textarea>
            </div> -->
            <input type="submit" value="Enviar" name="submit" id="submit">
        </form> 
    </section>
    <?php 
	mysqli_free_result($rs_veiculo);
	mysqli_free_result($rs_permissao);
	mysqli_close($conn_bd_sim);
	
	?>
</body>
</html>