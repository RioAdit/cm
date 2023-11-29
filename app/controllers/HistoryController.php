<?php
declare(strict_types=1);

class HistoryController extends \Phalcon\Mvc\Controller
{

    public function indexAction()
    {

    }

    public function getHistoryAction()
    {
        $this->view->disable();

        $res = new Response;

        $idkon = $this->request->getPost('idkon');
        $history = contact_history::findFirst($idkon);

        $his = $this->modelsManager->createQuery('SELECT h.idkh as idkh, h.keterangan as keterangan, h.waktu as waktu FROM contact_history h, contact c WHERE c.idkon=":idkon:"');

        $tory = $his->execute();

        $qh = $his->execute(['idkon' => $history->idkon]);

        foreach ($qh as $q) {
            $ket = $q->ket;
            $waktu = $q->waktu;
        }

        $res->setContent( json_encode( array(
            'idkh' => $history->idkh,
            'keterangan' => $history->keterangan,
            'waktu' => $history->waktu,
        ) ) );

        return $res;
    }

}