<?php
    require './Connexion.php';
    require './QuestController.php';

    if (isset($_POST['SUBMIT_CODE']))
    {
        $bdd = new Connexion();
        $co = $bdd->openConnexion();

        $sql = ('
            SELECT q.*, r.reponse, r.valid
            FROM question as q, reponse as r, appartenir as ap, avoir, qcm 
            WHERE q.code = :id
            AND q.id = ap.id_question 
            AND r.id = ap.id 
            AND avoir.id = q.id
            AND avoir.id_qcm = qcm.id');

        $req = $co->prepare($sql);
        $req->execute([
            'id' => (string)$_POST['CODE']
        ]);
        $resultat = $req->fetchAll(PDO::FETCH_ASSOC);
        $resultat = json_encode($resultat);

        echo $resultat;
    }
?>