<?php
    session_start();
    include_once 'Connexion.php';
   

    class QuestController{

        public function test_code($id){

            $bdd = new Connexion();
            $co = $bdd->openConnexion();
            
            $sql =(' 
            SELECT question.id ,question.code 
            FROM question , avoir, qcm 
            WHERE avoir.id = question.id 
            AND avoir.id_qcm = qcm.id 
            AND qcm.id = 93 ');
            $req = $co->prepare($sql);
            $req->execute(array(
                'id' => $id,
                'code'=> $code,
            ));
            $affiche = $req->fetch();
            return $affiche;
        }

        public function showResults(){

            $bdd = new Connexion();
            $co = $bdd->openConnexion();
            
            $sql =('SELECT * FROM resultat ORDER BY good DESC');
            $req = $co->prepare($sql);
            $req->execute();
            $affiche = $req->fetchAll(PDO::FETCH_ASSOC);
            return $affiche;
        }

        public function avgResults(){
            $bdd = new Connexion();
            $co = $bdd->openConnexion();
            
            $sql =('SELECT AVG(good) FROM resultat');
            $req = $co->prepare($sql);
            $req->execute();
            $affiche = $req->fetch();
            return $affiche;
        }

        public function affiche_qcm(){

            $bdd = new Connexion();
            $co = $bdd->openConnexion();

            $sql = "SELECT * FROM qcm";
            $req = $co->prepare($sql);
            $req->execute();
            $affiche = $req->fetchAll();
            return $affiche;
        }

        public function affiche_quizz($id){

            $bdd = new Connexion();
            $co = $bdd->openConnexion();
            $nombre = 1;  // on va afficher 1 résultats par page.
            if (!isset($limite)) $limite = 1; // si on arrive sur la page pour la première fois 
               // on met limite à 0.

            $sql =(' 
            SELECT DISTINCT q.id 
            FROM question as q, reponse as r, appartenir as ap, avoir, qcm
            WHERE q.id = ap.id_question 
            AND r.id = ap.id 
            AND avoir.id = q.id 
            AND avoir.id_qcm = qcm.id 
            AND qcm.id = :id');
            $req = $co->prepare($sql);
            $req->execute(array(
                'id' => $id
            ));
            $affiche = $req->fetchAll();
            return $affiche;
        }

        public function creationQcm($formArray){

            $titre = $_POST['titre'];

            $bdd = new Connexion();
            $co = $bdd->openConnexion();

            $sql = "INSERT INTO qcm(titre) VALUES(:titre)";

            $req = $co->prepare($sql);
            $req->execute(array(
                'titre' => $titre
            ));
            $sql2 = "SELECT * FROM qcm ORDER BY id DESC LIMIT 1";
            $sel = $co->prepare($sql2);
            $sel->execute();
            $q = $sel->fetch();
            return $q['id'];
        }

        public function getQuestion($id){
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
                'id' => $id
            ]);
            $resultat = $req->fetch();

            return $resultat;
        }

        public function addQuestion($formArray, $id){

            $label_question = $_POST['label_question'];
            $question = $_POST['question'];
            $code = $_POST['code'];
            $bdd = new Connexion();
            $co = $bdd->openConnexion();

            $sql = "INSERT INTO question(question, label_question, code) VALUES (:question, :label_question, :code)";

            $req = $co->prepare($sql);
            $req->execute(array(
                'question' => $question,
                'label_question' => $label_question,
                'code' => $code,
            ));

            $sql2 = "SELECT * FROM question ORDER BY id DESC LIMIT 1";
            $recup = $co->prepare($sql2);
            $recup->execute();
            $idquestion = $recup->fetch();

            $sql3 = "INSERT INTO avoir(id_qcm, id) VALUES(:idqcm, :idquest)";
            $link = $co->prepare($sql3);
            $link->execute(array(
                'idqcm' => $id,
                'idquest' => $idquestion['id']
            ));

            $sql4 = "SELECT * FROM question ORDER BY id DESC LIMIT 1";
            $sel = $co->prepare($sql4);
            $sel->execute();
            $q = $sel->fetch();
            return $q['id'];
            
            $connex->closeConnexion();
        }

        public function addReponse($formArray, $id){

            $bdd = new Connexion();
            $co = $bdd->openConnexion();

            $rep = $_POST['reponse'];
            if(empty($_POST['valid'])){
                $valid = 0;
            }else{
                $valid = TRUE;
            }

            $sql = "INSERT INTO reponse(reponse, valid) VALUES (:rep, :val)";

            $req = $co->prepare($sql);
            $req->execute(array(
                'rep' => $rep,
                'val' => $valid
            ));

            $sql2 = "SELECT * FROM reponse ORDER BY id DESC LIMIT 1";
            $recup = $co->prepare($sql2);
            $recup->execute();
            $idreponse = $recup->fetch();

            $sql3 = "INSERT INTO appartenir(id_question, id) VALUES(:idquestion, :id)";
            $link = $co->prepare($sql3);
            $link->execute(array(
                'idquestion' => $id,
                'id' => $idreponse['id']
            ));

            return $id;
            
            $connex->closeConnexion();

        }

        public function chercheid($id){
            $bdd = new Connexion();
            $co = $bdd->openConnexion();

            $sql = "
            SELECT qcm.id
            FROM qcm, avoir, question as q
            WHERE q.id = avoir.id
            AND qcm.id = avoir.id_qcm
            AND q.id = :id
            ";
            $recup = $co->prepare($sql);
            $recup->execute(array(
                'id' => $id
            ));
            $idqcm = $recup->fetch();
            return $idqcm['id'];
        }

        public function point_count($formArray){
           
            $formArray = array_slice($formArray, 0,sizeof($formArray) - 1);
            $compte = sizeof($formArray);
            $sous_total = array_sum($formArray);
            $total = ($sous_total / $compte) *100;
            return $total.'%';
        }

        public function delete($id){
            $bdd = new Connexion();
            $co = $bdd->openConnexion();

            $liensql = "DELETE FROM avoir WHERE id_qcm = :id";
            $req = $co->prepare($liensql);
            $req->execute(array(
                'id' => $id
            ));

            $sql = "DELETE FROM qcm WHERE id =:id";
            $sup = $co->prepare($sql);
            $sup->execute(array(
                'id' => $id
            ));
        }

        public function deleteQuestion($id){

            $bdd = new Connexion();
            $co = $bdd->openConnexion();

            //recherche id des réponses à supprimer
            $reponses = 'SELECT reponse.id FROM reponse, appartenir WHERE id_question = :id';
            $req = $co->prepare($reponse);
            $req->execute(array(
                'id' => $id
            ));
            $result = $rep->fetchAll(PDO::FETCH_ASSOC);

            //supprime relation entre question et réponse
            $liensql = 'DELETE FROM appartenir WHERE id_question = :id';
            $rep = $co->prepare($liensql);
            $rep->execute(array(
                'id' => $id
            ));

            //supprime relation entre question et qcm
            $lien2sql = 'DELETE FROM avoir WHERE id = :id';
            $sup = $co->prepare($lien2sql);
            $sup->execute(array(
                'id' => $id
            ));

            //supprime la question
            $sql = 'DELETE FROM question WHERE id = :id';
            $erase = $co->prepare($sql);
            $erase->execute(array(
                'id' => $id
            ));

            foreach($result as $r =>$v){

            $repsql = 'DELETE FROM reponse 
            WHERE id = :id';
            $bye = $co->prepare($repsql);
            $bye->execute(array(
                'id' => $v
            ));

            }

            $bdd->closeConnexion();
        }

        


    }
 ?>
