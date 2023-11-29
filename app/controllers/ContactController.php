<?php
declare(strict_types=1);

use Phalcon\Http\Response as Response;
// use Phalcon\Mvc\Model\Manager;
// use Phalcon\Mvc\Model\Query;
// use Phalcon\Mvc\Model\QueryInterface;
// use Phalcon\Di\InjectionAwareInterface;
// use Phalcon\DiInterface;
// use Phalcon\Mvc\Model\ManagerInterface;
// use Phalcon\Mvc\Model\RelationInterface;
// use Phalcon\Mvc\Model\Query\StatusInterface;
// use Phalcon\Mvc\Model\Query\BuilderInterface;

use PHPMailer\PHPMailer\PHPMailer;

require ('PHPMailer-master/src/Exception.php');
require ('PHPMailer-master/src/PHPMailer.php');
require ('PHPMailer-master/src/SMTP.php');

class ContactController extends \Phalcon\Mvc\Controller
{

    public function indexAction()
    {
        // $query = $this->modelsManager->executeQuery('SELECT c.*, p.*, w.*, t.* FROM contact c, produk p, wilayah_provinsi w, tipe_kontak t');
        

        // $idkon = $this->request->getPost('idkon');
        // $contact = contact::findFirst($idkon);
         
        // $q = 'SELECT p.nama_prod as produk, t.tipe as tp, w.nama as wilayah FROM contact c, produk p, tipe_kontak t, wilayah_provinsi w WHERE c.idkon=:idkon:';
        
        // $qry = $this->modelsManager->createQuery($q);

        $produk = produk::find(['column' => 'nama_prod']);
        $wilayah = wilayah_provinsi::find(['column' => 'nama']);
        $tipe = tipe_kontak::find(['column' => 'tipe']);
        
        $this->view->produk = $produk;
        $this->view->wilayah = $wilayah;
        $this->view->tipe = $tipe;

        // $type = $this->db->query( "SHOW COLUMNS FROM {$table} WHERE Field = '{$field}'" )->row( 0 )->Type;
        // preg_match("/^enum\(\'(.*)\'\)$/", $type, $matches);
        // $enum = explode("','", $matches[1]);
        // return $enum;

        // $query = $this->modelsManager->createQuery('SHOW COLUMNS FROM contact WHERE Field = wilayah');
        // $enum  = $query->execute();

        // $result = $db->query("SHOW COLUMNS FROM table LIKE 'column'");
        // if ($result) {
        //     $option_array = explode("','",preg_replace("/(enum|set)\('(.+?)'\)/","\\2", $result[0]->Type));
        // }
    }

    public function viewAction()
    {
        // $contact = contact::find(['order' => 'idkon DESC']);
        // $this->view->contact = $contact;

        // $sql = "SELECT c.idkon as idkon, c.tgl_dibuat as tgl_dibuat, c.nama as nama, p.nama_prod as produk, w.nama_prov as wilayah,  t.tipe as tipe_kon, c.no_telp as no_telp, c.email as email\n"
        //     . "FROM contact c\n"
        //     . "INNER JOIN produk p ON p.idprod = c.produk\n"
        //     . "INNER JOIN tipe_kontak t ON t.idtipe = c.tipe_kon\n";

        $query = $this->modelsManager->createQuery('
        SELECT c.idkon as idkon, c.tgl_dibuat as tgl_dibuat, c.nama as nama, p.nama_prod as produk, w.nama_prov as wilayah,  t.tipe as tipe_kon, c.no_telp as no_telp, c.email as email FROM contact as c INNER JOIN produk p ON p.idprod = c.produk INNER JOIN tipe_kontak t ON t.idtipe = c.tipe_kon INNER JOIN wilayah_provinsi as w ON w.idwilayah = c.wilayah
        ');

        $kon = $query->execute();

        $this->view->contact = $kon;
    }

    public function listAction()
    {
        // $contact = contact::find(['order' => 'idkon DESC']);
        // $this->view->contact = $contact;

        $query = $this->modelsManager->createQuery('
        SELECT c.idkon as idkon, c.tgl_dibuat as tgl_dibuat, c.nama as nama, p.nama_prod as produk, w.nama_prov as wilayah,  t.tipe as tipe_kon, c.no_telp as no_telp, c.email as email FROM contact as c INNER JOIN produk p ON p.idprod = c.produk INNER JOIN tipe_kontak t ON t.idtipe = c.tipe_kon INNER JOIN wilayah_provinsi as w ON w.idwilayah = c.wilayah
        ');

        $kon = $query->execute();

        $this->view->contact = $kon;
    }

    public function getAction()
    {
        $this->view->disable();

        $res = new Response;

        $idkon = $this->request->getPost('idkon');
        $contact = contact::findFirst($idkon);

        // $query = $this->modelsManager->createQuery('
        // SELECT c.idkon as idkon, c.tgl_dibuat as tgl_dibuat, c.nama as nama, p.nama_prod as produk, w.nama_prov as wilayah,  t.tipe as tipe_kon, c.no_telp as no_telp, c.email as email FROM contact as c INNER JOIN produk p ON p.idprod = c.produk INNER JOIN tipe_kontak t ON t.idtipe = c.tipe_kon INNER JOIN wilayah_provinsi as w ON w.idwilayah = c.wilayah WHERE c.idkon=":idkon:"
        // ');

        // $kon = $query->execute();

        // $this->view->contact = $kon;

        // foreach($kon as $k){
        //     $produk = $k->produk;
        //     $wilayah = $k->wilayah;
        //     $tipe_kon = $k->tipe_kon;
        // }

        $res->setContent( json_encode( array(
            'idkon'=>$contact->idkon,
            'tgl_dibuat' => $contact->tgl_dibuat,
            'nama' => $contact->nama,
            'produk' => $contact->produk,
            'wilayah' => $contact->wilayah,
            'tipe_kon' => $contact->tipe_kon,
            'no_telp' => $contact->no_telp,
            'email' => $contact->email,
        ) ) );

        return $res;
    }

    public function saveAction()
    {
        $this->view->disable();

        $res = new Response;

        $create = new contact();
        
        // $create = $this->modelsManager->createQuery('INSERT INTO contact(idkon, tgl_dibuat, nama, produk, wilayah, tipe_kontak, no_hp, email) VALUES (NULL, CURRENT_TIMESTAMP(), nama, produk, wilayah, tipe_kon, no_telp, email)');
        // $create .= $this->modelsManager->createQuery('INSERT INTO contact_history(idkh, idkon, keterangan, waktu) VALUES (NULL, idkon, ket, CURRENT_TIMESTAMP())');

        // $create = $this->modelsManager->createQuery('INSERT INTO contact(idkon, tgl_dibuat, nama, produk, wilayah, tipe_kontak, no_hp, email) VALUES (NULL, CURRENT_TIMESTAMP(), :nama:, :produk:, :wilayah:, :tipe_kon:, :no_telp:, :email:)');

        $create->assign(array(
            'nama' => $this->request->getPost('nama'),
            'produk' => $this->request->getPost('produk'),
            'wilayah' => $this->request->getPost('wilayah'),
            'tipe_kon' => $this->request->getPost('tipe_kon'),
            'no_telp' => $this->request->getPost('no_telp'),
            'email' => $this->request->getPost('email'),
            // 'keterangan' => 'SAVE'
        ));

        $action = $create->save();

        if(! $action){
            $teturn = 0;
            // $return = array('return' => false, 'msg' => 'tidak tersimpan');
        }else{
            // $return = array('return' => true);
            $return = 1;
        }

        $res->setContent(json_encode($return));
        // $res->setContent($return);

        return $res;
    }

    public function updateAction()
    {
        $this->view->disable();

        $res = new Response;

        $idkon = $this->request->getPost("idkon");

        $contact = contact::findFirst($idkon);

        $contact->idkon = $idkon;
        $contact->nama = $this->request->getPost("nama");
        $contact->produk = $this->request->getPost('produk');
        $contact->wilayah = $this->request->getPost('wilayah');
        $contact->tipe_kon = $this->request->getPost('tipe_kon');
        $contact->no_telp = $this->request->getPost('no_telp');
        $contact->email = $this->request->getPost('email');

        $action = $contact->save();

        if(! $action){
            $return = 0;
            // $return = array('return' => false, 'msg' => 'Contact is not updated!');
        }else{
            // $return = array('return' => true);
            $return = 1;
        }

        $res->setContent(json_encode($return));

        return $res;
    }

    public function deleteAction()
    {
        $this->view->disable();

        $res = new Response();

        $idkon = $this->request->getPost('idkon');
        $contact = contact::findFirst($idkon);

        if(! $contact->delete()){
            $return = array('return' => false, 'msg' => 'Contact is not deleted');
        }else{
            $return = array('return' => true);
        }

        $res->setContent(json_encode($return));

        return $res;
    }

    public function profileAction()
    {
        $produk = produk::find(['column' => 'nama_prod']);
        $wilayah = wilayah_provinsi::find(['column' => 'nama_prov']);
        $tipe = tipe_kontak::find(['column' => 'tipe']);
        // $history = contact_history::find(['column' => 'keterangan']);
        
        // $idkon = $this->request->getPost('idkon');
        // $contact = contact_history::findFirst($idkon);
        
        // $his = 'SELECT h.idkh, h.idkon, h.keterangan, h.waktu FROM contact_history h INNER JOIN contact c ON c.idkon=h.idkon WHERE c.idkon=":idkon:"';

        // $history = $this->modelsManager->executeQuery($his);

        // $this->view->history = $history;

        $idkon = $this->request->getPost('idkon');
        $history = contact_history::findByidkon($idkon);
        $note = note::findByidkon($idkon);
        $act = activity::findByidkon($idkon);
        
        $this->view->produk = $produk;
        $this->view->wilayah = $wilayah;
        $this->view->tipe = $tipe;
        $this->view->history = $history;
        $this->view->note = $note;
        $this->view->act = $act;
    }

    public function getProfileAction()
    {
        $this->view->disable();

        $res = new Response;

        $idkon = $this->request->getPost('idkon');
        $contact = contact::findFirstByIdkon($idkon);

        $res->setContent( json_encode( array(
            'idkon'=>$contact->idkon,
            'tgl_dibuat' => $contact->tgl_dibuat,
            'nama' => $contact->nama,
            'produk' => $contact->produk,
            'wilayah' => $contact->wilayah,
            'tipe_kon' => $contact->tipe_kon,
            'no_telp' => $contact->no_telp,
            'email' => $contact->email,
        ) ) );

        return $res;
        
        // $history = contact_history::findFirst($idkon);

        // $con = contact_history::query()
        //     ->where('idkon = :idkon:')
        //     ->bind([
        //         'idkon' => $contact->idkon,
        //     ])
        //     ->execute();

        // $history = contact_history::find(array(
        //     [
        //         'columns'    => '*',
        //         "conditions" => "idkon = ?1",
        //         "bind"       => array(1 => $idkon)
        //     ]
        // ));
        
        // $hist = contact_history::findFirst(
        //     [
        //         'columns'    => '*',
        //         'conditions' => 'idkon = ?1',
        //         'bind'       => [
        //             1 => $contact->idkon
        //         ]
        //     ]
        // );

        // $history = $hist->toArray();

        // $query = 'SELECT c.idkon as idkon, c.tgl_dibuat as tgl_dibuat, c.nama as nama, p.nama_prod as produk, w.nama_prov as wilayah,  t.tipe as tipe_kon, c.no_telp as no_telp, c.email as email FROM contact c INNER JOIN produk p ON p.idprod = c.produk INNER JOIN tipe_kontak t ON t.idtipe = c.tipe_kon INNER JOIN wilayah_provinsi w ON w.idwilayah = c.wilayah WHERE c.idkon=":idkon:"';
        
        // $his = 'SELECT h.idkh, h.idkon, h.keterangan, h.waktu FROM contact_history h WHERE h.idkon=":idkon:"';

        // $q = 'SELECT h.idkh as idkh, h.keterangan as keterangan, h.waktu as waktu FROM contact_history h LEFT JOIN contact c ON c.idkon=h.idkon WHERE c.idkon=:idkon:';

        // $his = $this->modelsManager->createQuery($q);

        // $tory = $his->execute();

        // $qh = $his->execute(['idkon' => $contact->idkon]);

        // foreach ($qh as $q) {
        //     $idkh = $q->idkh;
        //     $keterangan = $q->ketetangan;
        //     $waktu = $q->waktu;
        // }

        // $this->view->contact = $qh;

        // $tory = $his->execute();

        // $this->view->history = $history;
    }

    public function noteAction()
    {
        $idkon = $this->request->getPost('idkon');
        $note = note::findByidkon($idkon);
        
        $this->view->note = $note;
    }

    public function saveNoteAction()
    {
        $this->view->disable();

        $res = new Response;

        $newNote = new note();

        $newNote->assign(array(
            'note' => $this->request->getPost('note'),
            'idkon' => $this->request->getPost('idkon'),
        ));

        $action = $newNote->save();

        if(! $action){
            $return = 0;
        }else{
            $return = 1;
        }

        $res->setContent(json_encode($return));

        return $res;
    }

    public function deleteNoteAction()
    {
        $this->view->disable();

        $res = new Response();

        $idnote = $this->request->getPost('idnote');
        $note = note::findFirst($idnote);

        if(! $note->delete()){
            $return = 0;
            // $return = array('return' => false, 'msg' => 'Note is not deleted!');
        }else{
            $return = 1;
            // $return = array('return' => true);
        }

        $res->setContent(json_encode($return));

        return $res;
    }

    public function activityAction()
    {
        $idkon = $this->request->getPost('idkon');
        $act = activity::findByidkon($idkon);
        
        $this->view->act = $act;
    }

    public function saveActAction()
    {
        $this->view->disable();

        $res = new Response;

        $newAct = new activity();

        $newAct->assign(array(
            'judul_act' => $this->request->getPost('judul_act'),
            'tgl_act' => $this->request->getPost('tgl_act'),
            'jam_act' => $this->request->getPost('jam_act'),
            'note_act' => $this->request->getPost('note_act'),
            'idkon' => $this->request->getPost('idkon'),
        ));

        $action = $newAct->save();

        if(! $action){
            $return = 0;
        }else{
            $return = 1;
        }

        $res->setContent(json_encode($return));

        return $res;
    }

    public function deleteActAction()
    {
        $this->view->disable();

        $res = new Response();

        $idact = $this->request->getPost('idact');
        $act = activity::findFirst($idact);

        if(! $act->delete()){
            $return = 0;
            // $return = array('return' => false, 'msg' => 'Activity is not deleted!');
        }else{
            $return = 1;
            // $return = array('return' => true);
        }

        $res->setContent(json_encode($return));

        return $res;
    }

    public function sendMailAction()
    {
        $res = new Response();
        
        // Posted Inputs
        $nama = $_POST['nama'];
        $to = $_POST['to'];
        $subject = $_POST['sub'];
        $message = $_POST['con'];

        //init data
        $mail = new PHPMailer;
        $mail->isSMTP();
        $mail->Username = "arynalv1@gmail.com"; // Replace with your mail id
        $mail->Password = "cmtj msrd irxs diad"; //Replace with your mail pass
        $mail->SMTPAuth = true;  // authentication enabled
        $mail->SMTPSecure = 'tls'; // secure transfer enabled REQUIRED for GMail
        $mail->SMTPAutoTLS = false;
        $mail->Host = 'smtp.gmail.com';
        $mail->Port = 587;
        $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;   

        //Recipients
        $mail->setFrom('arynalv1@gmail.com', 'Rio');
        $mail->addAddress($to, $nama);  //add to email  
        $mail->addReplyTo($to, $nama);  //add replay to email

        // Content
        $mail->isHTML(true);  // Set email format to HTML
        $mail->Subject = $subject;
        $mail->Body    = $message;

        if(! $mail->send()){
            $return = 0;
            // $return = array('return' => false, 'msg' => 'Mail not sent!');
        }else{
            $return = 1;
            // $return = array('return' => true);
        }

        $res->setContent(json_encode($return));

        return $res;

    }

    public function dlExamAction()
    {
        // Initialize a file URL to  
        // the variable  
        $url =  
        'https://write.geeksforgeeks.org/wp-content/uploads/gfg-40.png';  
            
        // Use basename() function to  
        // return the file   
        $file_name = basename($url);  
            
        // Use file_get_contents() function  
        // to get the file from url and use  
        // file_put_contents() function to  
        // save the file by using base name  
        if(file_put_contents( $file_name,  
            file_get_contents($url))) {  
            echo "File downloaded successfully";  
        }  
        else {  
            echo "File downloading failed.";  
        } 
        
        // if (isset($_GET['file'])) {
        //     $file = $_GET['file'];
        //     if (file_exists($file) && is_readable($file) && preg_match('/\.csv$/',$file)) {
        //         header('Content-Type: text/csv');
        //         header("Content-Disposition: attachment; filename=\"$file\"");
        //         readfile($file);
        //         }
        //     }
    }

    public function mapDataAction()
    {
        
    }

    public function mappingAction()
    {
        // $file = $_POST['file'];
        
        // if (($open = fopen($file, "r")) !== false) {
        //     while (($data = fgetcsv($open, 1000, ",")) !== false) {
        //         $array[] = $data;
        //     }
         
        //     fclose($open);
        // }
    }
    
    public function importAction()
    {
        
    }

}