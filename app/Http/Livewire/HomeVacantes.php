<?php

namespace App\Http\Livewire;

use App\Models\Vacante;
use Livewire\Component;

class HomeVacantes extends Component
{

    public $termino;
    public $categoria;
    public $salario;


    // Escucha , y cuando se emita el evento terminosbusqueda, te vas a la función "Buscar" 

    protected $listeners = ['terminosBusqueda' =>'buscar'];

    public function buscar($termino, $categoria, $salario){
        // Desde Componente Padre
        
        $this->termino = $termino;
        $this->categoria = $categoria;
        $this->salario = $salario;

    }

    public function render()
    {

        // Consultar la base de datos para obtener las vacantes

        //$vacantes = Vacante::all();

        // Construímos una búsqueda avanzada, con todos los criterios de búsqueda.
        // El when se ejecuta solamente si existe la variable termino, si la han escrito desde el formulario.
        // El término lo busca en título y también en empresa, por si queremos saber las vacantes de Samsung por ejemplo.
        
       $vacantes = Vacante::when($this->termino,function($query){
            $query->where('titulo', 'LIKE', "%" . $this->termino . "%");
        })

        ->when($this->termino, function($query){
            $query->orwhere('empresa', 'LIKE', "%" .  $this->termino. "%");
        })
        ->when($this->categoria, function($query){
            $query->where('categoria_id', $this->categoria);
        })

        ->when($this->salario, function($query){
            $query->where('salario_id', $this->salario);
        })

      
        
        ->paginate(20);

        // Además del paginate, se puede poner un get, sirven para traerse los registros que cumplan esa condición. 

        return view('livewire.home-vacantes',[
            'vacantes' => $vacantes
        ]);
    }
}
