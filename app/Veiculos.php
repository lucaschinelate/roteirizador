<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Veiculos extends Model
{
    //public $timestamps = false;

    protected $fillable = [
        'marca','km_rodado','ano','modelo','capacida_peso','capacidade_cubagem','chassi','renavan'
    ];
}
