<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Motoristas extends Model
{
    //

    protected $fillable = [
        'cpf', 'nome', 'data_admissao', 'telefone', 'numero_cnh', 'data_validade_cnh', 'tipo_contrato'
    ];
}
