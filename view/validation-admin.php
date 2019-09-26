<?php


  include_once '../controller/QuestController.php';
  $questcontroller = new QuestController;
  $bdd = new Connexion();
  $co = $bdd->openConnexion();

$nom_team = isset($_POST['nom_team']) ? $_POST['nom_team'] : NULL;
$password = isset($_POST['password']) ? $_POST['password'] : NULL;

$req = $co->prepare('SELECT id_etudiant, password FROM etudiant WHERE nom_team = :nom_team');
$req->execute(array(
    'nom_team' => $nom_team));
$resultat = $req->fetch();
$req-> closeCursor();


if (!$resultat)
{
    echo "J'ai rien reçu, il y a un pb";
}
else{

  if ($_POST['password'] == $resultat['password']) {
      session_start();
      $_SESSION['id_etudiant'] = $resultat['id_etudiant'];
      $_SESSION['nom_team'] = $nom_team;

      header('Location: quizz.php');

  }
  else {
      echo 'Mauvais identifiant ou mot de passe !';
  }
}


?>
