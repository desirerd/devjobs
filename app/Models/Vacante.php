<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Vacante extends Model
{
    use HasFactory;

    // Definir que el campo ultimo_dia va a ser de tipo fecha, ya que por defecto lo coge como string

    protected $dates = ['ultimo_dia'];

    protected $fillable = [

        'titulo',
        'salario_id',
        'categoria_id',
        'empresa',
        'ultimo_dia',
        'descripcion',
        'imagen',
        'user_id'
    ];

    public function categoria(){

        return $this->belongsTo(Categoria::class);
    }

    public function salario(){

        return $this->belongsTo(Salario::class);
    }

    public function candidatos(){

        return $this->hasMany(Candidato::class)->orderBy('created_at', 'DESC');
    }

    public function reclutador(){

        return $this->belongsTo(User::class, 'user_id');
    }

}
