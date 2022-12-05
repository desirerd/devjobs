<?php

namespace App\Http\Livewire;

use App\Models\Vacante;
use Livewire\Component;

class MostrarVacante extends Component
{
 
    /* Indicamos que métodos son los que vamos a escuchar */
 
    protected $listeners = ['eliminarVacante'];


    public function eliminarVacante(Vacante $vacante){

        $vacante->delete();
    }

    public function render()
    {

        $vacantes = Vacante::where('user_id',auth()->user()->id)->paginate(10);
        return view('livewire.mostrar-vacante',[
            'vacantes' => $vacantes
        ]);
    }
}
