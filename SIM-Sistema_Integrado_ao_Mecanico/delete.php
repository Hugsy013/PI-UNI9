<?php
require_once("conexaobd.php");
?>

<?php
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


</body>
</html>