<?php

class Contact_History extends \Phalcon\Mvc\Model
{

    /**
     *
     * @var integer
     */
    public $idkh;

    /**
     *
     * @var integer
     */
    public $idkon;

    /**
     *
     * @var string
     */
    public $keterangan;

    /**
     *
     * @var string
     */
    public $waktu;

    /**
     * Initialize method for model.
     */
    public function initialize()
    {
        $this->setSchema("cm");
        $this->setSource("contact_history");
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return ContactHistory[]|ContactHistory|\Phalcon\Mvc\Model\ResultSetInterface
     */
    public static function find($parameters = null): \Phalcon\Mvc\Model\ResultsetInterface
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return ContactHistory|\Phalcon\Mvc\Model\ResultInterface|\Phalcon\Mvc\ModelInterface|null
     */
    public static function findFirst($parameters = null): ?\Phalcon\Mvc\ModelInterface
    {
        return parent::findFirst($parameters);
    }

}