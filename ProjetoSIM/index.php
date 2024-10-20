<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastro cliente</title>
</head>
<body>
    <h2>Iicie seu cadastro</h2>
    <a href="cpf.php" class="buttton">CPF</a>
    <a href="cnpj.php" class="buttton">CNPJ</a>
</body>
</html>

<!--
 - Pontos a verificar:
 
    * Vamos iserir no formulário o "idpf, idPj" e"idVeiculo"? Se sim de que forma?
    
    * Para CPF,RG CNPJ, utilizei o tipo text com o "pattern" que básicamente evita o erro, caso tenha o núemero zero a esquerda ou tenha variações de quantidades de números como o RG.
    * Todos os campos serão obrigadórios?
    * Verificar a necessidade de adicionar mais "class" ou 'ids', já pensado em facilitar o CSS.
    * No imput Telefole, devemos considerar apenas celular?
    * No input corCarro, vamos utilizar a paleta de cor ou melhor utilziar "text" e atribuir apenas o nome da cor?
    * Confirmar se os nomes dos titulos H2 e buttons estão de acordo.
    * Inseri o placeholder em alguns campos para auxiliar na acessibilidade. Considerar se é mesmo viável.
    * Na inscrição estadual eu não coloquei como required, pois pelo que pesquisei nem todos os CNPJs tem, mas vale confirmar a informação.
    * Nos buttons da página index vamos utilizar "_blank" para abrir outra aba, ou deixamos assim?
-->