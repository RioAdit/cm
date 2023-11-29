<?php

use Phalcon\Validation;
use Phalcon\Validation\Validator\Email as EmailValidator;

class Contact extends \Phalcon\Mvc\Model
{

    /**
     *
     * @var integer
     */
    public $idkon;

    /**
     *
     * @var string
     */
    public $tgl_dibuat;

    /**
     *
     * @var string
     */
    public $nama;

    /**
     *
     * @var integer
     */
    public $produk;

    /**
     *
     * @var integer
     */
    public $wilayah;

    /**
     *
     * @var string
     */
    public $tipe_kon;

    /**
     *
     * @var string
     */
    public $no_telp;

    /**
     *
     * @var string
     */
    public $email;

    /**
     * Validations and business logic
     *
     * @return boolean
     */
    public function validation()
    {
        $validator = new Validation();

        $validator->add(
            'email',
            new EmailValidator(
                [
                    'model'   => $this,
                    'message' => 'Please enter a correct email address',
                ]
            )
        );

        return $this->validate($validator);
    }

    /**
     * Initialize method for model.
     */
    public function initialize()
    {
        $this->setSchema("cm");
        $this->setSource("contact");
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return Contact[]|Contact|\Phalcon\Mvc\Model\ResultSetInterface
     */
    public static function find($parameters = null): \Phalcon\Mvc\Model\ResultsetInterface
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return Contact|\Phalcon\Mvc\Model\ResultInterface|\Phalcon\Mvc\ModelInterface|null
     */
    public static function findFirst($parameters = null): ?\Phalcon\Mvc\ModelInterface
    {
        return parent::findFirst($parameters);
    }

}
