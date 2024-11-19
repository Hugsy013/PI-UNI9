<?php
require_once("conexaobd.php");
?>

<?php
include("sessao_verifica.php");
$idAdmin = $_SESSION['idAdmin'];

$permissao = "SELECT * FROM tb_admin where idAdmin = {$idAdmin}";
$rs_permissao = mysqli_query($conn_bd_sim, $permissao) or die($mysqli_error($conn_bd_sim));
$row_rs_permissao = mysqli_fetch_assoc($rs_permissao);

if($row_rs_permissao['permissao'] != 'a' && $row_rs_permissao['permissao'] != 'd'){
    header("Location: index.php");
}
if (isset ($_GET ['idPf'])){
    $idPf = $_GET ['idPf'];

}

$PF = "DELETE FROM tb_pf WHERE idPf = $idPf";

$rs_veiculo = mysqli_query($conn_bd_sim, $PF) or die($mysqli_error($conn_bd_sim));

?>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Excluir registro</title>
</head>

<body>

<h1>Excluir registro</h1>
    <script>
    alert("Excluido com sucesso");
    window.location.href="ListaCadastro.php";
    </script>
<?php
mysqli_free_result($rs_permissao);

?>

</body>
</html>