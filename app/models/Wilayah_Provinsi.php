<?php

class Wilayah_Provinsi extends \Phalcon\Mvc\Model
{

    /**
     *
     * @var string
     */
    public $idwilayah;

    /**
     *
     * @var string
     */
    public $nama_prov;

    /**
     * Initialize method for model.
     */
    public function initialize()
    {
        $this->setSchema("cm");
        $this->setSource("wilayah_provinsi");
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return WilayahProvinsi[]|WilayahProvinsi|\Phalcon\Mvc\Model\ResultSetInterface
     */
    public static function find($parameters = null): \Phalcon\Mvc\Model\ResultsetInterface
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return WilayahProvinsi|\Phalcon\Mvc\Model\ResultInterface|\Phalcon\Mvc\ModelInterface|null
     */
    public static function findFirst($parameters = null): ?\Phalcon\Mvc\ModelInterface
    {
        return parent::findFirst($parameters);
    }

}