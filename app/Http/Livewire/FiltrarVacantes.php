<?php

namespace App\Http\Livewire;

use App\Models\Categoria;
use App\Models\Salario;
use Livewire\Component;

class FiltrarVacantes extends Component
{

    // Generamos estas variables porque vamos a recuperar lo que el usuario escriba desde el formulario de búsqueda.

    public $termino;
    public $categoria;
    public $salario;


    public function leerDatosFormulario(){

        $this->emit('terminosBusqueda',$this->termino, $this->categoria, $this->salario);
    }


    public function render()
    {

        // Consultamos salarios y categorías

        $salarios = Salario::all();
        $categorias = Categoria::all();

        return view('livewire.filtrar-vacantes',[
            'salarios' => $salarios,
            'categorias'=>$categorias
        ]);
    }
}
