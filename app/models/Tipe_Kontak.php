<?php

class Tipe_Kontak extends \Phalcon\Mvc\Model
{

    /**
     *
     * @var integer
     */
    public $idtipe;

    /**
     *
     * @var string
     */
    public $tipe;

    /**
     * Initialize method for model.
     */
    public function initialize()
    {
        $this->setSchema("cm");
        $this->setSource("tipe_kontak");
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return TipeKontak[]|TipeKontak|\Phalcon\Mvc\Model\ResultSetInterface
     */
    public static function find($parameters = null): \Phalcon\Mvc\Model\ResultsetInterface
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return TipeKontak|\Phalcon\Mvc\Model\ResultInterface|\Phalcon\Mvc\ModelInterface|null
     */
    public static function findFirst($parameters = null): ?\Phalcon\Mvc\ModelInterface
    {
        return parent::findFirst($parameters);
    }

}