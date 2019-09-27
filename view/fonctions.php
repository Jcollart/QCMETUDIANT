<?php
//   include_once '../controller/QuestController.php';
//   $questcontroller = new QuestController;
//    $result = $questcontroller->test_code($_GET['id']);
include_once '../controller/Connexion.php';
$bdd = new Connexion();
    $co = $bdd->openConnexion();
?>

<?php

    if(isset($_POST['code'],$_POST['admin'])){
        if($_POST['code'] == "carolo2019"){
            echo 'success';
        } else {
            echo 'error';
        }
    }

    if(isset($_POST['name_team'], $_POST['good'], $_POST['final_timer'])){
        $sql = ('
            INSERT INTO `resultat`(`nom_team`, `good`, `final_time`) VALUES (:nom_team,:good,:final_time)
        ');
        $valeurs = [
            'nom_team' => $_POST['name_team'],
            'good' => $_POST['good'],
            'final_time' => $_POST['final_timer']
        ];

        $req = $co->prepare($sql);
        if($req->execute($valeurs)){
            echo 'success';
        } else {
            echo 'error';
        }
    }

    if(isset($_POST['id']) && isset($_POST['code'])){
        // Chercher dans le SQL suivant l'id et le code 
         // Donne moi le resultat de la question "$_POST['id']" et du code "$_POST['code']"

        //  $sql =(' 
        //  SELECT question.id ,question.code 
        //  FROM question , avoir, qcm 
        //  WHERE avoir.id = question.id 
        //  AND avoir.id_qcm = qcm.id 
        //  AND qcm.id = 93');
        //  $req = $connex->prepare($sql);
        //  $req->execute();
        //  $resultat = $req->fetch();
                  
        $sql = ('
            SELECT * FROM `question` WHERE `id` = :id and `code`= :code
        ');
        $req = $co->prepare($sql);
        $req->execute([
            'id' => $_POST['id'],
            'code' => $_POST['code']
        ]);
        $resultat = $req->fetch();
        $tab = [];
        $resultat1 = [];
        if($resultat != null ){
            // $tab[0] = 1;

            $sql = ('
            SELECT q.*, r.reponse, r.valid
            FROM question as q, reponse as r, appartenir as ap, avoir, qcm 
            WHERE q.id = ap.id_question 
            AND r.id = ap.id 
            AND avoir.id = q.id
            AND avoir.id_qcm = qcm.id
            AND q.id = :id');

            $req = $co->prepare($sql);
            $req->execute([
                'id' => $_POST['id']
            ]);
            $resultat1 = $req->fetchAll();
        }else{
            // $tab[0] = 0;
        }

        echo json_encode($resultat1);
    }

?>

    