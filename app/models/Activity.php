<?php

class Activity extends \Phalcon\Mvc\Model
{

    /**
     *
     * @var integer
     */
    public $idact;

    /**
     *
     * @var string
     */
    public $judul_act;

    /**
     *
     * @var string
     */
    public $tgl_act;

    /**
     *
     * @var string
     */
    public $jam_act;

    /**
     *
     * @var string
     */
    public $note_act;

    /**
     *
     * @var integer
     */
    public $idkon;

    /**
     * Initialize method for model.
     */
    public function initialize()
    {
        $this->setSchema("cm");
        $this->setSource("activity");
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return Activity[]|Activity|\Phalcon\Mvc\Model\ResultSetInterface
     */
    public static function find($parameters = null): \Phalcon\Mvc\Model\ResultsetInterface
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return Activity|\Phalcon\Mvc\Model\ResultInterface|\Phalcon\Mvc\ModelInterface|null
     */
    public static function findFirst($parameters = null): ?\Phalcon\Mvc\ModelInterface
    {
        return parent::findFirst($parameters);
    }

}
