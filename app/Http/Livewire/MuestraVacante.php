<?php

namespace App\Http\Livewire;

use Livewire\Component;

class MuestraVacante extends Component
{

    public $vacante;
    
    public function render()
    {
        return view('livewire.muestra-vacante');
    }
}
