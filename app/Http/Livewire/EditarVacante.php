<?php

namespace App\Http\Livewire;

use App\Models\Categoria;
use App\Models\Salario;
use App\Models\Vacante;
use Carbon\Carbon;
use Livewire\Component;
use Livewire\WithFileUploads;

class EditarVacante extends Component
{

    // Usamos $vacante_id, porque si usamos id, no funciona, es un atributo de livewire interno que no nos deja usar.

    public $vacante_id;
    public $titulo;
    public $salario;
    public $categoria;
    public $empresa;
    public $ultimo_dia;
    public $descripcion;
    public $imagen;
    public $imagen_nueva;

    use WithFileUploads;

    protected $rules = [
        'titulo' => 'required|string',
        'salario' => 'required',
        'categoria' => 'required',
        'empresa' => 'required',
        'ultimo_dia' => 'required',
        'descripcion' => 'required',
        'imagen_nueva' => 'nullable|image|max:1024',

    ];

    // El campo nullable indica que el campo puede ir vacío, pero si tiene algo debe ser una imagen.

    public function mount(Vacante $vacante)
    {
        // A través del wire:model, conectamos cada variable con la B.D para mostrar los datos.
        // Por ejemplo, salario está guardado en BD como salario_id;

        // Instanciamos el componente

            $this->vacante_id = $vacante->id;
            $this->titulo = $vacante->titulo;
            $this->salario = $vacante->salario_id;
            $this->categoria = $vacante->categoria_id;
            $this->empresa = $vacante->empresa;
            $this->ultimo_dia = Carbon::parse($vacante->ultimo_dia)->format('Y-m-d');
            $this->descripcion = $vacante->descripcion;
            $this->imagen = $vacante->imagen;

    }

    public function editarVacante(Vacante $vacante)
    {
        $datos = $this->validate();

        // Si hay una nueva imagen

        if($this->imagen_nueva){
            $imagen = $this->imagen_nueva->store('public/vacantes');

            // Nos quedamos sólo con el nombre de la imagen, eliminamos la ruta

            $datos['imagen'] = str_replace('public/vacantes/', '', $imagen);
        }

        // Encontrar la vacante a editar

            $vacante = Vacante::find($this->vacante_id);

        // Asignar los valores

        $vacante->titulo = $datos['titulo'];
        $vacante->salario_id = $datos['salario'];
        $vacante->categoria_id = $datos['categoria'];
        $vacante->empresa = $datos['empresa'];
        $vacante->ultimo_dia = $datos['ultimo_dia'];
        $vacante->descripcion = $datos['descripcion'];

        // Comprueba si hay imagen nueva, sino deja la anterior.
        
        $vacante->imagen = $datos['imagen'] ?? $vacante->imagen;

        // Guardar la vacante

        $vacante->save();

        // Redireccionar

        session()->flash('mensaje','La vacante se actualizó correctamente');

        return redirect()->route('vacantes.index');
    }


    public function render()
    {
                // CONSULTAR BD
 
            $salarios = Salario::all();
            $categorias = Categoria::all();
        
          
        return view('livewire.editar-vacante', [
            'salarios' => $salarios,
            'categorias' => $categorias
            ]);
    }
}
