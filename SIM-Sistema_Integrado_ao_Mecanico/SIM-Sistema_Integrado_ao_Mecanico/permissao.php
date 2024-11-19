<?php require_once("conexaobd.php");?>
<?php
session_start();

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
if ($row_rs_permissao['permissao'] == 'r' || $row_rs_permissao['permissao'] == 'a' && $row_rs_permissao['permissao'] != 'c'){

} 







?>