<?php

class Produk extends \Phalcon\Mvc\Model
{

    /**
     *
     * @var integer
     */
    public $idprod;

    /**
     *
     * @var string
     */
    public $nama_prod;

    /**
     * Initialize method for model.
     */
    public function initialize()
    {
        $this->setSchema("cm");
        $this->setSource("produk");
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return Produk[]|Produk|\Phalcon\Mvc\Model\ResultSetInterface
     */
    public static function find($parameters = null): \Phalcon\Mvc\Model\ResultsetInterface
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return Produk|\Phalcon\Mvc\Model\ResultInterface|\Phalcon\Mvc\ModelInterface|null
     */
    public static function findFirst($parameters = null): ?\Phalcon\Mvc\ModelInterface
    {
        return parent::findFirst($parameters);
    }

}